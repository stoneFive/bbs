package com.zx.sys.service.impl;

import com.zx.entity.model.News;
import com.zx.sys.repository.NewsRepository;
import com.zx.sys.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.annotation.AccessType;
import org.springframework.stereotype.Service;

/**
 * Created by lance
 * on 2017/4/15.
 */
@Service("newsService")
public class NewsServiceImpl extends BaseServiceImpl<News,Long,NewsRepository> implements NewsService {

    @Autowired
    @Override
    public void setEntityRepository(NewsRepository repository) {
        this.repository = repository;
    }
}
