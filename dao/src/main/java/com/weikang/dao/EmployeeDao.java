package com.weikang.dao;

import com.weikang.vo.Employee;

import java.util.List;

public interface EmployeeDao {
    //登录
    public Employee login(Employee employee);

    //分页
    public List<Employee> fenYe(Employee employee);

    //查所有
    public List<Employee> queryAll();
    //数量
    public int fenYeCount(Employee employee);

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
