package com.zx.sys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by lance
 * on 2017/3/25.
 */
@Controller
@RequestMapping("/about")
public class AboutController {
    @RequestMapping("/index.html")
    public  String index(HttpServletRequest request){
        return "front/about";
    }
}
