package com.weikang.controller;

import com.alibaba.fastjson.JSONObject;
import com.weikang.service.CarOutService;
import com.weikang.service.CarService;
import com.weikang.vo.Car;
import com.weikang.vo.CarOut;
import com.weikang.vo.PageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/CarOut")
public class CarOutController {
    @Autowired
    CarOutService service;

    //查所有
    @RequestMapping("/queryAll.action")
    @ResponseBody
    public String queryAll(){
        return JSONObject.toJSONString(service.queryAll());
    }

    //查所有
    @RequestMapping("/queryAll2.action")
    @ResponseBody
    public String queryAll2(){
        return JSONObject.toJSONString(service.queryAll2());
    }

    //分页
    @RequestMapping("/fenYe.action")
    @ResponseBody
    public String fenYe(CarOut car,
                             @RequestParam(value = "page",defaultValue = "1") int page,
                             @RequestParam(value = "rows",defaultValue = "5") int rows){
        return JSONObject.toJSONString(service.fenYe(car,page,rows));
    }

    //分页2
    @RequestMapping("/fenYe2.action")
    @ResponseBody
    public String fenYe2(CarOut car,
                        @RequestParam(value = "page",defaultValue = "1") int page,
                        @RequestParam(value = "rows",defaultValue = "5") int rows){
        return JSONObject.toJSONString(service.fenYe2(car,page,rows));
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
    public boolean add (CarOut car){
        int num = service.add(car);
        return num>0;
    }

    //修改
    @RequestMapping("/update.action")
    @ResponseBody
    public boolean update (CarOut car){
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

    //批准
    @RequestMapping("/pz.action")
    @ResponseBody
    public boolean pz (int id){
        int num = service.pz(id);
        return num>0;
    }

    //不批准
    @RequestMapping("/bpz.action")
    @ResponseBody
    public boolean bpz (int id){
        int num = service.bpz(id);
        return num>0;
    }
}
