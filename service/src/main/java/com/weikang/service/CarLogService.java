package com.weikang.service;

import com.weikang.vo.CarLog;
import com.weikang.vo.PageVo;

import java.util.List;

public interface CarLogService {
    //查所有
    public List<CarLog> queryAll();

    //分页
    public PageVo<CarLog> fenYe(CarLog car, int page, int rows);

    //根据id查
    public CarLog queryById(int id);

    //添加
    public int add(CarLog car);

    //修改
    public int update(CarLog car);

    //根据id删
    public int delete(int id);

}
