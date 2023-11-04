package com.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.SpotDTO;
import com.dto.MemberDTO;
import com.dto.PlanDTO;
import com.dto.TravelListDTO;
import com.info.Info;
import com.service.MakeTravelService;

@Controller
public class TravelController {
	private Info info = new Info();
	
	@Autowired
	MakeTravelService MTService;
	
	// 메인UI
	@GetMapping("/travelUI")
	public String travelUI(HttpSession session, @RequestParam HashMap<String, String> map) {
		session.setAttribute("client_id", info.getKakaoMapId());
		
		// 이미 세션에 travelID가 저장되어 있는 경우
		if((Integer)session.getAttribute("travelID") != null) {
			session.removeAttribute("travelID"); // 해당 데이터 삭제
		}
		
		// travel 테이블에 저장(일정 제목, 날짜, 위치 등등)
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("loginInfo");
		String userID = memberDTO.getUserID();
		int areaCode = getAreaCode(map.get("region"));
		
//		// TravelListDTO 저장
		TravelListDTO travelListDTO = new TravelListDTO(userID, map.get("SDate"), map.get("EDate"), map.get("travelTitle"), areaCode);
		int num = MTService.saveTravel(travelListDTO);
		
		// 저장 실패시 이동할 경로
		if(num==0) {
			return "travel/travelSaveFail";
		}
		
		// 저장한 테이블 id 가져오기
		List<Integer> travelIDList = MTService.selectTravelId(travelListDTO);
		int travelID = travelIDList.get(travelIDList.size()-1); // 리스트의 마지막 요소 저장
		
		session.setAttribute("dto", travelListDTO);
		session.setAttribute("travelID", travelID);
		
		return "travelForm";
	}
	
	// 일정 만들기
	@GetMapping("/loginCheck/pickLocation")
	public String pickLocation(HttpSession session) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("loginInfo");
		String userID = memberDTO.getUserID();
		
		// save='n'인 travel 데이터 삭제
		MTService.deleteTravelData(userID);
		
