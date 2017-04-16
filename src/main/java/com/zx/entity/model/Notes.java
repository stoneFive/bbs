package com.zx.entity.model;

import com.zx.entity.IdLongEntity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by lance
 * on 2017/3/25.
 */
@Entity
@Table(name="t_notes")
public class Notes extends IdLongEntity{
    private  String title;
    private String subTitle;
    private String contents;
    private  int viewCount;
    private String fileUrl;



    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public String getFileUrl() {
        return fileUrl;
    }

    public void setFileUrl(String fileUrl) {
        this.fileUrl = fileUrl;
    }

    public String getSubTitle() {
        return subTitle;
    }

    public void setSubTitle(String subTitle) {
        this.subTitle = subTitle;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getViewCount() {
        return viewCount;
    }

    public void setViewCount(int viewCount) {
        this.viewCount = viewCount;
    }
}
