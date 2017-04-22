package com.zx.entity.system;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.zx.entity.IdLongEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.alibaba.fastjson.annotation.JSONField;

import com.google.common.collect.Lists;

/**
 * Created by huiwu on 2014/9/20.
 */
@Entity
@Table(name = "t_user")
public class User extends IdLongEntity {


	@JSONField(name = "user_name")
    private String userName;

    @JSONField(serialize = false)
    private String password;

    private String email;

    private String avatar;

    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date birthday;

    @JSONField(name = "nick_name")
    private String nickName;

    @JSONField(name = "real_name")
    private String realName;
    @JSONField(name = "last_login_ip")
    private String lastLoginIp;
    
    //1：正常，2：禁用
    private int status;
    
    private List<Role> roles = Lists.newArrayList(); // 有序的关联对象集合	
	
	// 多对多定义
	@ManyToMany
	@JoinTable(name = "t_user_role", joinColumns = { @JoinColumn(name = "userid") }, inverseJoinColumns = { @JoinColumn(name = "roleid") })
	// Fecth策略定义
	@Fetch(FetchMode.SUBSELECT)
	// 集合按id排序
	@OrderBy("id ASC")
	// 缓存策略
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getLastLoginIp() {
        return lastLoginIp;
    }

    public void setLastLoginIp(String lastLoginIp) {
        this.lastLoginIp = lastLoginIp;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @Temporal(TemporalType.TIMESTAMP)
    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    



	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,ToStringStyle.SHORT_PREFIX_STYLE);
	}
    
}
