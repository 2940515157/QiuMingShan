<%--
  Created by IntelliJ IDEA.
  User: weikang
  Date: 2020/10/23
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <title>秋名山租车后台登录</title>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-table.min.js"></script>
    <script src="js/bootstrap-table-zh-CN.min.js"></script>
    <script src="js/bootstrap-accordion.js"></script>
    <script src="js/jquery.easyui.min.js"></script>
    <script src="js/bootstrapValidator.js"></script>
    <script src="js/bootstrap-extend.js"></script>
    <script src="js/bootstrap-select.js"></script>
    <link href="css/bootstrap-select.css" rel="stylesheet"/>
    <link href="css/bootstrap-extend.css" rel="stylesheet"/>
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/bootstrap-table.min.css" rel="stylesheet"/>
    <link href="css/bootstrap.css" rel="stylesheet"/>
    <link href="css/bootstrapValidator.css" rel="stylesheet"/>
    <script type="text/javascript" src="js/index.js"></script>
    <link rel="stylesheet" href="css/index.css"/>
</head>
<body>
<div>
    <div>
    <!--导航-->
    <nav class="navbar navbar-default" style="padding: 10px;border-radius: 0;margin-bottom: 0">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="javascript:;" style="color: dodgerblue;font-size: 30px;font-weight: bold">
                    <em>秋名山租车后台登录</em>
                </a>
            </div>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a style="color: dodgerblue" href="#" onclick="userLogin()">用户登录</a>
                </li>
            </ul>
        </div>

    </nav>
    </div>

    <!--图片轮播-->
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <div>
            <ul class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ul>
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <a href="javascript:;"
                       style="display: block;width: 100%;height: 680px;background: no-repeat url('img/001.png') 30% 100%">
                    </a>
                    <div class="carousel-caption">
                        <h1 style="margin-left: 700px"><em>低至299/天</em></h1>
                    </div>
                </div>
                <div class="item">
                    <a href="javascript:;"
                       style="display: block;width: 100%;height: 680px;background: no-repeat url('img/002.png') 30% 100%">
                    </a>
                    <div class="carousel-caption">
                        <h1 style="margin-left: 700px"><em>低至399/天</em></h1>
                    </div>
                </div>
                <div class="item">
                    <a href="javascript:;"
                       style="display: block;width: 100%;height: 680px;background: no-repeat url('img/003.png') 30% 100%">
                    </a>
                    <div class="carousel-caption">
                        <h1 style="margin-left: 700px"><em>低至249/天</em></h1>
                    </div>
                </div>
            </div>
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">上一页</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">下一页</span>
            </a>
        </div>
    </div>

    <!-- 登录-->
    <div id="adminLoginWin" style="padding: 20px;position: absolute;width: 300px;margin-left: 600px;margin-top: -550px;background-color: gainsboro">
            <div>
                <form id="adminLoginForm" method="post" action="employeelogin.action">
                    <h3 align="center">管理员登录</h3>
                    <div class="form-group">
                        <label>账号</label>
                        <input name="name" type="text" class="form-control" placeholder="用户名/手机号" data-bv-notempty="true" data-bv-notempty-message="用户名不能为空" />
                    </div>
                    <div class="form-group">
                        <label>密码</label>
                        <input name="password" type="password" class="form-control" placeholder="密码" data-bv-notempty="true" data-bv-notempty-message="密码不能为空"/>
                    </div>
                    <div class="input-group">
                        <input  name="rememberme" type="checkbox" value="true"/>记住我
                    </div>
                    <button id="adminLogin" type="submit" class="btn btn-danger btn-block">登录</button>
                    <button id="adminRegister" type="button" class="btn btn-primary btn-block">注册</button>
                </form>
            </div>
    </div>

    <!-- 注册-->
    <div id="adminRegisterWin" style="padding: 20px;position: absolute;width: 350px;margin-left: 600px;margin-top: -550px;background-color: gainsboro">
        <div>
            <form id="adminRegisterForm">
                <h3 align="center">管理员注册</h3>
                <div class="form-group">
                    <label>账号</label>
                    <input name="name" type="text" class="form-control" placeholder="用户名/手机号" data-bv-notempty="true" data-bv-notempty-message="用户名不能为空" />
                </div>
                <div class="form-group">
                    <label>密码</label>
                    <input name="password" type="password" class="form-control" placeholder="密码" data-bv-notempty="true" data-bv-notempty-message="密码不能为空"/>
                </div>
                <button id="reAdminLogin" type="button" class="btn btn-danger btn-block">注册</button>
                <button id="reAdminLoginClose" type="button" class="btn btn-default btn-block">取消</button>
            </form>
        </div>
    </div>
</div>
<script>
    function userLogin(){
        location.href="login.jsp";
    }
    $("#adminRegisterWin").hide();

    window.onload=function () {
        var msg = "${errmsg}";

        if(msg!=""){
            alert(msg);
        }

    }

    //点击登录按钮
    /*$("#adminLogin").click(function () {
        $("#adminLoginForm").bootstrapValidator('validate');  //提交验证
        if ($("#adminLoginForm").data('bootstrapValidator').isValid()) {  //获取验证结果
            $('#adminLoginForm').form('submit', {
                url: "employeelogin.action",

                success: function (data) {
                    alert(data =="true"? "登录成功" : "账号或密码错误");
                    //清处表单数据
                    $('#adminLoginForm')[0].reset();
                    if (data !="true"){
                        return ;
                    }
                    location.href="index.jsp";
                }
            });
        }
    })*/

    //点击注册按钮
    $("#adminRegister").click(function () {
        $("#adminLoginWin").hide();
        $("#adminRegisterWin").show();
    });

    //点击注册取消按钮
    $("#reAdminLoginClose").click(function () {
        //清处表单数据
        $('#adminRegisterForm')[0].reset();
        //
        $("#adminRegisterWin").hide();
        $("#adminLoginWin").show();

    });

    //点击注册按钮
    $("#reAdminLogin").click(function () {
        $("#adminRegisterForm").bootstrapValidator('validate');  //提交验证
        if ($("#adminRegisterForm").data('bootstrapValidator').isValid()) {  //获取验证结果
            $('#adminRegisterForm').form('submit', {
                url: "employee/add.action",
                success: function (data) {
                    alert(data=="true" ? "注册成功" : "注册失败");
                    if (data=="true"){
                        $('#adminRegisterForm').form('submit', {
                            url: "employee/login.action",
                            success: function (data) {
                                alert(data=="true" ? "已登录" : "请重新登录");
                                //清除表单验证
                                $('#adminRegisterForm').data("bootstrapValidator").resetForm();
                                //清处表单数据
                                $('#adminRegisterForm')[0].reset();
                                location.href="index.jsp";
                            }
                        });
                    }
                    //清除表单验证
                    $('#adminRegisterForm').data("bootstrapValidator").resetForm();
                    //清处表单数据
                    $('#adminRegisterForm')[0].reset();
                }
            });
        }
    })
</script>
</body>
</html>
