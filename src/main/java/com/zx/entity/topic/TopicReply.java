package com.zx.entity.topic;

import com.zx.entity.IdLongEntity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by lance
 * on 2016/12/24.
 */
@Entity
@Table(name="t_topic_reply")
public class TopicReply extends IdLongEntity{
    private long commentId;
    private long replyId;
    private long replyType;
    private String commentText;
    private String fromName;
    private long fromUid;
    private String toName;
    private long toUid;

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }

    public long getCommentId() {
        return commentId;
    }

    public void setCommentId(long commentId) {
        this.commentId = commentId;
    }

    public String getFromName() {
        return fromName;
    }

    public void setFromName(String fromName) {
        this.fromName = fromName;
    }

    public long getFromUid() {
        return fromUid;
    }

    public void setFromUid(long fromUid) {
        this.fromUid = fromUid;
    }

    public long getReplyId() {
        return replyId;
    }

    public void setReplyId(long replyId) {
        this.replyId = replyId;
    }

    public long getReplyType() {
        return replyType;
    }

    public void setReplyType(long replyType) {
        this.replyType = replyType;
    }

    public String getToName() {
        return toName;
    }

    public void setToName(String toName) {
        this.toName = toName;
    }

    public long getToUid() {
        return toUid;
    }

    public void setToUid(long toUid) {
        this.toUid = toUid;
    }
}
