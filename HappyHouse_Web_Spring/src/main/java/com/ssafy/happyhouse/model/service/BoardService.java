package com.ssafy.happyhouse.model.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.ssafy.happyhouse.model.BoardDto;
import com.ssafy.happyhouse.model.BoardParamDto;
import com.ssafy.happyhouse.model.BoardResultDto;

public interface BoardService {
	public BoardResultDto boardList();

//	public BoardResultDto boardListSearchWord(BoardParamDto boardParamDto);

	public BoardResultDto boardInsert(BoardDto boardDto) throws IOException;

}