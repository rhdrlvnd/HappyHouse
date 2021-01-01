package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.DongResultDto;
import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.SidoResultDto;


public interface MapService {
	
	SidoResultDto getSido() throws Exception;
	SidoResultDto getGugunInSido(String sido) throws Exception;
	DongResultDto getDongInGugun(String gugun) throws Exception;
}
