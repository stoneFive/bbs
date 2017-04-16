package com.zx.sys.service;

import com.zx.entity.model.Account;

/**
 * Created by lance
 * on 2017/3/25.
 */
public interface AccountService extends BaseService<Account,Long> {
public Account findByAccount(String account);
}

