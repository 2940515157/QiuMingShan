package com.weikang.service.impl;

import com.github.pagehelper.PageHelper;
import com.weikang.dao.CarDao;
import com.weikang.dao.CarOutDao;
import com.weikang.service.CarOutService;
import com.weikang.service.CarService;
import com.weikang.vo.Car;
import com.weikang.vo.CarOut;
import com.weikang.vo.PageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CarOutServiceImpl implements CarOutService {
    @Autowired
    CarOutDao dao;

    @Override
    public PageVo<CarOut> fenYe(CarOut car, int page, int rows) {
        PageVo<CarOut> pageVo = new PageVo<>();
        PageHelper.startPage(page, rows);
        pageVo.setRows(dao.fenYe(car));
        pageVo.setTotal(dao.fenYeCount(car));
        return pageVo;
    }

    @Override
    public PageVo<CarOut> fenYe2(CarOut car, int page, int rows) {
        PageVo<CarOut> pageVo = new PageVo<>();
        PageHelper.startPage(page, rows);
        pageVo.setRows(dao.fenYe2(car));
        pageVo.setTotal(dao.fenYeCount2(car));
        return pageVo;
    }


    @Override
    public List<CarOut> queryAll() {
        return dao.queryAll();
    }

    @Override
    public List<CarOut> queryAll2() {
        return dao.queryAll2();
    }

    @Override
    public CarOut queryById(int id) {
        return dao.queryById(id);
    }

    @Override
    public int add(CarOut car) {
        return dao.add(car);
    }

    @Override
    public int update(CarOut car) {
        return dao.update(car);
    }

    @Override
    public int delete(int id) {
        return dao.delete(id);
    }

    @Override
    public int pz(int id) {
        return dao.pz(id);
    }

    @Override
    public int bpz(int id) {
        return dao.bpz(id);
    }
}
