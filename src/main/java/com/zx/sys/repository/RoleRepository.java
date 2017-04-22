package com.zx.sys.repository;


import com.zx.entity.system.Role;

public interface RoleRepository extends BaseRepository<Role, Long> {

	Role findByRoleCode(String roleCode);

}
