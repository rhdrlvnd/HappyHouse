package com.ssafy.happyhouse.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.UserDto;
import com.ssafy.happyhouse.model.dao.UserDao;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserDao dao;
	
	@Override
	public int register(UserDto userDto) {
		return dao.register(userDto);
	}
	
	@Override
	public UserDto login(UserDto userDto) {
//		UserDto ud = new UserDto();
//		ud.setUser_id(dao.login(userDto));
//		System.out.println(ud.toString());
		return dao.login(userDto);
	}
	
	@Override
	public int update(UserDto userDto) {
		return dao.update(userDto);
	}

	@Override
	public int delete(String UserInfoId) {
		return dao.delete(UserInfoId);
	}

	@Override
	public UserDto detail(String userName) {
		return dao.detail(userName);
	}

}
