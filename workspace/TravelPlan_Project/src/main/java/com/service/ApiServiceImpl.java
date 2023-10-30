package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ApiDAO;
import com.dto.ApiDTO2;

@Service
public class ApiServiceImpl implements ApiService {

	@Autowired //dao
	ApiDAO dao;
	
	@Override
	public int insertApi(List<ApiDTO2> list) {
		return dao.insertApi(list);
	}

}
