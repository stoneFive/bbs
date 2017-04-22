package com.zx.sys.service;


import com.zx.entity.system.User;

public interface UserRealmService {

	User findByUserName(String username);

}
