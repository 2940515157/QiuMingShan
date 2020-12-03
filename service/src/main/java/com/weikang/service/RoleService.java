package com.weikang.service;

import com.weikang.vo.PageVo;
import com.weikang.vo.Role;

import java.util.List;

public interface RoleService {

    //所有角色
    public List<Role> queryAll();

    //根据员工id查角色
    public List<Role> queryRoleByEmpId(int id);

    //分页
    public PageVo<Role> fenYe(Role role,int page,int rows);

    //添加
    public int add(Role role);

    //修改
    public int update(Role role);

    //根据id删
    public int delete(int id);

    //根据id查
    public Role queryById(int roleId);
}
