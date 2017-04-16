package com.zx.sys.controller;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.sun.org.apache.xpath.internal.operations.Mod;
import com.zx.entity.model.Account;
import com.zx.entity.system.User;
import com.zx.entity.topic.Topic;
import com.zx.entity.topic.TopicComment;
import com.zx.entity.topic.TopicReply;
import com.zx.sys.service.BaseService;
import com.zx.sys.service.TopicCommentService;
import com.zx.sys.service.TopicReplyService;
import com.zx.sys.service.TopicService;
import com.zx.util.Constant;
import com.zx.util.Servlets;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.xml.crypto.Data;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by lance
 * on 2016/12/25.
 */
@Controller
@RequestMapping("/topic")
public class TopicController extends BaseController<Topic,Long,TopicService> {
    @Autowired
    private  TopicService topicService;
    @Autowired
    private TopicCommentService topicCommentService;
    @Autowired
    private TopicReplyService topicReplyService;
    @Autowired
    @Override
    public void setEntityService(TopicService topicService) {
    this.entityService = topicService;
    }
    @RequestMapping("/list.html")
    public  String index(HttpServletRequest request, Model model){
        List<Topic> topicList = topicService.listAll();
        List<TopicComment> topicComments = topicCommentService.listAll();
        List<TopicReply> topicReplies = topicReplyService.listAll();
        System.out.println( "topicReplies : " + topicReplies.size());
        Map<Long,List<TopicComment>> comments = Maps.newHashMap(); // 所有的评论
        Map<Long,List<TopicReply>> replys = Maps.newHashMap(); // 所有的回复

        List<TopicComment> tcs = null;
        List<TopicReply> trs = null;
        for (Topic topic : topicList){
            tcs  = new ArrayList<TopicComment>();

            for(TopicComment tc : topicComments){

                if(topic.getId() == tc.getTopicId()){
                    trs = new ArrayList<TopicReply>();
                    for (TopicReply tr : topicReplies){
                        if(tc.getId() == tr.getReplyId()){
                            trs.add(tr);
                        }

                    }
                    if(trs.size() >0){
                        replys.put(tc.getId(),trs);
                    }

                    tcs.add(tc);

                }
            }
            if(tcs.size() > 0){
                comments.put(topic.getId(),tcs);
            }

        }

        model.addAttribute("topics",topicList);
        model.addAttribute("comments",comments);
        model.addAttribute("replys",replys);

        return "topic/index";
    }
    @RequestMapping("/front/topic.html")
    public  String topic(HttpServletRequest request, @RequestParam ("id") long id, Model model){
        Topic topic = topicService.get(id);
        Map<String,Object> param = Maps.newHashMap();
        param.put("EQL_replyId",topic.getId());
        List<TopicReply> topicReplies = topicReplyService.find(param);

        param.clear();
        param.put("EQL_topicId",topic.getId());
        List<TopicComment> topicComments = topicCommentService.find(param);
       model.addAttribute("topic",topic);
       model.addAttribute("topicComments",topicComments);


        return "topic/topic";
    }


    @RequestMapping("/add.html")
    @ResponseBody
    public  String saveTopic(HttpServletRequest request){
        String text = request.getParameter("topic");
        Topic topic = new Topic();
        topic.setCommentText(text);
        topic.setName("admin");
        topic.setUserId(1);
        topic.setCreateTime(new Date());
        topicService.save(topic);
        Map<String,Object>  data = Maps.newHashMap();
        data.put("success",true);
        return JSON.toJSONString(data);
    }

    @RequestMapping("/comment/{topicId}/add.html")
    @ResponseBody
    private String addComment(HttpServletRequest request, @PathVariable ("topicId") long topicId){
        Object o =  request.getSession().getAttribute(Constant.SESSION_USER);
        String currName = "";
        long currId = 0l;
        if(o instanceof Account){
            Account account = (Account)o;
            currName = account.getNickName();
            currId = account.getId();
        }else {
            User user = (User)o;
            currName= user.getNickName();
            currId = user.getId();
        }
        String text = request.getParameter("topic");
        Topic t = topicService.get(topicId);
        TopicComment topicComment = new TopicComment();
        topicComment.setCreateTime(new Date());
        topicComment.setCommentText(text);
        topicComment.setFromName(currName);
        topicComment.setToUid(currId);

        topicComment.setToUid(t.getUserId());
        topicComment.setToName(t.getName());
        topicComment.setTopicId(t.getId());
        topicCommentService.save(topicComment);
        Map<String,Object>  data = Maps.newHashMap();
        data.put("success",true);
        return JSON.toJSONString(data);
    }

    @RequestMapping("/reply/{commentId}/add.html")
    @ResponseBody
    public  String addReply(HttpServletRequest request,@PathVariable("commentId") long commentId){
        String text = request.getParameter("topic");
        Object o =  request.getSession().getAttribute(Constant.SESSION_USER);
        String currName = "";
        long currId = 0l;
        if(o instanceof Account){
            Account account = (Account)o;
            currName = account.getNickName();
            currId = account.getId();
        }else {
            User user = (User)o;
            currName= user.getNickName();
            currId = user.getId();
        }
        TopicComment topicComment = topicCommentService.get(commentId);

        TopicReply topicReply = new TopicReply();
        topicReply.setCreateTime(new Date());
        topicReply.setCommentText(text);
        topicReply.setFromName(currName);
        topicReply.setFromUid(currId);
        topicReply.setToName(topicComment.getFromName());
        topicReply.setToUid(topicComment.getFromUid());
        topicReply.setCommentId(topicComment.getId());
        topicReply.setReplyType(1);
        topicReply.setReplyId(topicComment.getTopicId());
        topicReplyService.save(topicReply);
        Map<String,Object>  data = Maps.newHashMap();
        data.put("success",true);
        return JSON.toJSONString(data);
    }

    @RequestMapping("/all.html")
    public String lits(@RequestParam(value = "sortType", defaultValue = "auto") String sortType, String sortField,
                       @RequestParam(value = "page", defaultValue = "1") int pageNumber, @RequestParam
                               (value = "pageSize", defaultValue = PAGESIZE) int pageSize, Model model, HttpServletRequest request){
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
        Page<Topic> page = entityService.search(searchParams, pageNumber, pageSize, sortType, sortField);
        model.addAttribute("page", page);
        model.addAttribute("sortType", sortType);
        model.addAttribute("sortField", sortField);
        model.addAttribute("sortFields", sortFields);
        String msg = (String) request.getAttribute("msg");
        return "topic/list";
    }

    @RequestMapping("/del.html")
    @ResponseBody
    public  String del(HttpServletRequest request,@RequestParam( "id") long id){
        try{
            Topic topic = topicService.get(id);
            Map<String,Object> param = Maps.newHashMap();
            param.put("EQL_replyId",topic.getId());
            List<TopicReply> topicReplies = topicReplyService.find(param);
            for (TopicReply t : topicReplies){
                topicReplyService.delete(t.getId());
            }

            param.clear();
            param.put("EQL_topicId",topic.getId());
            List<TopicComment> topicComments = topicCommentService.find(param);
            for (TopicComment tt : topicComments){
                topicCommentService.delete(tt.getId());
            }

            topicService.delete(id);
            return "true";
        }catch (Exception e){
            return "false";
        }
    }
}
