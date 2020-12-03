package com.weikang.dao;

import com.weikang.vo.Shop;

import java.util.List;

public interface ShopDao {
    //所有
    public List<Shop> queryAll();

    //根据id查
    public Shop queryById(int id);

    //分页
    public List<Shop> fenYe(Shop shop);

    //数量
    public int fenYeCount(Shop shop);

    //添加
    public int add(Shop shop);

    //修改
    public int update(Shop shop);

    //根据id删
    public int delete(int id);

}
