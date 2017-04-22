package com.zx.sys.service.impl;

import com.zx.entity.system.User;
import com.zx.sys.repository.UserRealmRepository;
import com.zx.sys.service.UserRealmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("userRealmService")
public class UserRealmServiceImpl implements UserRealmService {

	@Autowired
	private UserRealmRepository userRealmRepository;
	
	@Override
	public User findByUserName(String username) {
		
		return userRealmRepository.findByUserName(username);
	}

}
