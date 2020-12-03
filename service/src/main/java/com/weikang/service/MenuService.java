package com.weikang.service;

import com.weikang.vo.Menu;
import com.weikang.vo.PageVo;

import java.util.List;

public interface MenuService {
    /**
     * 根据父id,菜单类型 查询子菜单信息
     *
     * @param nodeType 菜单类型
     * @return
     */
    public List<Menu> queryByPidAndNodeType(int nodeType);

    //根据角色id查权限
    public List<Menu> queryMenuByRoleId(int id);

    //查分页
    public PageVo<Menu> fenYe(Menu menu, int page, int rows);

    //添加
    public int add(Menu menu);

    //修改
    public int update(Menu menu);

    //根据id删
    public int delete(int id);

    //根据id查
    public Menu queryById(int id);

    //根据角色id删除权限
    public int deleteByRoleId(int id);

    //添加权限
    public boolean addAuthority(int roleId,String menuIds);
}
