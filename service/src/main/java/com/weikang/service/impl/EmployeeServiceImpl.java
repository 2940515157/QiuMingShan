package com.weikang.service.impl;

import com.github.pagehelper.PageHelper;
import com.weikang.dao.EmployeeDao;
import com.weikang.service.EmployeeService;
import com.weikang.vo.Employee;
import com.weikang.vo.PageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    EmployeeDao dao;
    @Override
    public Employee login(Employee employee) {
        return dao.login(employee);
    }

    @Override
    public PageVo<Employee> fenYe(Employee employee, int page, int rows) {
        PageVo<Employee> pageVo = new PageVo<>();
        PageHelper.startPage(page, rows);
        pageVo.setRows(dao.fenYe(employee));
        pageVo.setTotal(dao.fenYeCount(employee));
        return pageVo;
    }

    @Override
    public List<Employee> queryAll() {
        return dao.queryAll();
    }

    @Override
    public Employee queryById(int id) {
        return dao.queryById(id);
    }

    @Override
    public Employee queryByName(String name) {
        return dao.queryByName(name);
    }

    @Override
    public int add(Employee employee) {
        return dao.add(employee);
    }

    @Override
    public int update(Employee employee) {
        return dao.update(employee);
    }

    @Override
    public int delete(int id) {
        return dao.delete(id);
    }
}
