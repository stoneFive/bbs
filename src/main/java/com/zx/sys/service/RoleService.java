package com.zx.sys.service;


import com.zx.entity.system.Role;

public interface RoleService extends BaseService<Role, Long> {

	Role findByRoleCode(String roleCode);

}
