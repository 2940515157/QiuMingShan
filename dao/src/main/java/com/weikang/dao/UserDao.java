package com.weikang.dao;

import com.weikang.vo.Employee;
import com.weikang.vo.User;

import java.util.List;

public interface UserDao {

    //查所有
    public List<User> queryAll();

    //分页
    public List<User> fenYe(User user);

    //数量
    public int fenYeCount(User user);

    //根据id查
    public User queryById(int id);

    //添加
    public int add(User user);

    //修改
    public int update(User user);

    //根据id删
    public int delete(int id);

    //登陆
    public User login(User user);

    //根据名字查
    public User queryByName(String name);
}
