package com.weikang.controller;

import com.weikang.vo.Employee;
import com.weikang.vo.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LoginController {

    @PostMapping("/employeelogin.action")
    public String login(Employee employee,
                         @RequestParam(value = "rememberme",defaultValue = "false") boolean rememberme,
                        HttpServletRequest request){

        String errmsg = "";
        //d.从SecurityUtils里边创建一个subject
        Subject subject = SecurityUtils.getSubject();

        //e.在认证提交前准备token（令牌）   //第一个参数：用户名  第二个参数：密码
        UsernamePasswordToken token = new UsernamePasswordToken(employee.getName(), employee.getPassword());

        //设置token的记住我rememberMe功能
        token.setRememberMe(rememberme);

        //设置员工还是用户
        token.setHost("0");

        try {
            //f.执行认证提交
            subject.login(token);

            //使用shiro的session保存用户名
            subject.getSession().setAttribute("employeename", employee.getName());

            //认证完，没有异常，正常登录，请跳转到 首页
            return "/index.jsp";

        } catch (UnknownAccountException e) {
            errmsg = "认证失败：帐号不存在！";
        } catch (IncorrectCredentialsException e) {
            errmsg = "认证失败：密码不对！";
        } catch (Exception e) {
            e.printStackTrace();
            errmsg = "认证失败：未知异常！";
        }

        if (errmsg != "") {  //验证失败
            request.setAttribute("errmsg", errmsg);
            return "/admin.jsp";
        }
        return "";
    }

    @PostMapping("/userlogin.action")
    public String login(User user,
                        @RequestParam(value = "rememberme",defaultValue = "false") boolean rememberme,
                        HttpServletRequest request) {
        String errmsg = "";
        //d.从SecurityUtils里边创建一个subject
        Subject subject = SecurityUtils.getSubject();

        //e.在认证提交前准备token（令牌）   //第一个参数：用户名  第二个参数：密码
        UsernamePasswordToken token = new UsernamePasswordToken(user.getName(), user.getPassword());

        //设置token的记住我rememberMe功能
        token.setRememberMe(rememberme);
        //设置员工还是用户
        token.setHost("1");

        try {
            //f.执行认证提交
            subject.login(token);

            //使用shiro的session保存用户名
            subject.getSession().setAttribute("username", user.getName());

            //认证完，没有异常，正常登录，请跳转到 首页
            return "/login.jsp";

        } catch (UnknownAccountException e) {
            errmsg = "认证失败：帐号不存在！";
        } catch (IncorrectCredentialsException e) {
            errmsg = "认证失败：密码不对！";
        } catch (Exception e) {
            e.printStackTrace();
            errmsg = "认证失败：未知异常！";
        }

        if (errmsg != "") {  //验证失败
            request.setAttribute("errmsg", errmsg);
            return "/login.jsp";
        }
        return "";
    }
}
