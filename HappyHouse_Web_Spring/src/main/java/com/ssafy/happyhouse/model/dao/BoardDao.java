package com.ssafy.happyhouse.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.BoardDto;
import com.ssafy.happyhouse.model.BoardParamDto;

@Mapper
public interface BoardDao {
	public int boardInsert(BoardDto dto);
//	public int boardUpdate(BoardDto dto);
//	public int boardDelete(int boardId);
//	
//	public BoardDto boardDetail(int boardId);
	
	public List<BoardDto> boardList();
//	public int boardListTotalCount();
	
//	public List<BoardDto> boardListSearchWord(BoardParamDto boardParamDto);
//	public int boardListSearchWordTotalCount(BoardParamDto boardParamDto);
//	
//	public int boardFileDelete(int boardId);
//	public List<String> boardFileUrlDeleteList(int boardId);
	
	// New for ReadCnt
//	public int boardUserReadCount(int boardId, int userSeq);
//	public int boardUserReadInsert(int boardId, int userSeq);
//	public int boardReadCountUpdate(int boardId);
}