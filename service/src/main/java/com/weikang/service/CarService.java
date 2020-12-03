package com.weikang.service;

import com.weikang.vo.Car;
import com.weikang.vo.PageVo;

import java.util.List;

public interface CarService {
    //查所有
    public List<Car> queryAll();

    //分页
    public PageVo<Car> fenYe(Car car, int page, int rows);

    //根据id查
    public Car queryById(int id);

    //添加
    public int add(Car car);

    //修改
    public int update(Car car);

    //根据id删
    public int delete(int id);
}
