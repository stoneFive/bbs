package com.zx.sys.controller;

import com.alibaba.fastjson.JSONObject;
import com.zx.entity.system.User;
import com.zx.sys.service.UserService;
import com.zx.util.Constant;
import com.zx.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * Created by lance
 * on 2017/3/25.
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController<User,Long,UserService> {
    private static final String DEFAULT_PASSPORT = "123456";

    @Override
    @Autowired
    public void setEntityService(UserService userService) {
        this.entityService = userService;
    }

    @RequestMapping(value="/save.html",method= RequestMethod.POST)
    public String save(User user,Model model){

        if(user.getId() != null ){
            User u =    entityService.get(user.getId());
            u.setUserName(user.getUserName());
            u.setNickName(user.getNickName());
            u.setStatus(user.getStatus());
            u.setCreateTime(new Date());
            u.setUtype(user.getUtype());

            entityService.update(u);
        }else{
           User u =  entityService.findByUserName(user.getUserName());
            if(u != null){
                model.addAttribute("msg","账户已存在添加失败");
                return "user/edit";
            }
            user.setPassword(MD5Util.MD5(DEFAULT_PASSPORT));
            user.setCreateTime(new  Date());
            entityService.save(user);
        }
        return "redirect:/user/index.html";
    }

    @RequestMapping("/topwd.html")
    public String pwd(HttpServletRequest request,Model model){
        String account =  request.getParameter("account");
        model.addAttribute("curr",account);
        return "user/pwd";
    }
    @RequestMapping("/currpwd.html")
    public String currpwd(HttpServletRequest request,Model model){

        return "user/pwd1";
    }

    @RequestMapping(value="/currpwd.html",method=RequestMethod.POST)
    @ResponseBody
    public String recpwd(HttpServletRequest req , User user, Model model){
        String account =  (String) req.getSession().getAttribute(Constant.SESSION_USER_NAME);
        User u = entityService.findByUserName(account);
        String newPwd = req.getParameter("newpwd") ;
        String tmp = MD5Util.MD5(newPwd);
        u.setPassword(tmp);
        entityService.update(u);
        return "true";
    }
    @RequestMapping(value="/resetpwd.html",method=RequestMethod.POST)
    @ResponseBody
    public String resetpwd(HttpServletRequest req , User user, Model model){
        String account =  req.getParameter("account");
        User u = entityService.findByUserName(account);
        String newPwd = req.getParameter("newpwd") ;
        String tmp = MD5Util.MD5(newPwd);
        u.setPassword(tmp);
        entityService.update(u);
        return "true";
    }


    @RequestMapping("/del.html")
    public String del(HttpServletRequest request , @RequestParam("id") long id){
        entityService.delete(id);
        return  "true";
    }
}
