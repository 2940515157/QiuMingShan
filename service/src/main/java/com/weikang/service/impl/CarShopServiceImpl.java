package com.weikang.service.impl;

import com.github.pagehelper.PageHelper;
import com.weikang.dao.CarShopDao;
import com.weikang.service.CarShopService;
import com.weikang.vo.CarShop;
import com.weikang.vo.PageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CarShopServiceImpl implements CarShopService {
    @Autowired
    CarShopDao dao;

    @Override
    public PageVo<CarShop> fenYe(CarShop car, int page, int rows) {
        PageVo<CarShop> pageVo = new PageVo<>();
        PageHelper.startPage(page, rows);
        pageVo.setRows(dao.fenYe(car));
        pageVo.setTotal(dao.fenYeCount(car));
        return pageVo;
    }

    @Override
    public List<CarShop> queryAll() {
        return dao.queryAll();
    }

    @Override
    public CarShop queryById(int id) {
        return dao.queryById(id);
    }

    @Override
    public int add(CarShop car) {
        return dao.add(car);
    }

    @Override
    public int update(CarShop car) {
        return dao.update(car);
    }

    @Override
    public int delete(int id) {
        return dao.delete(id);
    }
}
