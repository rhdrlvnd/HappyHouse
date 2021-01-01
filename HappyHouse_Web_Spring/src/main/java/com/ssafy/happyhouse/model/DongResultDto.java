package com.ssafy.happyhouse.model;

import java.util.List;

public class DongResultDto {

	private int result; 
	private HouseInfoDto dto; 
	private List<HouseInfoDto> list;
	private int count;
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	public HouseInfoDto getDto() {
		return dto;
	}
	public void setDto(HouseInfoDto dto) {
		this.dto = dto;
	}
	public List<HouseInfoDto> getList() {
		return list;
	}
	public void setList(List<HouseInfoDto> list) {
		this.list = list;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	} 
}
