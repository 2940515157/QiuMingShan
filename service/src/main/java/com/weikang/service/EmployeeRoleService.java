package com.weikang.service;

import com.weikang.vo.EmployeeRole;
import com.weikang.vo.PageVo;

public interface EmployeeRoleService {
    //分页
    public PageVo<EmployeeRole> fenYe(EmployeeRole employeeRole, int page, int rows);

    //根据id查
    public EmployeeRole queryById(int id);

    //添加
    public int add(EmployeeRole employeeRole);

    //修改
    public int update(EmployeeRole employeeRole);

    //根据id删
    public int delete(int id);
}
