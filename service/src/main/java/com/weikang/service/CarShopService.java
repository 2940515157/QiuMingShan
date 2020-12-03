package com.weikang.service;

import com.weikang.vo.CarShop;
import com.weikang.vo.PageVo;

import java.util.List;

public interface CarShopService {
    //查所有
    public List<CarShop> queryAll();

    //分页
    public PageVo<CarShop> fenYe(CarShop carShop, int page, int rows);

    //根据id查
    public CarShop queryById(int id);

    //添加
    public int add(CarShop carShop);

    //修改
    public int update(CarShop carShop);

    //根据id删
    public int delete(int id);
}
