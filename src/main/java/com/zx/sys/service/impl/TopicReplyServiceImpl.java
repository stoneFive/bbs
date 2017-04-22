package com.zx.sys.service.impl;

import com.zx.entity.topic.TopicReply;
import com.zx.sys.repository.TopicReplyRepository;
import com.zx.sys.service.TopicReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by lance
 * on 2016/12/25.
 */
@Service("topicReplyService")
public class TopicReplyServiceImpl extends BaseServiceImpl<TopicReply,Long,TopicReplyRepository> implements TopicReplyService {

   @Autowired
   @Override
    public void setEntityRepository(TopicReplyRepository topicReplyRepository) {
        this.repository = topicReplyRepository;
    }
}
