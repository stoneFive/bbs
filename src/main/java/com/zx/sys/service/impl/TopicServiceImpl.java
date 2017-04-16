package com.zx.sys.service.impl;

import com.zx.entity.topic.Topic;
import com.zx.sys.repository.TopicRepository;
import com.zx.sys.service.BaseService;
import com.zx.sys.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

/**
 * Created by lance
 * on 2016/12/25.
 */
@Service("topicService")
public class TopicServiceImpl extends BaseServiceImpl<Topic,Long,TopicRepository> implements TopicService {
   @Autowired
    @Override
    public void setEntityRepository(TopicRepository repository) {
        this.repository= repository;
    }

    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Override
    public void del(long id) {

    }
}
