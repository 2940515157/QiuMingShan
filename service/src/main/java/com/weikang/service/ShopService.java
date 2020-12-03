package com.weikang.service;

import com.weikang.vo.PageVo;
import com.weikang.vo.Shop;
import com.weikang.vo.User;

import java.util.List;

public interface ShopService {
    //查所有
    public List<Shop> queryAll();

    //分页
    public PageVo<Shop> fenYe(Shop shop, int page, int rows);

    //根据id查
    public Shop queryById(int id);

    //添加
    public int add(Shop shop);

    //修改
    public int update(Shop shop);

    //根据id删
    public int delete(int id);
}
