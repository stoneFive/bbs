package com.zx.sys.controller;

import com.zx.entity.model.News;
import com.zx.entity.model.Trends;
import com.zx.sys.service.NewsService;
import com.zx.sys.service.TrendsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

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
    public  String del(HttpServletRequest request, @RequestParam("id") long id){
        entityService.delete(id);
        return "redirect:/trends/index.html";
    }
}
