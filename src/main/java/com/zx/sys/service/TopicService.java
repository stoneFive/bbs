package com.zx.sys.service;

import com.zx.entity.topic.Topic;

/**
 * Created by lance
 * on 2016/12/25.
 */
public interface TopicService extends BaseService<Topic,Long> {
    public  void del(long id);
}
