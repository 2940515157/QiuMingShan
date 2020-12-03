package com.weikang.controller;

import com.weikang.service.ShopService;
import com.weikang.vo.PageVo;
import com.weikang.vo.Shop;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/Shop")
public class ShopController {
    @Autowired
    ShopService service;

    //查所有
    @RequestMapping("/queryAll.action")
    @ResponseBody
    public List<Shop> queryAll(){
        return service.queryAll();
    }

    //分页
    @RequestMapping("/fenYe.action")
    @ResponseBody
    public PageVo<Shop> fenYe(Shop shop,
                              @RequestParam(value = "page",defaultValue = "1") int page,
                              @RequestParam(value = "rows",defaultValue = "5") int rows){
        return service.fenYe(shop,page,rows);
    }

    //根据id查
    @RequestMapping("/queryById.action")
    @ResponseBody
    public Shop queryById(int id){
        return service.queryById(id);
    }

    //添加
    @RequestMapping(value = "/add.action")
    @ResponseBody
    public boolean add (Shop shop){
        int num = service.add(shop);
        return num>0;
    }

    //修改
    @RequestMapping("/update.action")
    @ResponseBody
    public boolean update (Shop shop){
        int num = service.update(shop);
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
