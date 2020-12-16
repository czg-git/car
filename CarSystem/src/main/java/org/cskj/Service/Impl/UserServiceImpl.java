package org.cskj.Service.Impl;

import org.cskj.Bean.User;
import org.cskj.Mapper.UserMapper;
import org.cskj.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class UserServiceImpl implements UserService {
@Autowired
 private UserMapper uMapper;
	public User login(User user) {
		// TODO Auto-generated method stub
		return uMapper.login(user);
	}

}
