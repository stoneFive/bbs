package com.zx.sys.controller;

import com.zx.entity.model.Account;
import com.zx.sys.service.AccountService;
import com.zx.util.Servlets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by lance
 * on 2017/3/25.
 */
@Controller
@RequestMapping("/account")
public class AccountController extends BaseController<Account,Long,AccountService> {
   @Autowired
    private AccountService accountService;
   @Autowired
    @Override
    public void setEntityService(AccountService accountService) {
        this.entityService = accountService;
    }

    @RequestMapping("/list.html")
    public String index(@RequestParam(value = "sortType", defaultValue = "auto",required = false) String sortType, String sortField,
                        @RequestParam(value = "page", defaultValue = "1",required = false) int pageNumber,
                        @RequestParam(value = "pageSize", defaultValue = "10" ,required = false) int pageSize, Model model,
                       HttpServletRequest request) {
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
        Page<Account> page = accountService.search(searchParams, pageNumber, pageSize, sortType, sortField);
        model.addAttribute("page", page);
        model.addAttribute("sortType", sortType);
        model.addAttribute("sortField", sortField);
        model.addAttribute("sortFields", sortFields);
        return "account/index";
    }

    @RequestMapping("/del.html")
    @ResponseBody
    public  String del(HttpServletRequest request,@RequestParam( "id") long id){

        try{
            accountService.delete(id);
            return "true";
        }catch (Exception e){
            return "false";
        }
    }
}
