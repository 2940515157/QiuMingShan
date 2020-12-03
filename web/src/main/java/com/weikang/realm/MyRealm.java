package com.weikang.realm;

import com.weikang.service.EmployeeService;
import com.weikang.service.MenuService;
import com.weikang.service.RoleService;
import com.weikang.service.UserService;
import com.weikang.vo.Employee;
import com.weikang.vo.User;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.*;

public class MyRealm extends AuthorizingRealm {

    @Autowired
    EmployeeService employeeService;
    @Autowired
    UserService userService;
    @Autowired
    RoleService roleService;
    @Autowired
    MenuService menuService;

    //授权
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

        //从参数中获取用户名
        AuthenticationToken token= (AuthenticationToken) principals.getPrimaryPrincipal();   //认证时，第一个参数传递的数据

        System.out.println("授权时，取到的用户名："+token.getPrincipal());

        //根据用户名查询拥有的角色名(角色id)   userdao.xxxx()
        List<String> roles = new ArrayList<String>();
        roles.add("manager");

        Set<String> menuCode=new HashSet<>();

        //根据用户名查询菜单code(菜单id)      userdao.xxxx()
        List<String> perms = new ArrayList<String>();
        // 1.角色  2. 菜单
        // id name  name
//        for (){
//            roles.add("name");
//            // .id;
//            //list<String>
//            menuCode.addAll(list);
//        }


        //返回权限信息(SimpleAuthorizationInfo)由父类AuthenticatingRealm 进行授权
        SimpleAuthorizationInfo authorizationInfo=new SimpleAuthorizationInfo();
        authorizationInfo.addRoles(roles);
        authorizationInfo.addStringPermissions(perms);

        return null;
    }

    //认证
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        UsernamePasswordToken token2= (UsernamePasswordToken) token;
        //如果是员工
        if (token2.getHost().equals("0")){
            String emloyeename=(String)token.getPrincipal();

            Employee employee=employeeService.queryByName(emloyeename);

            if (employee == null) {
                throw new UnknownAccountException("当前帐号不存在！！！");
            }
            SimpleAuthenticationInfo authenticationInfo =
                    new SimpleAuthenticationInfo(token, employee.getPassword(), this.getName());
            return authenticationInfo;

        }else {
            //通过token获取用户名
            String username = (String) token.getPrincipal();

            //通过用户名去用户表查询当前用户数据(数据库里面当前用户名对应的密码)
            User user = userService.queryByName(username);
            //判断   用户数据为空    当前帐号不存在
            if (user == null) {
                throw new UnknownAccountException("当前帐号不存在！！！");
            }
            SimpleAuthenticationInfo authenticationInfo =
                    new SimpleAuthenticationInfo(token, user.getPassword(), this.getName());
            return authenticationInfo;
        }
    }
}
