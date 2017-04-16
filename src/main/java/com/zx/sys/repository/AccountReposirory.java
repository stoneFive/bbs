package com.zx.sys.repository;

import com.zx.entity.model.Account;

/**
 * Created by lance
 * on 2017/3/25.
 */
public interface AccountReposirory extends BaseRepository<Account,Long> {
    Account findByAccount(String account);
}
