package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.DongResultDto;
import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;
import com.ssafy.happyhouse.model.SidoResultDto;
import com.ssafy.happyhouse.model.dao.MapDao;

@Service
public class MapServiceImpl implements MapService {
	
	@Autowired
	MapDao dao;
	private static MapService MapService;
	
	private static final int SUCCESS = 1;
	private static final int FAIL = -1;
	
	private MapServiceImpl() {}
	
	
	public static MapService getMapService() {
		if(MapService == null)
			MapService = new MapServiceImpl();
		return MapService;
	}

	@Override
	public SidoResultDto getSido() throws Exception {
		SidoResultDto sidoResultDto = new SidoResultDto();

		try {
			List<SidoGugunCodeDto> list = dao.getSido();
			//int count = dao.boardListTotalCount();

			sidoResultDto.setList(list);
			//sidoResultDto.setCount(count);

			sidoResultDto.setResult(SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			sidoResultDto.setResult(FAIL);
		}
		return sidoResultDto;
	}

	@Override
	public SidoResultDto getGugunInSido(String sido) throws Exception {
		SidoResultDto sidoResultDto = new SidoResultDto();

		try {
			List<SidoGugunCodeDto> list = dao.getGugunInSido(sido);
			//int count = dao.boardListTotalCount();

			sidoResultDto.setList(list);
			//sidoResultDto.setCount(count);

			sidoResultDto.setResult(SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			sidoResultDto.setResult(FAIL);
		}
		return sidoResultDto;
	}

	@Override
	public DongResultDto getDongInGugun(String gugun) throws Exception {
		DongResultDto dongResultDto = new DongResultDto();

		try {
			List<HouseInfoDto> list = dao.getDongInGugun(gugun);
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
