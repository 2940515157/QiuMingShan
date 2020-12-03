package com.weikang.dao;

import com.weikang.vo.CarOut;

import java.util.List;

public interface CarOutDao {
    //所有
    public List<CarOut> queryAll();

    //所有
    public List<CarOut> queryAll2();

    //根据id查
    public CarOut queryById(int id);

    //分页
    public List<CarOut> fenYe(CarOut car);

    //数量
    public int fenYeCount(CarOut car);

    //分页2
    public List<CarOut> fenYe2(CarOut car);

    //数量2
    public int fenYeCount2(CarOut car);

    //添加
    public int add(CarOut car);

    //修改
    public int update(CarOut car);

    //根据id删
    public int delete(int id);

    //批准
    public int pz(int id);

    //不批准
    public int bpz(int id);

    public int back(int id);
}
