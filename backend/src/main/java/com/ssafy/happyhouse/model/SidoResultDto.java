package com.ssafy.happyhouse.model;

import java.util.List;

public class SidoResultDto {

	private int result; 
	private SidoGugunCodeDto dto; 
	private List<SidoGugunCodeDto> list;
	private int count;
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	public SidoGugunCodeDto getDto() {
		return dto;
	}
	public void setDto(SidoGugunCodeDto dto) {
		this.dto = dto;
	}
	public List<SidoGugunCodeDto> getList() {
		return list;
	}
	public void setList(List<SidoGugunCodeDto> list) {
		this.list = list;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	} 
	
	
}
