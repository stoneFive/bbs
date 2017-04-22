package com.zx.sys.repository;


import com.zx.entity.system.User;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;


public interface UserRealmRepository  extends PagingAndSortingRepository<User, Long>,
JpaSpecificationExecutor<User> {

	User findByUserName(String username);

}
