package com.zx.sys.service.impl;

import com.zx.entity.topic.TopicComment;
import com.zx.sys.repository.TopicComRepository;
import com.zx.sys.service.TopicCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by lance
 * on 2016/12/25.
 */
@Service("topicCpmmentService")
public class TopicCpmmentServiceImpl extends BaseServiceImpl<TopicComment,Long,TopicComRepository> implements TopicCommentService {
    @Autowired
    @Override
    public void setEntityRepository(TopicComRepository repository) {
    this.repository = repository;
    }
}
