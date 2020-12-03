package com.weikang.dao;

import com.weikang.vo.Car;
import com.weikang.vo.CarShop;

import java.util.List;

public interface CarShopDao {
    //所有
    public List<CarShop> queryAll();

    //根据id查
    public CarShop queryById(int id);

    //分页
    public List<CarShop> fenYe(CarShop carShop);

    //数量
    public int fenYeCount(CarShop carShop);

    //添加
    public int add(CarShop carShop);

    //修改
    public int update(CarShop carShop);

    //根据id删
    public int delete(int id);

}
