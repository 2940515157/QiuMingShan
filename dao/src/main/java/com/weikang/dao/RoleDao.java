package com.weikang.dao;

import com.weikang.vo.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleDao {
    //所有角色
    public List<Role> queryAll();

    //根据员工id查角色
    public List<Role> queryRoleByEmpId(int id);

    //分页
    public List<Role> fenYe(Role role);

    //数量
    public int fenYeCount(Role role);

    //添加
    public int add(Role role);

    //修改
    public int update(Role role);

    //根据id删
    public int delete(int id);

    //根据id查
    public Role queryById(int roleId);

}
