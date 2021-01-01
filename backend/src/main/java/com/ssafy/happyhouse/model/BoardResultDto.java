package com.ssafy.happyhouse.model;

import java.util.List;

public class BoardResultDto {
	
	private int result; // ������ ���� ó���� ���� ����
	private BoardDto dto; // ��(�Խñ� �ϳ��� ���� ����)
	private List<BoardDto> list;
	private int count; // ��ü �� �Խñ� �Ǽ�
	
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	public BoardDto getDto() {
		return dto;
	}
	public void setDto(BoardDto dto) {
		this.dto = dto;
	}
	public List<BoardDto> getList() {
		return list;
	}
	public void setList(List<BoardDto> list) {
		this.list = list;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	

}
