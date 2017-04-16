package com.zx.sys.controller;

import com.google.common.collect.Maps;
import com.zx.entity.model.Account;
import com.zx.entity.model.Device;
import com.zx.sys.service.DeviceService;
import com.zx.util.Constant;
import com.zx.util.Servlets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by lance
 * on 2017/4/8.
 */
@Controller
@RequestMapping("/device")
public class DeviceController extends BaseController<Device,Long,DeviceService> {
    @Autowired
    private DeviceService deviceService;
    @Override
    public void setEntityService(DeviceService deviceService) {
        this.entityService = deviceService;
    }

    @RequestMapping("/index.html")
    @Override
    public String page(@RequestParam(value = "sortType", defaultValue = "auto") String sortType,
                       String sortField,
                       @RequestParam(value = "page", defaultValue = "1") int pageNumber,
                       @RequestParam(value = "pageSize", defaultValue = PAGESIZE) int pageSize,
                       Model model, HttpServletRequest request) {
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
        Page<Device> page = deviceService.search(searchParams, pageNumber, pageSize, sortType, sortField);
        model.addAttribute("page", page);
        model.addAttribute("sortType", sortType);
        model.addAttribute("sortField", sortField);
        model.addAttribute("sortFields", sortFields);
        return "device/index";
    }

    @RequestMapping("/toAdd.html")
    public String toAdd(HttpServletRequest request, Model model){
        String name =  (String) request.getSession().getAttribute(Constant.SESSION_USER_NAME);
        Map<String,Object> param = Maps.newHashMap();
        param.put("EQS_creater",name);
        List<Device> devices = deviceService.find(param);
        model.addAttribute("device",devices);
        return "device/add";
    }

    @RequestMapping("/add.html")
    public String add(HttpServletRequest request, Model model,Device device){

        device.setCreateTime(new Date());
        device.setStatus(0); // 0 待审批 1 审批通过 2 未通过
      String name =  (String) request.getSession().getAttribute(Constant.SESSION_USER_NAME);
        device.setCreater(name);
        deviceService.save(device);
        return "redirect:/device/toAdd.html";
    }
    @RequestMapping("/del.html")
    @ResponseBody
    public  String del(HttpServletRequest request,@RequestParam( "id") long id){

        try{
            deviceService.delete(id);
            return "true";
        }catch (Exception e){
            return "false";
        }
    }

    @RequestMapping("/view/{id}.html")
    public String view(HttpServletRequest request, @PathVariable("id") long id,Model model){
        Device device =  deviceService.get(id);
        model.addAttribute("entity",device);
        return "device/view";

    }
@RequestMapping("/shenpi.html")
public String shenpi(HttpServletRequest request,Device device){
    Device device1 = deviceService.get(device.getId());
    device1.setReplayNam(device.getReplayNam());
    device1.setRephone(device.getRephone());
    device1.setUpdateTime(new Date());
    device1.setReplay(device.getReplay());
    device1.setStatus(device.getStatus());
    deviceService.update(device1);
    return "redirect:/device/index.html";
}



}
