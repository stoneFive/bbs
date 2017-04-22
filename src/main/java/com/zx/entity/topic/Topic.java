package com.zx.entity.topic;

import com.zx.entity.IdLongEntity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by lance
 * on 2016/12/24.
 * 话题实体
 */
@Entity
@Table(name ="t_topic")
public class Topic extends IdLongEntity {
    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }

    private  String commentText;

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    private long userId;
    private String name;


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


}
