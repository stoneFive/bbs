package com.zx.sys.controller;

import com.zx.entity.model.News;
import com.zx.entity.model.Notes;
import com.zx.entity.topic.Topic;
import com.zx.shiro.exception.IncorrectAuthCodeException;
import com.zx.shiro.realm.AuthCodeFormAuthenticationFilter;
import com.zx.sys.service.NewsService;
import com.zx.sys.service.NotesService;
import com.zx.sys.service.TopicService;
import com.zx.util.Constant;
import com.zx.util.DrawUtils;
import com.zx.util.PngEncoder;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.*;
import java.util.List;

/**
 * Created by lance
 * on 2016/9/18.
 */
@Controller
public class IndexController {
    private final int PIC_WIDTH = 60;
    private final int PIC_HEIGHT = 20;

    @Autowired
    private NotesService notesService;
    @Autowired
    private NewsService newsService;
    @Autowired
    private TopicService topicService;
    @RequestMapping("/mgr/index.html")
    public  String home (HttpServletRequest request){

        return  "index";

    }

    @RequestMapping("/index.html")
    public  String index (HttpServletRequest request,Model model){

       java.util.List <Topic>  topicList = topicService.listAll();
        if(topicList.size()>10){
            topicList.subList(0,10);
        }
        List<Notes> notes = notesService.listAll();
        if(notes.size()>10){
            notes.subList(0,10);
        }
        List<News> newses = newsService.listAll();
        if(newses.size()>10){
            newses.subList(0,10);
        }
        model.addAttribute("newses",newses);
        model.addAttribute("notes",notes);
        model.addAttribute("topicList",topicList);
        return  "front/index";

    }

    @RequestMapping("/main.html")
    public  String rigth(HttpServletRequest request){
        return "main";

    }

    @RequestMapping(value = "/login.html", method = RequestMethod.GET)
    public String tologin(HttpServletRequest request) {
        Subject subject = SecurityUtils.getSubject();
        if(subject.isAuthenticated()){
            String path = request.getContextPath();
            int port = request.getServerPort();
            String basePath ="";
            if(port==80){
                basePath = "https://"+request.getServerName()+path+"/";
            }else{
                basePath = "https://"+request.getServerName()+":"+request.getServerPort()+path+"/";
            }
            return "redirect:"+basePath+"index.html";
        }
        return "login";
    }
    @RequestMapping(value = "/login.html", method = RequestMethod.POST)
    public String login(@RequestParam(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM) String userName, HttpServletRequest req, Model model) {
        model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, userName);
        Object exception = req.getAttribute(AuthCodeFormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
        String error = null;
        if(exception instanceof UnknownAccountException) {
            error = "*用名不存在";
        } else if(exception instanceof IncorrectCredentialsException) {
            error = "*用户名/密码错误";
        } else if(exception instanceof  IncorrectCredentialsException) {
            error = "*用户名/密码错误";
        } else if(exception instanceof IncorrectAuthCodeException) {
            error = "*验证码错误";
        } else if(exception instanceof LockedAccountException) {
            error = "*帐号已被锁定";
        } else if(exception != null) {
            error = "*其他错误：" + exception.getClass().getSimpleName();
        }
        model.addAttribute("error", error);
        return "login";
    }

    @RequestMapping(value = "/authcode.html", method = RequestMethod.GET)
    public String authCode(HttpServletRequest request,HttpServletResponse response){
        response.addHeader("pragma", "no-cache");
        response.addHeader("cache-control", "no-cache");
        response.addHeader("cache-control", "private");
        response.addHeader("expires", "0");
        response.setContentType("image/png");
        BufferedImage image = new BufferedImage(PIC_WIDTH, PIC_HEIGHT,BufferedImage.TYPE_INT_RGB);
        Graphics g = image.getGraphics();
        DrawUtils.drawBackground(g, PIC_WIDTH, PIC_HEIGHT);

        char[] rands = DrawUtils.random(4);
        DrawUtils.drawRands(g, rands);
        String code = new String(rands);
        PngEncoder pngEncoder = new PngEncoder(image);
        try {
            ServletOutputStream out = response.getOutputStream();
            out.write(pngEncoder.pngEncode());
            out.close();
            request.getSession().setAttribute(Constant.SESSION_AUTH_CODE,code);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping("/exception.html")
    public String exception(){

        return "common/exception";
    }
}
