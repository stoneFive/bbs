package com.zx.sys.service.impl;

import com.zx.entity.model.News;
import com.zx.entity.model.Trends;
import com.zx.sys.repository.NewsRepository;
import com.zx.sys.repository.TrendsRepository;
import com.zx.sys.service.NewsService;
import com.zx.sys.service.TrendsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by lance
 * on 2017/4/15.
 */
@Service("trendsService")
public class TrendsServiceImpl extends BaseServiceImpl<Trends,Long,TrendsRepository> implements TrendsService {

    @Autowired
    @Override
    public void setEntityRepository(TrendsRepository trendsRepository) {
        this.repository = trendsRepository;
    }
}
