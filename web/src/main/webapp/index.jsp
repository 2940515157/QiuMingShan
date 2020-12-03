<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@ page import="org.apache.shiro.authc.UsernamePasswordToken" %><%--
  Created by IntelliJ IDEA.
  User: weikang
  Date: 2020/10/10
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<head>
    <title>秋名山租车后台</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-table.min.js"></script>
    <script src="js/bootstrap-table-zh-CN.min.js"></script>
    <script src="js/bootstrap-accordion.js"></script>
    <script src="js/jquery.easyui.min.js"></script>
    <script src="js/bootstrapValidator.js"></script>
    <script src="js/bootstrap-extend.js"></script>
    <script src="js/echarts.js"></script>
    <script src="js/bootstrap-select.js"></script>
    <link href="css/bootstrap-select.css" rel="stylesheet" />
    <link href="css/bootstrap-extend.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/bootstrap-table.min.css" rel="stylesheet"/>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrapValidator.css" rel="stylesheet" />

    <base href="<%=basePath%>">

</head>
<body>
<%
    //模拟过滤器操作
    // (访问任意资源时，如果是rememberMe效果访问，将用户名存入session，供下一个资源使用)
    if(SecurityUtils.getSubject().isRemembered()){
        //通过rememberme访问时，cookie中的rememberme对应的value自动填充到subject中
        UsernamePasswordToken token = (UsernamePasswordToken) SecurityUtils.getSubject().getPrincipal();

        SecurityUtils.getSubject().getSession().setAttribute("employeename",token.getUsername());

    }
%>
<div class="container">
    <%-- 导航栏--%>
    <nav class="navbar navbar-btn">
        <a class="navbar-brand" href="#">
            <img alt="Brand" src="img/2.png">
        </a>
        <h2 class="navbar-text"><strong><em>秋名山租车后台系统</em></strong></h2>
        <a style="margin-top: 10px;" class="navbar-brand" href="#"><strong>${sessionScope.employeename}</strong>已登录</a>
        <a style="margin-top: 10px;" class="navbar-brand" href="#" onclick="indexExit()">注销</a>
    </nav>

    <!-- 左侧可伸缩菜单栏 -->
    <div>
            <div class="col-md-2">
            <div class="panel-group" id="accordion"></div>
            </div>
            <div class="col-md-10">
                <div id="tabs"></div>
            </div>
        </div>
</div>

<script type="text/javascript">
    function indexExit(){
        $.post("employee/exit.action", function (data) {
            alert(data ? "注销成功" : "注销失败");
            location.href="admin.jsp";
        }, 'json');
    }
    $(function () {
        //初始化tab
        $("#tabs").initTabs();
    });
    $.get("menu/queryAll.action", function (data) {
        initaccordion("#accordion", data);
    }, "json");

    //点击菜单 背景选择效果添加
    $("#accordion").click(function (e) {
        //如果点击的是手风琴组件里面的列表项
        if ($(e.target).hasClass("list-group-item")) {
            //将所有列表项的选中状态清空
            $("#accordion").find("a").removeClass("active");
            //将点击的列表项设置上选中状态
            $(e.target).addClass("active");
            //打开/选中 一个选项卡 tab，展示当前点击的a标签的地址
            //addTabbable("#tabs", $(e.target).text(), $(e.target).attr("iconUrl"), $(e.target).attr("url"));
            $("#tabs").addTabs( $(e.target).text(), $(e.target).attr("iconUrl"), $(e.target).attr("url"));
        }
    });
</script>
</body>
</html>
