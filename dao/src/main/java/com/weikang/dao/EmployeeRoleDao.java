package com.weikang.dao;

import com.weikang.vo.EmployeeRole;

import java.util.List;

public interface EmployeeRoleDao {

    //分页
    public List<EmployeeRole> fenYe(EmployeeRole employeeRole);

    //数量
    public int fenYeCount(EmployeeRole employeeRole);

    //根据id查
    public EmployeeRole queryById(int id);

    //添加
    public int add(EmployeeRole employeeRole);

    //修改
    public int update(EmployeeRole employeeRole);

    //根据id删
    public int delete(int id);
}
