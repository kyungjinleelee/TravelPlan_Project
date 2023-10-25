package com.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.ApiDTO;

@Controller
public class TestController {
	private String serviceKey = "%2BZ2oseaIvHt%2BFFNkhvJA2vGpTcpF%2FydeQrkUsMt7W7SPky11jcfHaJ0HnB4VAR%2Bv3zvDnuyQRhL4zupPemFCAA%3D%3D";
	
	@Autowired
	
	
	@GetMapping("/api")
	public String test() {
		return "test";
	}
	
	@PostMapping("/api")
	public String load_save(@RequestParam("page") String page, Model model) {
		String result = "";
	     
		try {
//	           String requestPage=page;
	           URL url = new URL("http://apis.data.go.kr/B551011/KorService1/areaCode1?serviceKey=" + serviceKey +
	        		   "&pageNo=1&numOfRows=17&MobileOS=ETC&MobileApp=AppTest&_type=json");
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
	           
//	           Long totalCount=(Long)CardSubwayStatsNew.get("totalCount");
//	           JSONObject subResult = (JSONObject)CardSubwayStatsNew.get("header");
	           for(int i=0;i<infoArr.size();i++){
	               JSONObject tmp = (JSONObject)infoArr.get(i);
	               ApiDTO dto=new ApiDTO((String)tmp.get("code"),(String)tmp.get("name"));
	               System.out.println(dto);
	           }

	       }catch(Exception e) {
	           e.printStackTrace();   
	       }
	       return "main";
	}
}
