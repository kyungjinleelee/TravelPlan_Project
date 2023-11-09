package com.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.config.RedisConfig;
import com.dao.MemberDAO;
import com.dto.MemberDTO;
import com.mail.MailHandler;
import com.mail.TempKey;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO dao;
	@Autowired
	JavaMailSender mailSender;
	@Autowired
	private RedisConfig redis;
	
	
	@Transactional
	@Override
	public void register(MemberDTO dto) throws Exception {
		RedisTemplate<String, Object> redisTemplate = redis.getRedisTemplate();
		
		// 단방향 암호화 알고리즘
		String salt = getSalt();
		dto.setSalt(salt);
		String newPw = getEncrypt(dto.getPasswd(), dto.getSalt());
		dto.setPasswd(newPw);
		
		// 랜덤 문자열 생성 -> mail_key 컬럼에 넣기
		String mail_key = new TempKey().getKey(30, false); // 랜덤 키 길이 30
//		dto.setMail_key(mail_key);
		
		redisTemplate.opsForValue().set(dto.getUserID(), mail_key, 3, TimeUnit.MINUTES); // 유효시간 3분인 키값 생성
		
		// 회원가입
		dao.register(dto);
//		dao.updateMailKey(dto);
		
		// 회원가입 완료 후 인증 이메일 발송
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[여담 인증메일 입니다.]"); // 메일 제목
		sendMail.setText( // 메일 내용
				"<h1>여담 메일 인증</h1>" +
				"<br>안녕하세요 "+ dto.getUserID() +"님. 여담 가입을 환영합니다!" +
				"<br>아래 [이메일 인증 확인]을 눌러주세요." +
				"<br><a href='http://localhost:8091/app/registerEmail?userID="+dto.getUserID()+"&email=" + dto.getEmail() +
				"&mail_key=" + mail_key +
				"' target='_black'>이메일 인증 확인</a>");
		sendMail.setFrom("pjtravelplan@gmail.com", "TravelPlan"); // 보내는 사람
		sendMail.setTo(dto.getEmail()); // 받는 사람
		sendMail.send(); // 메일 보내기

	}
	
	// 이메일당 가입된 아이디 개수
	@Override
	public int idPerEmailCount(String email) {
		int num = dao.idPerEmailCount(email);
		if(num >= 3) {
			return 0;
		}
		return 1;
	}
	
	//id 중복 체크
	@Override
	public MemberDTO idCheck(String userID) {
		return dao.idCheck(userID);
	}
	// 로그인
	@Transactional
	@Override
	public MemberDTO login(HashMap<String, String> map) {
		String userID = map.get("userID");
		String salt = dao.selectSalt(userID);
		String newPw = getEncrypt(map.get("passwd"), salt);
		
		HashMap<String, String> resultMap = new HashMap<String, String>();
		resultMap.put("userID", userID);
		resultMap.put("passwd", newPw);
		
		return dao.login(resultMap);
	}

	// 이메일 인증을 위한 랜덤번호 저장 - redis로 대체
	@Override
	public int updateMailKey(MemberDTO dto) throws Exception {
//		return dao.updateMailKey(dto); redis로 대체
		return 0;
	}

	// 메일 인증 후 mail_auto 0 -> 1 변경
	@Override
	public int updateMailAuth(MemberDTO dto) throws Exception {
		RedisTemplate<String, Object> redisTemplate = redis.getRedisTemplate();
		
		// 인증 키 확인
		String mail_key = (String) redisTemplate.opsForValue().get("passwdtest");
		
		if(mail_key == null) { // 인증키 timeout
			return 0;
		}
		if(!mail_key.equals(dto.getMail_key())) { // DB에 저장된 인증키와 url에 전달된 인증키가 다름
			return 0;
		}
		
		redisTemplate.delete(dto.getUserID()); // 인증 후 키값 초기화
		return dao.updateMailAuth(dto);
	}

	// 로그인 시 인증 유무 체크
	@Override
	public int emailAuthFail(String userID) throws Exception {
		return dao.emailAuthFail(userID);
	}

	// 아이디 찾기
	@Override
	public List<MemberDTO> findId(MemberDTO dto) {
		return dao.findId(dto);
	}
	
	// 비밀번호 찾기
	@Transactional
	@Override
	public int findPw_email(MemberDTO dto) throws Exception {
		RedisTemplate<String, Object> redisTemplate = redis.getRedisTemplate();
		// 랜덤 문자열 생성 후 mail_key 컬럼에 넣기
		String mail_key = new TempKey().getKey(30, false); // 랜덤 키 길이
//		dto.setMail_key(mail_key);
		
//		dao.updateMailKey(dto);
		redisTemplate.opsForValue().set(dto.getUserID(), mail_key, 3, TimeUnit.MINUTES); // 유효시간 3분인 키값 생성
		
		// 이메일, 아이디 일치 여부 확인
		int num = dao.findPw_email(dto);
		if(num==0) { // 이메일, 아이디 일치 X
			return 0;
		}
		
		// 이메일 인증 여부 확인
		int num2 = dao.emailAuthFail(dto.getUserID());
		if(num2==0) { // 이메일 인증 X
			return 1;
		}
		
		// 비밀번호 재설정용 이메일 전송
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[TravelPlan 비밀번호 재설정]"); // 메일 제목
		sendMail.setText( // 메일 내용
				"<h1>TravelPlan 비밀번호를 재설정합니다.</h1>" +
				"<br>TravelPlan 비밀번호 재설정하려면 아래 [비밀번호 재설정]을 눌러주세요." +
				"<br><br><a href='http://localhost:8091/app/resetPw?email=" + dto.getEmail() +
				"&mail_key=" + mail_key + "&userID=" + dto.getUserID() +
				"' target='_black'>비밀번호 재설정</a>");
		sendMail.setFrom("pjtravelplan@gmail.com", "TravelPlan"); // 보내는 사람
		sendMail.setTo(dto.getEmail()); // 받는 사람
		sendMail.send(); // 메일 보내기
		return 2;
	}

	// 인증키 확인
	@Override
	public int checkKey(MemberDTO dto) {
//		return dao.checkKey(dto);
		RedisTemplate<String, Object> redisTemplate = redis.getRedisTemplate();
		
		// redis로 변경
		String mail_key = (String) redisTemplate.opsForValue().get(dto.getUserID());
		
		if(mail_key == null) { // 인증키 timeout
			return 0; 
		}
		if(!mail_key.equals(dto.getMail_key())) { // 저장된 인증키와 메일에 포함된 인증키가 다를 때
			return 0;
		}
		
		redisTemplate.delete(dto.getUserID()); // 인증 후 키값 초기화
		return 1;
	}
	
	// 비밀번호 재설정
	@Transactional
	@Override
	public int newPw(MemberDTO dto) {
		String salt = getSalt(); // salt 생성
		dto.setSalt(salt); // dto에 salt 저장
		String newPw = getEncrypt(dto.getPasswd(), salt); // 입력받은 pw 암호화
		dto.setPasswd(newPw); // 암호화 된 비밀번호 저장
		
		int num = dao.newPw(dto); // 비밀번호 재설정
//		int num2 = dao.resetMailKey(dto); // 메일 인증키 만료
		
//		if(num == 0 || num2 == 0) {
		if(num == 0) { // 비밀번호 재설정 실패
			return 0;
		}
		return 1;
	}
	
	// 회원탈퇴 - 비밀번호 일치 확인
	@Transactional
	@Override
	public String checkPw(HashMap<String, String> map) {
		String userID = map.get("userID");
		String salt = dao.selectSalt(userID);
		
		String inputPw = getEncrypt(map.get("inputPw"), salt);
		
		HashMap<String, String> resultMap = new HashMap<String, String>();
		resultMap.put("userID", userID);
		resultMap.put("inputPw", inputPw);
		String pw = dao.checkPw(resultMap);
		
		return pw;
	}

	// 단방향 암호화 - salt값 생성
	public String getSalt() {
		// 1. Random, slat 생성
		SecureRandom sr = new SecureRandom();
		byte[] salt = new byte[20];
		
		// 2. 난수 생성
		sr.nextBytes(salt);
		
		// 3. byte To String (10진수 문자열로 변경)
		StringBuffer sb = new StringBuffer();
		for(byte b : salt) {
			sb.append(String.format("%02x", b));
		}
		
		return sb.toString();
	}
	
	// 단방향 암호화 - SHA-256 알고리즘 적용
	public String getEncrypt(String pw, String salt) {
		String result = "";
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");

			// pwd+salt 적용 전
//			System.out.println("PWD+slat 적용 전 : "+pw+salt);
			
			md.update((pw+salt).getBytes());
			byte[] pwSalt = md.digest();
			
			StringBuffer sb = new StringBuffer();
			for(byte b : pwSalt) {
				sb.append(String.format("%02x", b));
			}
			
			result = sb.toString();
			
			// pwd+salt 적용 후
//			System.out.println("PWD+slat 적용 후 : "+result);
		} catch(NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
//		System.out.println("result : "+result);
		return result;
	}


}
