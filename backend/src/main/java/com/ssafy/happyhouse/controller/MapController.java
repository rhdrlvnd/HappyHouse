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
import com.ssafy.happyhouse.model.SidoGugunCodeDto;
import com.ssafy.happyhouse.model.SidoResultDto;
import com.ssafy.happyhouse.model.service.MapService;

@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
@RequestMapping("/map")
public class MapController {

	@Autowired
	MapService service;
	
	private static final int SUCCESS = 1;
	private static final int FAIL = -1;
	
	@GetMapping("/sido")
	public ResponseEntity<SidoResultDto> getSido(HttpSession session) throws Exception {
		SidoResultDto sidoResultDto;
		sidoResultDto = service.getSido();
		if(sidoResultDto.getResult()==SUCCESS) {
			return new ResponseEntity<SidoResultDto>(sidoResultDto, HttpStatus.OK);
		}else {
			return new ResponseEntity<SidoResultDto>(sidoResultDto, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping("/gugun")
	public ResponseEntity<SidoResultDto> getGugun(SidoGugunCodeDto sidoGugunCodeDto, HttpSession session) throws Exception {
		SidoResultDto sidoResultDto;
		
		String sido = sidoGugunCodeDto.getSidoCode();
		sidoResultDto = service.getGugunInSido(sido);
		System.out.println(sidoResultDto.getList().get(0).getGugunCode());
		if(sidoResultDto.getResult()==SUCCESS) {
			return new ResponseEntity<SidoResultDto>(sidoResultDto, HttpStatus.OK);
		}else {
			return new ResponseEntity<SidoResultDto>(sidoResultDto, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping("/dong")
	public ResponseEntity<DongResultDto> getDong(SidoGugunCodeDto sidoGugunCodeDto, HttpSession session) throws Exception {
		DongResultDto dongResultDto;
		
		String gugun = sidoGugunCodeDto.getGugunCode();
		dongResultDto = service.getDongInGugun(gugun);
		if(dongResultDto.getResult()==SUCCESS) {
			return new ResponseEntity<DongResultDto>(dongResultDto, HttpStatus.OK);
		}else {
			return new ResponseEntity<DongResultDto>(dongResultDto, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
