package com.jang.doc.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jang.doc.dao.UserDao;
import com.jang.doc.model.User;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public User getUser(String userId) {
		return sqlSession.selectOne("userMapper.getUser",userId);
	}
	
	@Override
	public int insertUser(User user) {
		return sqlSession.insert("userMapper.insertUser", user);
	}
	
	@Override
	public int updateUser(User user) {
		return sqlSession.update("userMapper.updateUser",user);
	}
	
	@Override
	public User findPass(String id,String email) {
		User user = new User();
		user.setId(id);
		user.setEmail(email);
		return sqlSession.selectOne("userMapper.findPass",user);
	}
	
	@Override
	public User findId(String name,String email) {
		User user = new User();
		user.setName(name);
		user.setEmail(email);
		return sqlSession.selectOne("userMapper.findId",user);
	}
	
//	@Override
//	public List<User> getUserList(){
//		//return userDao.getUserList();
//		return null;
//	}
	
	@Override
	public int deleteUser(String userId) {
		//return userDao.deleteUser(userId);
		return sqlSession.delete("userMapper.deleteUser",userId);
	}
	
	@Override
	public int updatePass(User user) {
		//return userDao.updatePass(user);
		return sqlSession.update("userMapper.updatePass", user);
	}
	
	
}
