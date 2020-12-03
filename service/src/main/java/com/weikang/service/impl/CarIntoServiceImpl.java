package com.weikang.service.impl;

import com.github.pagehelper.PageHelper;
import com.weikang.dao.CarIntoDao;
import com.weikang.dao.CarLogDao;
import com.weikang.dao.CarOutDao;
import com.weikang.service.CarIntoService;
import com.weikang.vo.CarInto;
import com.weikang.vo.CarLog;
import com.weikang.vo.PageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CarIntoServiceImpl implements CarIntoService {
    @Autowired
    CarIntoDao dao;
    @Autowired
    CarLogDao carLogDao;
    @Autowired
    CarOutDao carOutDao;
    @Override
    public PageVo<CarInto> fenYe(CarInto car, int page, int rows) {
        PageVo<CarInto> pageVo = new PageVo<>();
        PageHelper.startPage(page, rows);
        pageVo.setRows(dao.fenYe(car));
        pageVo.setTotal(dao.fenYeCount(car));
        return pageVo;
    }

    @Override
    public PageVo<CarInto> fenYe2(CarInto car, int page, int rows) {
        PageVo<CarInto> pageVo = new PageVo<>();
        PageHelper.startPage(page, rows);
        pageVo.setRows(dao.fenYe2(car));
        pageVo.setTotal(dao.fenYeCount2(car));
        return pageVo;
    }

    @Override
    public List<CarInto> queryAll() {
        return dao.queryAll();
    }

    @Override
    public CarInto queryById(int id) {
        return dao.queryById(id);
    }

    @Override
    public int add(CarInto car) {
        carOutDao.back(car.getCarOutId());
        return dao.add(car);
    }

    @Override
    public int update(CarInto car) {
        return dao.update(car);
    }

    @Override
    public int delete(int id) {
        return dao.delete(id);
    }

    @Override
    public int pz(int id) {
        //批准时添加数据到记录表
        CarInto carInto=dao.queryById(id);

        CarLog carLog=new CarLog();
        carLog.setCarIntoId(id);
        carLog.setCarId(carInto.getCarOut().getCar().getId());
        carLogDao.add(carLog);

        return dao.pz(id);
    }

    @Override
    public int bpz(int id) {
        return dao.bpz(id);
    }
}
