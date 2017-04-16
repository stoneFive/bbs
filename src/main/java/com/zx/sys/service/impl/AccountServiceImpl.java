package com.zx.sys.service.impl;

import com.zx.entity.model.Account;
import com.zx.sys.repository.AccountReposirory;
import com.zx.sys.repository.UserRepository;
import com.zx.sys.service.AccountService;
import com.zx.sys.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by lance
 * on 2017/3/25.
 */

@Service("accountService")
public class AccountServiceImpl extends BaseServiceImpl <Account,Long,AccountReposirory> implements AccountService {

    @Override
    @Autowired
    public void setEntityRepository(AccountReposirory repository) {
        this.repository = repository;
    }

    @Override
    public Account findByAccount(String account) {
        return repository.findByAccount(account);
    }
}
