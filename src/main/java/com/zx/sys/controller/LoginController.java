package com.zx.sys.controller;


import com.alibaba.fastjson.JSON;
import com.zx.entity.model.Account;
import com.zx.entity.system.User;
import com.zx.sys.service.AccountService;
import com.zx.sys.service.UserService;
import com.zx.util.Constant;
import com.zx.util.MD5Util;
import com.zx.util.http.AppResp;
import com.zx.util.http.InfoCode;
import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * Created by lance
 * on 2017/3/25.
 */
@Controller
public class LoginController  {
 @Autowired
    private AccountService accountService;

    @Autowired
    private UserService userService;
    @RequestMapping("/login.html")
    public String login(HttpServletRequest request){
        return "/login";

    }

    @RequestMapping("/lgc.html")
    @ResponseBody
    public String check(HttpServletRequest request){
        String name = request.getParameter("account");
        String pwd = request.getParameter("pwd");
        String utype = request.getParameter("utype");
        if(Integer.parseInt(utype)==0){
            Account tmp = accountService.findByAccount(name);
            if(tmp == null){
                return  new AppResp(InfoCode.FAILD,"帐号不存在!").toString();
            }
            if(!tmp.getPwd().equalsIgnoreCase(pwd)){
                return  new AppResp(InfoCode.FAILD,"密码不正确!").toString();
            }
            request.getSession().setAttribute(Constant.SESSION_USER_NAME,tmp.getNickName());
            request.getSession().setAttribute(Constant.SESSION_USER,tmp);
        }else{
            User tmp = userService.findByUserName(name);
            if(tmp == null){
                return  new AppResp(InfoCode.FAILD,"帐号不存在!").toString();
            }
            if(!tmp.getPassword().equalsIgnoreCase(MD5Util.MD5(pwd))){
                return  new AppResp(InfoCode.FAILD,"密码不正确!").toString();
            }
            request.getSession().setAttribute(Constant.SESSION_USER_NAME,tmp.getNickName());
            request.getSession().setAttribute(Constant.SESSION_USER,tmp);
        }

        return new AppResp(InfoCode.SUCCESS,"").toString();

    }
    @RequestMapping("/reg.html")
    public String reg(HttpServletRequest request , Account account){

        return "/reg";

    }
    @RequestMapping("/regsave.html")
    @ResponseBody
    public String regSave(HttpServletRequest request ){

      String account = request.getParameter("account");
      String nickName = request.getParameter("nickName");
      String email = request.getParameter("email");
      String password = request.getParameter("pwd");
        Account tmp = accountService.findByAccount(account);
        if(tmp != null){
            return  new AppResp(InfoCode.FAILD,"注册失败帐号已存在!").toString();
        }
        Account acc = new Account();
        acc.setNickName(nickName);
        acc.setCreateTime(new Date());
        acc.setEmail(email);
        acc.setPwd(password);
        acc.setAccount(account);
        accountService.save(acc);

        return new AppResp(InfoCode.SUCCESS,"注册成功,去登陆吧!").toString();

    }

    @RequestMapping("/logout.html")
    public  String logout(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        if(session == null){
            return "redirect:/index.html";
        }else{
            session.removeAttribute(Constant.SESSION_USER_NAME);
            request.getSession().invalidate();
            return "redirect:/index.html";
        }
    }
}
