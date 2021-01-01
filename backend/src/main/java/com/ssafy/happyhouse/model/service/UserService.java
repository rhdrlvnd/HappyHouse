package com.ssafy.happyhouse.model.service;

import com.ssafy.happyhouse.model.UserDto;

public interface UserService {
	public int register(UserDto userDto);

	UserDto login(UserDto userDto);

	int update(UserDto userDto);

	int delete(String UserInfoId);

	UserDto detail(String userName);
}
