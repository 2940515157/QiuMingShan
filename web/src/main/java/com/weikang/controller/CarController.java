package com.weikang.controller;

import com.weikang.service.CarService;
import com.weikang.vo.Car;
import com.weikang.vo.PageVo;
import com.weikang.vo.Shop;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/Car")
public class CarController {
    @Autowired
    CarService service;

    //查所有
    @RequestMapping("/queryAll.action")
    @ResponseBody
    public List<Car> queryAll(){
        return service.queryAll();
    }

    //分页
    @RequestMapping("/fenYe.action")
    @ResponseBody
    public PageVo<Car> fenYe(Car car,
                             @RequestParam(value = "page",defaultValue = "1") int page,
                             @RequestParam(value = "rows",defaultValue = "5") int rows){
        return service.fenYe(car,page,rows);
    }

    //根据id查
    @RequestMapping("/queryById.action")
    @ResponseBody
    public Car queryById(int id){
        return service.queryById(id);
    }

    //添加
    @RequestMapping(value = "/add.action")
    @ResponseBody
    public boolean add (Car car){
        int num = service.add(car);
        return num>0;
    }

    //修改
    @RequestMapping("/update.action")
    @ResponseBody
    public boolean update (Car car){
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
