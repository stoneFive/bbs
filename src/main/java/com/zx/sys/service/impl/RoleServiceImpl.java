package com.zx.sys.service.impl;

import com.zx.entity.system.Role;
import com.zx.sys.repository.RoleRepository;
import com.zx.sys.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service("roleService")
public class RoleServiceImpl extends
		BaseServiceImpl<Role, Long, RoleRepository> implements RoleService {

	@Override
	@Autowired
	public void setEntityRepository(RoleRepository roleRepository) {
		this.repository = roleRepository;
	}

	@Override
	public Role findByRoleCode(String roleCode) {
		return repository.findByRoleCode(roleCode);
	}

	

}
