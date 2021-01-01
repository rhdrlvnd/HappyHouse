package com.ssafy.happyhouse.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.DongResultDto;
import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;
import com.ssafy.happyhouse.model.SidoResultDto;
import com.ssafy.happyhouse.model.service.HouseDealService;

@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
@RequestMapping("/house")
public class HouseDealController {

	@Autowired
	HouseDealService service;
	
	private static final int SUCCESS = 1;
	private static final int FAIL = -1;
	
	@GetMapping("/dong")
	public ResponseEntity<DongResultDto> searchDong(HouseInfoDto houseInfoDto, HttpSession session) throws Exception {
		DongResultDto dongResultDto;
		
		String dong = houseInfoDto.getDong();
		System.out.println(this.getClass().getName() +" : searchDong" +dong);
		dongResultDto = service.searchDong(dong);
		if(dongResultDto.getResult()==SUCCESS) {
			return new ResponseEntity<DongResultDto>(dongResultDto, HttpStatus.OK);
		}else {
			return new ResponseEntity<DongResultDto>(dongResultDto, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping("/apt")
	public ResponseEntity<DongResultDto> searchName(HouseInfoDto houseInfoDto, HttpSession session) throws Exception {
		DongResultDto dongResultDto;
		
		String aptName = houseInfoDto.getAptName();
		System.out.println(this.getClass().getName() +" : searchApt" + aptName);
		dongResultDto = service.searchName(aptName);
		if(dongResultDto.getResult()==SUCCESS) {
			return new ResponseEntity<DongResultDto>(dongResultDto, HttpStatus.OK);
		}else {
			return new ResponseEntity<DongResultDto>(dongResultDto, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
