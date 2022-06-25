package com.jang.doc.service;

import java.util.List;

import com.jang.doc.model.User;

public interface UserService {

	User getUser(String userId);
	int insertUser(User user);
	int updateUser(User user);
	int deleteUser(String userId);
	int updatePass(User user);
	
	User findId(String name,String email);
	User findPass(String id, String email);
	
}
