package com.weikang.service;

import com.weikang.vo.CarInto;
import com.weikang.vo.PageVo;

import java.util.List;

public interface CarIntoService {
    //查所有
    public List<CarInto> queryAll();

    //分页
    public PageVo<CarInto> fenYe(CarInto car, int page, int rows);

    //分页2
    public PageVo<CarInto> fenYe2(CarInto car, int page, int rows);

    //根据id查
    public CarInto queryById(int id);

    //添加
    public int add(CarInto car);

    //修改
    public int update(CarInto car);

    //根据id删
    public int delete(int id);

    //批准
    public int pz(int id);

    //不批准
    public int bpz(int id);
}
