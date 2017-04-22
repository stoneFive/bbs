package com.zx.sys.service;


import com.zx.entity.system.User;

public interface UserService extends BaseService<User, Long> {

	User findByUserName(String username);
	
	User findLoginUser();

}
