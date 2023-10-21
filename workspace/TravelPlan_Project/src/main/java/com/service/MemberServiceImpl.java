package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

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
	
	@Override
	public void register(MemberDTO dto) throws Exception {
		// 랜덤 문자열 생성 -> mail_key 컬럼에 넣기
		String mail_key = new TempKey().getKey(30, false); // 랜덤 키 길이
		dto.setMail_key(mail_key);
		
		// 회원가입
		dao.register(dto);
		dao.updateMailKey(dto);
		
		// 회원가입 완료 후 인증 이메일 발송
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[TravelPlan 인증메일 입니다.]"); // 메일 제목
		sendMail.setText( // 메일 내용
				"<h1>TravelPlan 메일 인증</h1>" +
				"<br>TravelPlan 가입을 환영합니다!" +
				"<br>아래 [이메일 인증 확인]을 눌러주세요." +
				"<br><a href='http://localhost:8091/app/registerEmail?email=" + dto.getEmail() +
				"&mail_key=" + mail_key +
				"' target='_black'>이메일 인증 확인</a>");
		sendMail.setFrom("pjtravelplan@gmail.com", "TravelPlan"); // 보내는 사람
		sendMail.setTo(dto.getEmail()); // 받는 사람
		sendMail.send(); // 메일 보내기

	}
	
	//id 중복 체크
	@Override
	public MemberDTO idCheck(String userID) {
		return dao.idCheck(userID);
	}
	// 로그인
	@Override
	public MemberDTO login(HashMap<String, String> map) {
		return dao.login(map);
	}

	// 이메일 인증을 위한 랜덤번호 저장
	@Override
	public int updateMailKey(MemberDTO dto) throws Exception {
		return dao.updateMailKey(dto);
	}

	// 메일 인증 후 mail_auto 0 -> 1 변경
	@Override
	public int updateMailAuth(MemberDTO dto) throws Exception {
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



}
