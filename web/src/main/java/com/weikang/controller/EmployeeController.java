package com.weikang.controller;

import com.weikang.service.EmployeeService;
import com.weikang.vo.Employee;
import com.weikang.vo.PageVo;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
    @Autowired
    EmployeeService service;

    //注销
    @RequestMapping(value = "/exit.action")
    @ResponseBody
    public boolean exit(){
        SecurityUtils.getSubject().logout();
        return true;
    }

    //查所有
    @RequestMapping("/fenYe.action")
    @ResponseBody
    public PageVo<Employee> fenYe(Employee employee,
                              @RequestParam(value = "page",defaultValue = "1") int page,
                              @RequestParam(value = "rows",defaultValue = "5") int rows){
        return service.fenYe(employee,page,rows);
    }

    @RequestMapping("/queryAll.action")
    @ResponseBody
    public List<Employee> queryAll(){
        return service.queryAll();
    }

    //根据id查
    @RequestMapping("/queryById.action")
    @ResponseBody
    public Employee queryById(int id){
        return service.queryById(id);
    }

    //添加
    @RequestMapping(value = "/add.action")
    @ResponseBody
    public boolean add (Employee employee){
        int num = service.add(employee);
        return num>0;
    }

    //修改
    @RequestMapping("/update.action")
    @ResponseBody
    public boolean update (Employee employee){
        int num = service.update(employee);
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
