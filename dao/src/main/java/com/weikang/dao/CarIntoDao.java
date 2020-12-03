package com.weikang.dao;

import com.weikang.vo.CarInto;
import com.weikang.vo.CarOut;

import java.util.List;

public interface CarIntoDao {
    //所有
    public List<CarInto> queryAll();

    //根据id查
    public CarInto queryById(int id);

    //分页
    public List<CarInto> fenYe(CarInto car);

    //分页2
    public List<CarInto> fenYe2(CarInto car);

    //数量
    public int fenYeCount(CarInto car);

    //数量2
    public int fenYeCount2(CarInto car);

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
