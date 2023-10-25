package com.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.ApiDTO2;

@Controller
public class TestController {
	private String serviceKey = "%2BZ2oseaIvHt%2BFFNkhvJA2vGpTcpF%2FydeQrkUsMt7W7SPky11jcfHaJ0HnB4VAR%2Bv3zvDnuyQRhL4zupPemFCAA%3D%3D";
	
	@Autowired
	
	@RequestMapping("/api")
	@ResponseBody
	public ArrayList<ApiDTO2> load_save(HttpSession session) {
		String result = "";
		ArrayList<ApiDTO2> list = new ArrayList<ApiDTO2>();
	    //http://apis.data.go.kr/B551011/KorService1/areaBasedList1?serviceKey=%2BZ2oseaIvHt%2BFFNkhvJA2vGpTcpF%2FydeQrkUsMt7W7SPky11jcfHaJ0HnB4VAR%2Bv3zvDnuyQRhL4zupPemFCAA%3D%3D&pageNo=1&numOfRows=15&MobileOS=ETC&MobileApp=AppTest&_type=json&contentTypeId=32&areaCode=4&sigunguCode=4
		try {
//	           String requestPage=page;
	           URL url = new URL("http://apis.data.go.kr/B551011/KorService1/areaBasedList1?serviceKey=" + serviceKey +
	        		   "&pageNo=1&numOfRows=17&MobileOS=ETC&MobileApp=AppTest&_type=json&contentTypeId=32&areaCode=4&sigunguCode=4");
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
	           System.out.println("infoArr: "+infoArr);
	           
	           
	           for(int i=0;i<infoArr.size();i++){
	               JSONObject tmp = (JSONObject)infoArr.get(i);
	               
	               ApiDTO2 dto=new ApiDTO2((String)tmp.get("mapx"),(String)tmp.get("mapy"));
	               
	               list.add(dto);
	           }
	           
	       }catch(Exception e) {
	           e.printStackTrace();   
	       }
	       return list;
	}
	
	@GetMapping("/map")
	public String map(HttpSession session) {
		session.setAttribute("client_id", "9269fw92x6");
		return "map/mapTest";
	}
	
	@GetMapping("/test")
	public String test() {
		return "test";
	}
}
