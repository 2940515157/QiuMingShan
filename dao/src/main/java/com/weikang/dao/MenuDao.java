package com.weikang.dao;

import com.weikang.vo.Menu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MenuDao {
    /**
     * 根据父id,菜单类型 查询子菜单信息
     * @param pid   父id
     * @param nodeType 菜单类型
     * @return
     */
    public List<Menu> queryByPidAndNodeType(@Param("pid") int pid, @Param("nodeType") int nodeType);

    public List<Menu> fenYe(Menu menu);

    public int fenYeCount(Menu menu);

    //添加
    public int add(Menu menu);

    //修改
    public int update(Menu menu);

    //根据id删
    public int delete(int id);

    //根据id查
    public Menu queryById(int id);

    //根据角色id，查询到拥有权限的所有菜单信息
    public List<Menu> queryMenuByRoleId(int id);

    //根据角色id删除权限
    public int deleteByRoleId(int id);

    //添加权限
    public int addAuthority(@Param("roleId") int roleId,@Param("menuId") int menuId);

}
