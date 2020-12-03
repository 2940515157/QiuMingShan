package com.weikang.dao;

import com.weikang.vo.Car;

import java.util.List;

public interface CarDao {
    //所有
    public List<Car> queryAll();

    //根据id查
    public Car queryById(int id);

    //分页
    public List<Car> fenYe(Car car);

    //数量
    public int fenYeCount(Car car);

    //添加
    public int add(Car car);

    //修改
    public int update(Car car);

    //根据id删
    public int delete(int id);

}
