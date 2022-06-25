package com.jang.doc.dao;


import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import com.jang.doc.model.User;


@Repository("userDao")
public class UserDaoImpl implements UserDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
//	@Autowired
//	public void setUserDao(UserDao userDaoImpl) {
//		//this.userDao = userDaoImpl;
//	}
	
	
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
		//return userDao.updateUser(user);
		return sqlSession.update("userMapper.updateUser",user);
	}
	
	@Override
	public User findPass(String id,String email) {
		User user = new User();
		user.setId(id);
		user.setEmail(email);
		return sqlSession.selectOne("userMapper.findPass",user);
		//return userDao.findPass(id, email);
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
