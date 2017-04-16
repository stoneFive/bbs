package com.zx.sys.controller;

import com.zx.entity.model.News;
import com.zx.entity.model.Notes;
import com.zx.sys.repository.BaseRepository;
import com.zx.sys.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.convert.ReadingConverter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * Created by lance
 * on 2017/4/15.
 */
@Controller
@RequestMapping("/news")
public class NewsController extends BaseController<News,Long,NewsService> {
    @Autowired
    @Override
    public void setEntityService(NewsService newsService) {
        this.entityService = newsService;
    }
    @RequestMapping("/save.html")
    public  String save(HttpServletRequest request,News news){
        if(news.getId()==null || news.getId() ==0){
            news.setCreateTime(new Date());
            entityService.save(news);
        }else {
            News tmp = entityService.get(news.getId());
            tmp.setTitle(news.getTitle());
            tmp.setSubTitle(news.getSubTitle());
            tmp.setContents(news.getContents());
            tmp.setUpdateTime(new Date());
            entityService.update(tmp);
        }
      return "redirect:/news/index.html";
    }

    @RequestMapping("/del.html")
    public  String del(HttpServletRequest request, @RequestParam("id") long id){
        entityService.delete(id);
        return "redirect:/news/index.html";
    }
    @RequestMapping("/front/news.html")
    public  String news(HttpServletRequest request, @RequestParam("id") long id, Model model){
       News news = entityService.get(id);
        model.addAttribute("entity",news);
        return "/news/news";
    }
    @RequestMapping("/front/more.html")
    public String more(HttpServletRequest request,Model model){
        List<News> list  = entityService.listAll();
        model.addAttribute("entitys",list);
        return "notes/more";
    }

}
