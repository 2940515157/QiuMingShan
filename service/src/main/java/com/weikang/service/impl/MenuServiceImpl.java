package com.weikang.service.impl;

import com.github.pagehelper.PageHelper;
import com.weikang.dao.MenuDao;
import com.weikang.service.MenuService;
import com.weikang.vo.Menu;
import com.weikang.vo.PageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
    MenuDao dao;

    @Override
    public List<Menu> queryByPidAndNodeType(int nodeType) {
        //查询所有的父菜单  父节点为0  菜单类型为1
        List<Menu> menus = dao.queryByPidAndNodeType(0, 1);

        //将所有的父菜单的子菜单查询出来，绑定好
        for (Menu menu : menus) {
            List<Menu> childsmenu = dao.queryByPidAndNodeType(menu.getId(), 2);
            menu.setChildMenu(childsmenu);

            if (nodeType == 3) {
                for (Menu menu2 : childsmenu) {
                    List<Menu> childsmenu2 = dao.queryByPidAndNodeType(menu2.getId(), 3);
                    menu2.setChildMenu(childsmenu2);
                }
            }
        }
        return menus;
    }

    @Override
    public List<Menu> queryMenuByRoleId(int id) {
        return null;
    }

    @Override
    public PageVo<Menu> fenYe(Menu menu, int page, int rows) {
        PageVo<Menu> pageVo = new PageVo<>();
        PageHelper.startPage(page, rows);
        pageVo.setRows(dao.fenYe(menu));
        pageVo.setTotal(dao.fenYeCount(menu));
        return pageVo;
    }

    @Override
    public int add(Menu menu) {
        return dao.add(menu);
    }

    @Override
    public int update(Menu menu) {
        return dao.update(menu);
    }

    @Override
    public int delete(int id) {
        return dao.delete(id);
    }

    @Override
    public Menu queryById(int id) {
        return dao.queryById(id);
    }

    @Override
    public int deleteByRoleId(int id) {
        return dao.deleteByRoleId(id);
    }

    @Override
    public boolean addAuthority(int roleId, String menuIds) {
        dao.deleteByRoleId(roleId);
        String[] menuId = menuIds.split(",");
        for (int i = 0; i < menuId.length; i++) {
            try {
                if (menuId[i] != null && menuId[i] != "") {
                    dao.addAuthority(roleId, Integer.parseInt(menuId[i]));
                }
            } catch (Exception e) {
                return false;
            }
        }
        return true;
    }
}
