package com.weikang.service;

import com.weikang.vo.Car;
import com.weikang.vo.CarOut;
import com.weikang.vo.PageVo;

import java.util.List;

public interface CarOutService {
    //查所有
    public List<CarOut> queryAll();

    public List<CarOut> queryAll2();

    //分页
    public PageVo<CarOut> fenYe(CarOut car, int page, int rows);

    //分页2
    public PageVo<CarOut> fenYe2(CarOut car, int page, int rows);


    //根据id查
    public CarOut queryById(int id);

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
}
