package com.weikang.service.impl;

import com.github.pagehelper.PageHelper;
import com.weikang.dao.ShopDao;
import com.weikang.service.ShopService;
import com.weikang.vo.PageVo;
import com.weikang.vo.Shop;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShopServiceImpl implements ShopService {
    @Autowired
    ShopDao dao;

    @Override
    public PageVo<Shop> fenYe(Shop shop, int page, int rows) {
        PageVo<Shop> pageVo = new PageVo<>();
        PageHelper.startPage(page, rows);
        pageVo.setRows(dao.fenYe(shop));
        pageVo.setTotal(dao.fenYeCount(shop));
        return pageVo;
    }

    @Override
    public List<Shop> queryAll() {
        return dao.queryAll();
    }

    @Override
    public Shop queryById(int id) {
        return dao.queryById(id);
    }

    @Override
    public int add(Shop shop) {
        return dao.add(shop);
    }

    @Override
    public int update(Shop shop) {
        return dao.update(shop);
    }

    @Override
    public int delete(int id) {
        return dao.delete(id);
    }
}
