package com.weikang.service.impl;

import com.github.pagehelper.PageHelper;
import com.weikang.dao.RoleDao;
import com.weikang.service.RoleService;
import com.weikang.vo.PageVo;
import com.weikang.vo.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    RoleDao dao;
    @Override
    public List<Role> queryAll() {
        return dao.queryAll();
    }

    @Override
    public List<Role> queryRoleByEmpId(int id) {
        return dao.queryRoleByEmpId(id);
    }

    @Override
    public PageVo<Role> fenYe(Role role,int page,int rows) {
        PageVo<Role> pageVo = new PageVo<>();
        PageHelper.startPage(page, rows);
        pageVo.setRows(dao.fenYe(role));
        pageVo.setTotal(dao.fenYeCount(role));
        return pageVo;
    }

    @Override
    public int add(Role role) {
        return dao.add(role);
    }

    @Override
    public int update(Role role) {
        return dao.update(role);
    }

    @Override
    public int delete(int id) {
        return dao.delete(id);
    }

    @Override
    public Role queryById(int roleId) {
        return dao.queryById(roleId);
    }
}
