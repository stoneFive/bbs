package com.zx.sys.service.impl;

import com.zx.entity.system.User;
import com.zx.sys.repository.UserRepository;
import com.zx.sys.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<User, Long, UserRepository>
		implements UserService {

	@Override
	@Autowired
	public void setEntityRepository(UserRepository repository) {
		this.repository = repository;
	}

	@Override
	public User findByUserName(String userName) {
		
		return repository.findByUserName(userName);
	}

	@Override
	public User findLoginUser() {
		Subject subject = SecurityUtils.getSubject();
    	String userName = (String) subject.getPrincipal();
    	return this.findByUserName(userName);
	}

	

}
