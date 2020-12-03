package com.weikang.service.impl;

import com.github.pagehelper.PageHelper;
import com.weikang.dao.CarDao;
import com.weikang.service.CarService;
import com.weikang.vo.Car;
import com.weikang.vo.PageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CarServiceImpl implements CarService {
    @Autowired
    CarDao dao;

    @Override
    public PageVo<Car> fenYe(Car car, int page, int rows) {
        PageVo<Car> pageVo = new PageVo<>();
        PageHelper.startPage(page, rows);
        pageVo.setRows(dao.fenYe(car));
        pageVo.setTotal(dao.fenYeCount(car));
        return pageVo;
    }

    @Override
    public List<Car> queryAll() {
        return dao.queryAll();
    }

    @Override
    public Car queryById(int id) {
        return dao.queryById(id);
    }

    @Override
    public int add(Car car) {
        return dao.add(car);
    }

    @Override
    public int update(Car car) {
        return dao.update(car);
    }

    @Override
    public int delete(int id) {
        return dao.delete(id);
    }
}
