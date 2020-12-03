package com.weikang.service.impl;

import com.github.pagehelper.PageHelper;
import com.weikang.dao.EmployeeRoleDao;
import com.weikang.service.EmployeeRoleService;
import com.weikang.vo.EmployeeRole;
import com.weikang.vo.PageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmployeeRoleServiceImpl implements EmployeeRoleService {
    @Autowired
    EmployeeRoleDao dao;

    @Override
    public PageVo<EmployeeRole> fenYe(EmployeeRole employeeRole, int page, int rows) {
        PageVo<EmployeeRole> pageVo = new PageVo<>();
        PageHelper.startPage(page, rows);
        pageVo.setRows(dao.fenYe(employeeRole));
        pageVo.setTotal(dao.fenYeCount(employeeRole));
        return pageVo;
    }

    @Override
    public EmployeeRole queryById(int id) {
        return dao.queryById(id);
    }

    @Override
    public int add(EmployeeRole employeeRole) {
        return dao.add(employeeRole);
    }

    @Override
    public int update(EmployeeRole employeeRole) {
        return dao.update(employeeRole);
    }

    @Override
    public int delete(int id) {
        return dao.delete(id);
    }
}
