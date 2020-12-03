package com.weikang.controller;

import com.alibaba.fastjson.JSONObject;
import com.weikang.service.CarShopService;
import com.weikang.vo.CarShop;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/CarShop")
public class CarShopController {
    @Autowired
    CarShopService service;

    //分页
    @RequestMapping("/fenYe.action")
    @ResponseBody
    public String fenYe(CarShop car,
                                 @RequestParam(value = "page",defaultValue = "1") int page,
                                 @RequestParam(value = "rows",defaultValue = "5") int rows){
        return JSONObject.toJSONString(service.fenYe(car,page,rows));
    }

    //根据id查
    @RequestMapping("/queryById.action")
    @ResponseBody
    public String queryById(int id){
        return JSONObject.toJSONString(service.queryById(id));
    }

    //添加
    @RequestMapping(value = "/add.action")
    @ResponseBody
    public boolean add (CarShop car){
        int num = service.add(car);
        return num>0;
    }

    //修改
    @RequestMapping("/update.action")
    @ResponseBody
    public boolean update (CarShop car){
        int num = service.update(car);
        return num>0;
    }

    //删除
    @RequestMapping("/delete.action")
    @ResponseBody
    public boolean delete (int id){
        int num = service.delete(id);
        return num>0;
    }
}
