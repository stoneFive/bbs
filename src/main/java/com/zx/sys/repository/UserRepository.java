package com.zx.sys.repository;


import com.zx.entity.system.User;

public interface UserRepository extends BaseRepository<User, Long>{

	User findByUserName(String userName);

}
