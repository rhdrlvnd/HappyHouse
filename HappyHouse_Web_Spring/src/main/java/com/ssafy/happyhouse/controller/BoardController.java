package com.ssafy.happyhouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.BoardDto;
import com.ssafy.happyhouse.model.BoardResultDto;
import com.ssafy.happyhouse.model.service.BoardService;

@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
public class BoardController {

	@Autowired
	BoardService service;

	private static final int SUCCESS = 1;
	private static final int FAIL = -1;

	@GetMapping(value = "/boards")
	private ResponseEntity<BoardResultDto> boardList() {
		BoardResultDto boardResultDto;

		boardResultDto = service.boardList();
//		if (boardParamDto.getSearchWord().isEmpty()) {
//			boardResultDto = service.boardList(boardParamDto);
//		} else {
//			boardResultDto = service.boardListSearchWord(boardParamDto);
//		}
		System.out.println("boards");
		if(boardResultDto.getResult()==SUCCESS) {
			return new ResponseEntity<BoardResultDto>(boardResultDto, HttpStatus.OK);
		}else {
			return new ResponseEntity<BoardResultDto>(boardResultDto, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@PostMapping(value="/boards/insert")
	private ResponseEntity<BoardResultDto> boardInsert(@RequestBody BoardDto boardDto) throws Exception{
		BoardResultDto boardResultDto = service.boardInsert(boardDto);
		
		System.out.println(boardDto.toString());
		if(boardResultDto.getResult()==SUCCESS) {
			return new ResponseEntity<BoardResultDto>(boardResultDto, HttpStatus.OK);
		}else {
			return new ResponseEntity<BoardResultDto>(boardResultDto, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
