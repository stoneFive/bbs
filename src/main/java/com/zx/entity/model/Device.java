package com.zx.entity.model;

import com.zx.entity.IdLongEntity;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

/**
 * Created by lance
 * on 2017/4/8.
 */
@Entity
@Table(name="t_device")
public class Device extends IdLongEntity {
    private  String borrowName;
    private String phone;
    private String address;

    public String getCreater() {
        return creater;
    }

    public void setCreater(String creater) {
        this.creater = creater;
    }

    private String creater;


    public String getRephone() {
        return rephone;
    }

    public void setRephone(String rephone) {
        this.rephone = rephone;
    }

    private String rephone;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    private String title;//标题

    private String comments ;// 申请内容
    private String replay;// 审批回复原因
    private int status;
    private  String replayNam; // 审批人
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date borrowTime;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date returnTime;

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getBorrowName() {
        return borrowName;
    }

    public void setBorrowName(String borrowName) {
        this.borrowName = borrowName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getBorrowTime() {
        return borrowTime;
    }

    public void setBorrowTime(Date borrowTime) {
        this.borrowTime = borrowTime;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public String getReplay() {
        return replay;
    }

    public void setReplay(String replay) {
        this.replay = replay;
    }


    public Date getReturnTime() {
        return returnTime;
    }

    public void setReturnTime(Date returnTime) {
        this.returnTime = returnTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getReplayNam() {
        return replayNam;
    }

    public void setReplayNam(String replayNam) {
        this.replayNam = replayNam;
    }
}
