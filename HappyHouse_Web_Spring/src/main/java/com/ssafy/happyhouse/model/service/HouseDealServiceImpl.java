package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.DongResultDto;
import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;
import com.ssafy.happyhouse.model.SidoResultDto;
import com.ssafy.happyhouse.model.dao.HouseDealDao;

@Service
public class HouseDealServiceImpl implements HouseDealService {
	
	@Autowired
	HouseDealDao dao;
	private static HouseDealService houseMapService;
	
	private static final int SUCCESS = 1;
	private static final int FAIL = -1;
	
	private HouseDealServiceImpl() {}
	
	public static HouseDealService getHouseMapService() {
		if(houseMapService == null)
			houseMapService = new HouseDealServiceImpl();
		return houseMapService;
	}

	@Override
	public DongResultDto searchDong(String dong) throws Exception {
		DongResultDto dongResultDto = new DongResultDto();

		try {
			List<HouseInfoDto> list = dao.searchDong(dong);
			//int count = dao.boardListTotalCount();

			dongResultDto.setList(list);
			//sidoResultDto.setCount(count);

			dongResultDto.setResult(SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			dongResultDto.setResult(FAIL);
		}
		return dongResultDto;
	}

	@Override
	public DongResultDto searchName(String aptName) throws Exception {
		DongResultDto dongResultDto = new DongResultDto();

		try {
			System.out.println(aptName);
			List<HouseInfoDto> list = dao.searchName(aptName);
			//int count = dao.boardListTotalCount();

			dongResultDto.setList(list);
			//sidoResultDto.setCount(count);

			dongResultDto.setResult(SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			dongResultDto.setResult(FAIL);
		}
		return dongResultDto;
	}

}
