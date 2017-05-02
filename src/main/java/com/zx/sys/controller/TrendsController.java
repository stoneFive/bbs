package com.zx.sys.controller;

import com.zx.entity.model.News;
import com.zx.entity.model.Trends;
import com.zx.sys.service.NewsService;
import com.zx.sys.service.TrendsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * Created by lance
 * on 2017/4/15.
 */
@Controller
@RequestMapping("/trends")
public class TrendsController extends BaseController<Trends,Long,TrendsService> {
    @Autowired
    @Override
    public void setEntityService(TrendsService trendsService) {
        this.entityService = trendsService;
    }
    @RequestMapping("/save.html")
    public  String save(HttpServletRequest request,Trends trends){
        if(trends.getId()==null || trends.getId() ==0){
            trends.setCreateTime(new Date());
            entityService.save(trends);
        }else {
            Trends tmp = entityService.get(trends.getId());
            tmp.setTitle(trends.getTitle());
            tmp.setSubTitle(trends.getSubTitle());
            tmp.setContents(trends.getContents());
            tmp.setUpdateTime(new Date());
            entityService.update(tmp);
        }
      return "redirect:/trends/index.html";
    }

    @RequestMapping("/del.html")
    @ResponseBody
    public  String del(HttpServletRequest request, @RequestParam("id") long id){
        entityService.delete(id);
        return "true";
    }

    @RequestMapping("/front/trend.html")
    public  String trend(HttpServletRequest request, @RequestParam("id") long id, Model model){
        Trends trends = entityService.get(id);
        model.addAttribute("entity",trends);
        int count = trends.getViewCount()+1;
        trends.setViewCount(count);
        entityService.update(trends);
        return "/trends/trend";
    }
    @RequestMapping("/front/more.html")
    public String more(HttpServletRequest request,Model model){
        List<Trends> list  = entityService.listAll();
        model.addAttribute("entitys",list);
        return "trends/more";
    }
}
