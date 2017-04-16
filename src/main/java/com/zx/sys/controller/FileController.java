package com.zx.sys.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Maps;
import com.zx.util.WebUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Calendar;
import java.util.Map;

/**
 * Created by lance
 * on 2017/4/16.
 */
@Controller
@RequestMapping("/upload")
public class FileController {
    @RequestMapping("/image.html")
    @ResponseBody
    public String imge(HttpServletRequest request,@RequestParam("file") MultipartFile[] multipartFiles){
       String bastPath =  WebUtil.getPath(request);
        String downloadPath = "";
        Map<String,Object> msg = Maps.newHashMap();
        try {
            request.setCharacterEncoding("utf-8");
            String path = request.getRealPath("/upload");
            Calendar c = Calendar.getInstance();
            String realPath = "/img/" + c.get(Calendar.DAY_OF_MONTH);
            File file = new File(path + realPath);
            if (!file.exists()) {
                file.mkdirs();
            }
            String realFileName;
            File destFile = null;

            for (MultipartFile multipartFile : multipartFiles) {
                realFileName = multipartFile.getOriginalFilename();
                String type = realFileName.substring(realFileName
                        .lastIndexOf(".") + 1);
                String fileName = System.currentTimeMillis()
                        + "." + type;
                destFile = new File(path + "/" + realPath + "/" + fileName);
                multipartFile.transferTo(destFile);
                String desPath = destFile.getPath();

                downloadPath =bastPath+ "upload" + realPath + "/" + fileName;
                System.out.println("url ->" +downloadPath);
                msg.put("code",0);
                msg.put("msg","success");
                JSONObject j = new JSONObject();

                j.put("src",downloadPath);
                msg.put("data",j);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(JSON.toJSONString(msg));
        return JSON.toJSONString(msg);
    }
    @RequestMapping("/imp.html")
    @ResponseBody
    public  String upload(HttpServletRequest request,@RequestParam("file") MultipartFile[] multipartFiles,
                          Model model) {
        String downloadPath = "";
        Map<String,String> msg = Maps.newHashMap();
        try {
            request.setCharacterEncoding("utf-8");
            String path = request.getRealPath("/upload");
            Calendar c = Calendar.getInstance();
            String realPath = "/" + c.get(Calendar.YEAR) + "/"
                    + c.get(Calendar.MONTH) + 1 + "/"
                    + c.get(Calendar.DAY_OF_MONTH);
            File file = new File(path + realPath);
            if (!file.exists()) {
                file.mkdirs();
            }
            String realFileName;
            File destFile = null;

            for (MultipartFile multipartFile : multipartFiles) {
                realFileName = multipartFile.getOriginalFilename();
                String type = realFileName.substring(realFileName
                        .lastIndexOf(".") + 1);
                String fileName = System.currentTimeMillis()
                        + "." + type;
                destFile = new File(path + "/" + realPath + "/" + fileName);
                multipartFile.transferTo(destFile);
                String desPath = destFile.getPath();
                System.out.println("url ->" +desPath);
                downloadPath = "/upload" + realPath + "/" + fileName;

                msg.put("url",downloadPath);
                msg.put("success","true");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return JSON.toJSONString(msg);
    }
}