		return "pickLocation";
	}
	
	
	// tourAPI json형식으로 jsp로 보냄
	@RequestMapping("/data_download")
	@ResponseBody
	public ArrayList<SpotDTO> load_save(HttpSession session) throws Exception {
		String result = "";
		ArrayList<SpotDTO> list = new ArrayList<SpotDTO>();
		//http://apis.data.go.kr/B551011/KorService1/areaBasedList1?serviceKey=%2BZ2oseaIvHt%2BFFNkhvJA2vGpTcpF%2FydeQrkUsMt7W7SPky11jcfHaJ0HnB4VAR%2Bv3zvDnuyQRhL4zupPemFCAA%3D%3D&pageNo=1&numOfRows=7901&MobileOS=ETC&MobileApp=AppTest&_type=json&areaCode=39
		URL url = new URL("http://apis.data.go.kr/B551011/KorService1/areaBasedList1?serviceKey=" + info.getTourAPIKey() +
		   "&pageNo=3&numOfRows=1000&MobileOS=ETC&MobileApp=AppTest&_type=json&areaCode=39");
		BufferedReader bf;
		bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
		result = bf.readLine();
		System.out.println("result: "+result); // O
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
		JSONObject response = (JSONObject)jsonObject.get("response");
		JSONObject body = (JSONObject)response.get("body");
		JSONObject items = (JSONObject)body.get("items");
		   
		JSONArray infoArr = (JSONArray) items.get("item");
		//System.out.println("infoArr: "+infoArr);
		   
		   
		for(int i=0;i<infoArr.size();i++){
			JSONObject tmp = (JSONObject)infoArr.get(i);
			       
			SpotDTO dto=new SpotDTO((String)tmp.get("title"),(String)tmp.get("addr1"),(String)tmp.get("addr2"),(String)tmp.get("mapx"),(String)tmp.get("mapy"),(String)tmp.get("areacode"),(String)tmp.get("contenttypeid"));
			//System.out.println(dto);
			if(dto!=null) {
				list.add(dto);
			}
		}
		MTService.insertApi(list);
		return list;
	}
	
	// 검색 항목 중 DB에 해당 항목이 있을 경우 세부 일정에 추가
	@GetMapping("/scheduleList")
	@ResponseBody
	public List<SpotDTO> scheduleList(@RequestParam HashMap<String, String> map) {
		List<SpotDTO> list = MTService.findSpot(map);
		
		return list;
	}
	
	// 숙박/음식 버튼
	@GetMapping("/searchBtn")
	@ResponseBody
	public List<SpotDTO> searchBtn(@RequestParam("region") String region, @RequestParam("contentTypeid") String contentTypeid) {
		int areaCode = getAreaCode(region);
		
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("areaCode", areaCode);
		map.put("contentTypeid", contentTypeid);
		
		List<SpotDTO> list = MTService.findHotelandFood(map);
		return list;
	}
	
	// 관광 버튼
	@GetMapping("/searchBtn2")
	@ResponseBody
	public List<SpotDTO> searchBtn2(@RequestParam("region") String region, @RequestParam HashMap<String, Object> map) {
		map.remove("region");
		int areaCode = getAreaCode(region);
		
		map.put("areaCode", areaCode);
		List<SpotDTO> list = MTService.findSightseeing(map);
		return list;
	}
	
	// travelForm.jsp에서 저장 버튼 클릭시 세부일정 저장
	@GetMapping("/saveScheduleData")
	@ResponseBody
	public void saveScheduleData(@RequestParam("scheduleList") String schedule, @RequestParam("travelID") String travelID) throws ParseException {
//		System.out.println("saveScheduleData");
		// json -> string 변환시켜 받아온 변수 schedule
		// parser로 파싱작업
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonArray = (JSONArray)jsonParser.parse(schedule);
		
		ArrayList<PlanDTO> list = new ArrayList<PlanDTO>();
		   
		// dto 생성, 리스트에 저장
		for(int i=0;i<jsonArray.size();i++){
			JSONObject ele = (JSONObject)jsonArray.get(i);
			       
//			System.out.println(ele.get("day_num"));
//			System.out.println(ele.get("item"));
//			System.out.println(ele.get("time_text"));
//			System.out.println(ele.get("item_add"));
//			System.out.println(Float.parseFloat((String)ele.get("mapx")));

			PlanDTO dto = new PlanDTO( Integer.parseInt(travelID), Integer.parseInt((String)ele.get("day_num")), 
									   (String)ele.get("item"), (String)ele.get("item_add"), (String)ele.get("time_text"),
									   Float.parseFloat((String)ele.get("mapx")), Float.parseFloat((String)ele.get("mapy")), 
									   Integer.parseInt(String.valueOf(ele.get("idx"))) );
			if(dto!=null) {
				list.add(dto);
			}
		}
//		System.out.println("여행 세부 일정");
//		System.out.println(list);
		// dto 담은 리스트 저장 완료
		
		// 세부 일정 저장
		MTService.saveSchedule(list);
		
		// 세부일정 저장 실패 알림 만들어야함
	}
	
	// travelForm.jsp에서 저장 버튼 클릭시 일정 정보 변경사항 업데이트
	@GetMapping("/saveBtn")
	public String saveBtn(@RequestParam HashMap<String, String> map, HttpSession session) {
//		System.out.println("saveBtn");
		
		// userid, sdate, edate, traveltitle, areacode
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("loginInfo");
		String userID = memberDTO.getUserID();
		int areaCode = getAreaCode(map.get("areaCode"));
		
		// TravelListDTO 저장
		TravelListDTO travelListDTO = new TravelListDTO(Integer.parseInt(map.get("travelID")),userID, map.get("SDate"), map.get("EDate"), map.get("travelTitle"), areaCode);
		
		// 일정 정보(여행제목, 날짜 등) 업데이트
		int num = MTService.travelSaveAndUpdate(travelListDTO);
		
		if(num==0) {
			return "travel/travelSaveFail";
		}
		
		// save='n'인 travel 데이터 삭제
		MTService.deleteTravelData(userID);
		
		session.removeAttribute("dto");
		session.removeAttribute("travelID");
		session.removeAttribute("client_id");
		
		return "redirect:/main";
	}
	
	// 일정 만들기 페이지에서 벗어날 경우 travel 테이블에 저장해놓은 데이터 삭제
	@GetMapping("/loginCheck/dropPage")
	public String dropPage(HttpSession session) {
		
		/*	삭제 데이터
		  	- 유저아이디+save='n'인 모든 데이터 삭제	*/
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("loginInfo");
		String userID = memberDTO.getUserID();
		
		// save='n'인 travel 데이터 삭제
		MTService.deleteTravelData(userID);
		
		// 세션 초기화
		session.removeAttribute("dto");
		session.removeAttribute("travelID");
		session.removeAttribute("client_id");
		
		return "redirect:/main";
	}
	
	// url로 받아온 region값 areaCode로 변경시키는 함수
	public int getAreaCode(String region) {
		int areaCode = 0;
		if(region.equals("seoul")) {
			areaCode = 1;
		}
		else if (region.equals("incheon")) {
			areaCode = 2;
		}
		else if (region.equals("daejeon")) {
			areaCode = 3;
		}
		else if (region.equals("daegu")) {
			areaCode = 4;
		}
		else if (region.equals("gwangju")) {
			areaCode = 5;
		}
		else if (region.equals("busan")) {
			areaCode = 6;
		}
		else if (region.equals("ulsan")) {
			areaCode = 7;
		}
		else if (region.equals("gangwon")) {
			areaCode = 32;
		}
		else if (region.equals("jeju")) {
			areaCode = 39;
		}
		
		return areaCode;
	}
	
}
