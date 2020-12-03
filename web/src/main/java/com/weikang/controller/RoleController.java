package com.weikang.controller;

import com.weikang.service.RoleService;
import com.weikang.vo.Menu;
import com.weikang.vo.PageVo;
import com.weikang.vo.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    RoleService service;

    @RequestMapping("/queryAll.action")
    @ResponseBody
    public List<Role> queryAll(){
        return service.queryAll();
    }

    @RequestMapping("/queryByUid.action")
    @ResponseBody
    public List<Role> queryByUid(int id){
        return service.queryRoleByEmpId(id);
    }

    //查所有
    @RequestMapping("/fenYe.action")
    @ResponseBody
    public PageVo<Role> fenYe(Role role,
                              @RequestParam(value = "page",defaultValue = "1") int page,
                              @RequestParam(value = "rows",defaultValue = "5") int rows){
        return service.fenYe(role,page,rows);
    }

    //根据id查
    @RequestMapping("/queryById.action")
    @ResponseBody
    public Role queryById(int id){
        return service.queryById(id);
    }

    //添加
    @RequestMapping(value = "/add.action")
    @ResponseBody
    public boolean add (Role role){
        int num = service.add(role);
        return num>0;
    }

    //修改
    @RequestMapping("/update.action")
    @ResponseBody
    public boolean update (Role role){
        int num = service.update(role);
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
