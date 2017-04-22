package com.zx.sys.service.impl;

import com.zx.entity.system.Permission;
import com.zx.sys.repository.PermissionRepository;
import com.zx.sys.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service("permissionService")
public class PermissionServiceImpl extends
		BaseServiceImpl<Permission, Long, PermissionRepository> implements
		PermissionService {

	@Override
	@Autowired
	public void setEntityRepository(PermissionRepository repository) {
		this.repository = repository;
	}

	
}
