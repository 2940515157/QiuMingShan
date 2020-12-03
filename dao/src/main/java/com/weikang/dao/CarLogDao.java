package com.weikang.dao;

import com.weikang.vo.CarLog;

import java.util.List;

public interface CarLogDao {
    //所有
    public List<CarLog> queryAll();

    //根据id查
    public CarLog queryById(int id);

    //根据车id查
    public List<CarLog> queryByCarId(int id);
    public List<CarLog> queryGroupByCarId();

    //分页
    public List<CarLog> fenYe(CarLog car);

    //数量
    public int fenYeCount(CarLog car);

    //车辆出租次数
    public int count(int id);

    //添加
    public int add(CarLog car);

    //修改
    public int update(CarLog car);

    //根据id删
    public int delete(int id);

}
