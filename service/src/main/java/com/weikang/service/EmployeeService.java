package com.weikang.service;

import com.weikang.vo.Employee;
import com.weikang.vo.PageVo;

import java.util.List;

public interface EmployeeService {
    //登录
    public Employee login(Employee employee);

    //分页
    public PageVo<Employee> fenYe(Employee employee, int page, int rows);

    //查所有
    public List<Employee> queryAll();

    //根据id查
    public Employee queryById(int id);
    Employee queryByName(String name);
    //添加
    public int add(Employee employee);

    //修改
    public int update(Employee employee);

    //根据id删
    public int delete(int id);
}
