package com.weikang.service.impl;

import com.github.pagehelper.PageHelper;
import com.weikang.dao.UserDao;
import com.weikang.service.UserService;
import com.weikang.vo.PageVo;
import com.weikang.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao dao;

    @Override
    public List<User> queryAll() {
        return dao.queryAll();
    }

    @Override
    public PageVo<User> fenYe(User user, int page, int rows) {
        PageVo<User> pageVo = new PageVo<>();
        PageHelper.startPage(page, rows);
        pageVo.setRows(dao.fenYe(user));
        pageVo.setTotal(dao.fenYeCount(user));
        return pageVo;
    }

    @Override
    public User queryById(int id) {
        return dao.queryById(id);
    }

    @Override
    public int add(User user) {
        return dao.add(user);
    }

    @Override
    public int update(User user) {
        return dao.update(user);
    }

    @Override
    public int delete(int id) {
        return dao.delete(id);
    }

    @Override
    public User login(User user) {
        return dao.login(user);
    }

    @Override
    public User queryByName(String name) {
        return dao.queryByName(name);
    }
}
