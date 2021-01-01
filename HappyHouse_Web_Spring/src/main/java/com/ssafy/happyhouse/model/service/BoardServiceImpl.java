package com.ssafy.happyhouse.model.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.BoardDto;
import com.ssafy.happyhouse.model.BoardParamDto;
import com.ssafy.happyhouse.model.BoardResultDto;
import com.ssafy.happyhouse.model.dao.BoardDao;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDao dao;
	String uploadFolder = "upload";

	private static final int SUCCESS = 1;
	private static final int FAIL = -1;

	@Override
	public BoardResultDto boardList() {

		BoardResultDto boardResultDto = new BoardResultDto();

		try {
			List<BoardDto> list = dao.boardList();
			System.out.println(list.get(0).toString());
//			int count = dao.boardListTotalCount();

			boardResultDto.setList(list);
//			boardResultDto.setCount(count);

			boardResultDto.setResult(SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			boardResultDto.setResult(FAIL);
		}
		return boardResultDto;
	}

//	@Override
//	public BoardResultDto boardListSearchWord(BoardParamDto boardParamDto) {
//		BoardResultDto boardResultDto = new BoardResultDto();
//
//		try {
//			List<BoardDto> list = dao.boardListSearchWord(boardParamDto);
//			int count = dao.boardListSearchWordTotalCount(boardParamDto);
//
//			boardResultDto.setList(list);
//			boardResultDto.setCount(count);
//
//			boardResultDto.setResult(SUCCESS);
//		} catch (Exception e) {
//			e.printStackTrace();
//			boardResultDto.setResult(FAIL);
//		}
//		return boardResultDto;
//	}

	/* for eclipse development code */
	// D:\SSAFY\java\eclipse\STS\BoardFileUploadSpringMVCMybatis
//    String uploadPath = "C:" + File.separator + "SSAFY" + File.separator + "Spring" + 
//            File.separator + "HappyHouse_Web_Spring" +  File.separator + "src" + File.separator + "main" + 
//           File.separator + "resources" + File.separator + "static";

	// /Users/HG/SSAFY/JAVA/0918_board_file_upload/WebContent/upload
	String uploadPath = File.separator + "Users" + File.separator + "HG" + File.separator
			+ "workspace-sts-3.9.14.RELEASE" + File.separator + "HappyHouse_Web_Spring" + File.separator
			+ File.separator + "src" + File.separator + "main" + File.separator + "resources" + File.separator
			+ "static";

	@Override
	public BoardResultDto boardInsert(BoardDto dto) throws IOException {

		BoardResultDto boardResultDto = new BoardResultDto();

		try {
			dao.boardInsert(dto); // useGeneratedKeys="true" keyProperty="boardId"

			boardResultDto.setResult(SUCCESS);

		} catch (Exception e) {
			e.printStackTrace();
			boardResultDto.setResult(FAIL);
			// throw e; // Need For Rollback!
		}
		return boardResultDto;
	}

}