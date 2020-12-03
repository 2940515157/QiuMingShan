package com.weikang.controller;

import com.weikang.service.UserService;
import com.weikang.vo.PageVo;
import com.weikang.vo.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService service;

    //注销
    @RequestMapping(value = "/exit.action")
    @ResponseBody
    public void exit(){
        SecurityUtils.getSubject().logout();
    }

    //查所有
    @RequestMapping("/queryAll.action")
    @ResponseBody
    public List<User> queryAll(){
        return service.queryAll();
    }

    //分页
    @RequestMapping("/fenYe.action")
    @ResponseBody
    public PageVo<User> fenYe(User user,
                              @RequestParam(value = "page",defaultValue = "1") int page,
                              @RequestParam(value = "rows",defaultValue = "5") int rows){
        return service.fenYe(user,page,rows);
    }

    //根据id查
    @RequestMapping("/queryById.action")
    @ResponseBody
    public User queryById(int id){
        return service.queryById(id);
    }

    //添加
    @RequestMapping(value = "/add.action")
    @ResponseBody
    public boolean add (User user){
        int num = service.add(user);
        return num>0;
    }

    //修改
    @RequestMapping("/update.action")
    @ResponseBody
    public boolean update (User user){
        int num = service.update(user);
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
