package com.weikang.controller;

import com.weikang.service.MenuService;
import com.weikang.vo.Menu;
import com.weikang.vo.PageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/menu")
public class MenuController {
    @Autowired
    MenuService service;

    //查询出所有的菜单信息(菜单显示用，有层级关系)
    @RequestMapping("/queryAll.action")
    @ResponseBody
    public List<Menu> queryAll(){
        return  service.queryByPidAndNodeType(2);
    }

    //查询出所有的菜单信息(授权页面用，显示到按钮级别)
    @RequestMapping("/queryAll2.action")
    @ResponseBody
    public List<Menu> queryAll2(){
        return  service.queryByPidAndNodeType(3);
    }

    //查所有
    @RequestMapping("/fenYe.action")
    @ResponseBody
    public PageVo<Menu> fenYe(Menu menu,
                              @RequestParam(value = "page",defaultValue = "1") int page,
                              @RequestParam(value = "rows",defaultValue = "5") int rows){
        return service.fenYe(menu,page,rows);
    }

    //根据员工id查菜单
    @RequestMapping("/queryMenuByEmpId.action")
    @ResponseBody
    public List<Menu> queryMenuByEmpId(
            @RequestParam(value = "roleId",defaultValue = "0") int userId){
        return  service.queryMenuByRoleId(userId);
    }

    //根据id查
    @RequestMapping("/queryById.action")
    @ResponseBody
    public Menu queryById(int id){
        return service.queryById(id);
    }

    //添加
    @RequestMapping(value = "/add.action")
    @ResponseBody
    public boolean add (Menu menu){
        int num = service.add(menu);
        return num>0;
    }

    //修改
    @RequestMapping("/update.action")
    @ResponseBody
    public boolean update (Menu menu){
        int num = service.update(menu);
        return num>0;
    }

    //删除
    @RequestMapping("/delete.action")
    @ResponseBody
    public boolean delete (int id){
        int num = service.delete(id);
        return num>0;
    }

    //授权
    @RequestMapping("/addAuthority.action")
    @ResponseBody
    public boolean addAuthority(int roleId,String mids){
        return service.addAuthority(roleId,mids);
    }
}
