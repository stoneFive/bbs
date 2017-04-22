package com.zx.entity.topic;

import com.zx.entity.IdLongEntity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by lance
 * on 2016/12/24.
 * 评论实体
 */
@Entity
@Table(name="t_topic_comment")
public class TopicComment extends IdLongEntity {
    private long topicId;
    private int topicType;

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }

    private String commentText;
    private long fromUid;
    private String fromName;
    private String toName;
    private long toUid;

    public String getFromName() {
        return fromName;
    }

    public void setFromName(String fromName) {
        this.fromName = fromName;
    }

    public String getToName() {
        return toName;
    }

    public void setToName(String toName) {
        this.toName = toName;
    }


    public long getFromUid() {
        return fromUid;
    }

    public void setFromUid(long fromUid) {
        this.fromUid = fromUid;
    }

    public long getTopicId() {
        return topicId;
    }

    public void setTopicId(long topicId) {
        this.topicId = topicId;
    }

    public int getTopicType() {
        return topicType;
    }

    public void setTopicType(int topicType) {
        this.topicType = topicType;
    }

    public long getToUid() {
        return toUid;
    }

    public void setToUid(long toUid) {
        this.toUid = toUid;
    }
}
