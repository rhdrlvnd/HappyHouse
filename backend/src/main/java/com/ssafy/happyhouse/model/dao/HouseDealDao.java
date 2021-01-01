package com.ssafy.happyhouse.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;
import com.ssafy.happyhouse.model.SidoResultDto;

@Mapper
public interface HouseDealDao {

	List<HouseInfoDto> searchDong(String dong) throws Exception;
	
	List<HouseInfoDto> searchName(String aptName) throws Exception;
}
