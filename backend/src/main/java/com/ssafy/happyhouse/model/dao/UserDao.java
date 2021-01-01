package com.ssafy.happyhouse.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.UserDto;

@Mapper
public interface UserDao {
	public int register(UserDto userDto);
	public UserDto login(UserDto userDto);
	public int update(UserDto userDto);
	public int delete(String userId);
	public UserDto detail(String userName);
}
