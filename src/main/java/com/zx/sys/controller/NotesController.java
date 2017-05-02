package com.zx.sys.controller;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Maps;
import com.zx.entity.model.News;
import com.zx.entity.model.Notes;
import com.zx.sys.service.NewsService;
import com.zx.sys.service.NotesService;
import org.apache.commons.lang3.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.*;

/**
 * Created by lance
 * on 2017/4/15.
 */
@Controller
@RequestMapping("/notes")
public class NotesController extends BaseController<Notes,Long,NotesService> {
    @Autowired
    @Override
    public void setEntityService(NotesService notesService) {
        this.entityService = notesService;
    }
    @RequestMapping("/save.html")
    public  String save(HttpServletRequest request,Notes notes,
                        Model model){

            if(notes.getId()==null || notes.getId() ==0){
                notes.setCreateTime(new Date());
                entityService.save(notes);
            }else {
                Notes tmp = entityService.get(notes.getId());
                tmp.setTitle(notes.getTitle());
                tmp.setSubTitle(notes.getSubTitle());
                tmp.setContents(notes.getContents());
                tmp.setUpdateTime(new Date());
                tmp.setFileUrl(notes.getFileUrl());
                entityService.update(tmp);
            }
      return "redirect:/notes/index.html";
    }

    @RequestMapping("/del.html")
    @ResponseBody
    public  String del(HttpServletRequest request, @RequestParam("id") long id){
        entityService.delete(id);
        return "true";
    }

    @RequestMapping("/front/notes.html")
    public  String notes(HttpServletRequest request, @RequestParam("id") long id, Model model){
        Notes notes = entityService.get(id);
        int count = notes.getViewCount() + 1;
        notes.setViewCount(count);
        entityService.update(notes);
        model.addAttribute("entity",notes);
        return "/notes/notes";
    }

    @RequestMapping("/front/more.html")
    public String more(HttpServletRequest request,Model model){
        List<Notes> list  = entityService.listAll();
        model.addAttribute("entitys",list);
        return "notes/more";
    }


}
