package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.DongResultDto;
import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.SidoResultDto;


public interface HouseDealService {

	DongResultDto searchDong(String dong) throws Exception;

	DongResultDto searchName(String AptName) throws Exception;
	
}
