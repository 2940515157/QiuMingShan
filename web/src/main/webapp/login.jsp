<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@ page import="org.apache.shiro.authc.UsernamePasswordToken" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>秋名山租车</title>
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
    <link href=css/bootstrap-table.min.css" rel="stylesheet"/>
    <link href="css/bootstrap.css" rel="stylesheet"/>
    <link href="css/bootstrapValidator.css" rel="stylesheet"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/index.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css"/>
</head>
<body>
<%
    //模拟过滤器操作
    // (访问任意资源时，如果是rememberMe效果访问，将用户名存入session，供下一个资源使用)
    if(SecurityUtils.getSubject().isRemembered()){
        //通过rememberme访问时，cookie中的rememberme对应的value自动填充到subject中
        UsernamePasswordToken token = (UsernamePasswordToken) SecurityUtils.getSubject().getPrincipal();

        SecurityUtils.getSubject().getSession().setAttribute("username",token.getUsername());

    }
%>
<div id="box">
    <!--导航-->
    <nav class="navbar navbar-default" style="padding: 10px;border-radius: 0;margin-bottom: 0">
        <div class="container">
            <div class="navbar-header">
                <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav1">
                    <span class="glyphicon glyphicon-th-list"></span>
                </button>
                <a class="navbar-brand" href="javascript:;" style="color: dodgerblue;font-size: 30px;font-weight: bold">
                    <em>秋名山租车</em>
                </a>
            </div>

            <div id="nav1" class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li>
                        <a onclick="showMain()" href="javascript:;">首页</a>
                    </li>
                    <li>
                        <a href="javascript:;">租车</a>
                    </li>
                    <li>
                        <a href="javascript:;">门店</a>
                    </li>
                    <li>
                        <a href="javascript:;" onclick="showMy()">个人中心</a>
                    </li>

                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a><span style="color: dodgerblue"><strong>${sessionScope.username}</strong></span></a>
                    </li>
                    <li>
                        <a href="#" data-toggle="modal" data-target="#indexLoginWin">登录</a>
                    </li>
                    <li>
                        <a href="#" data-toggle="modal" data-target="#indexRegisterWin">注册</a>
                    </li>
                    <li>
                        <a href="#" onclick="exitLogin()">注销</a>
                    </li>
                    <li>
                        <a href="#" onclick="adminLogin()">管理员</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- 登录-->
    <div id="indexLoginWin" class="modal" data-backdrop="static">
        <div class="modal-dialog">
            <!--内容容器 -->
            <div class="modal-content" style="width: 300px;margin-left: 600px">
                <!-- 头部标题-->
                <div class="modal-title text-center">
                </div>
                <!-- 主体内容-->
                <div class="modal-body">
                    <form id="indexLoginForm" method="post" action="userlogin.action">
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
                        <button id="indexLogin" type="submit" class="btn btn-danger btn-block">登录</button>
                        <button id="indexLoginClose" type="button" class="btn btn-default btn-block">取消</button>
                    </form>
                </div>
                <!-- 底部信息-->
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>

    <!-- 注册-->
    <div id="indexRegisterWin" class="modal" data-backdrop="static">
        <div class="modal-dialog">
            <!--内容容器 -->
            <div class="modal-content" style="width: 300px;margin-left: 600px">
                <!-- 头部标题-->
                <div class="modal-title text-center">
                </div>
                <!-- 主体内容-->
                <div class="modal-body">
                    <form id="indexRegisterForm">
                        <div class="form-group">
                            <label>账号</label>
                            <input name="name" type="text" class="form-control" placeholder="用户名/手机号" data-bv-notempty="true" data-bv-notempty-message="用户名不能为空" />
                        </div>
                        <div class="form-group">
                            <label>密码</label>
                            <input name="password" type="password" class="form-control" placeholder="密码" data-bv-notempty="true" data-bv-notempty-message="密码不能为空"/>
                        </div>
                        <button id="reindexLogin" type="button" class="btn btn-danger btn-block">注册</button>
                        <button id="reindexLoginClose" type="button" class="btn btn-default btn-block">取消</button>
                    </form>
                </div>
                <!-- 底部信息-->
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>

    <!-- 展示车辆-->
    <div id="indexShowCarWin" class="modal" data-backdrop="static">
        <div class="modal-dialog">
            <!--内容容器 -->
            <div class="modal-content" style="width: 1100px;margin-left: -200px;">
                <!-- 头部标题-->
                <div class="modal-title text-center">
                </div>
                <!-- 主体内容-->
                <%-- 数据表格 --%>
                <div>
                    <table id="indexCarTable"></table>
                </div>
                <%-- 初始化表格数据 --%>
                <script type="text/javascript">
                    $('#indexCarTable').bootstrapTable({
                        url: 'Car/fenYe.action',
                        method: 'GET',                      //请求方式（*）
                        toolbar: '#CarToolbar',            //工具按钮用哪个容器
                        striped: true,                      //是否显示行间隔色
                        cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                        pagination: true,                   //是否显示分页（*）
                        sortable: true,                     //是否启用排序
                        sortOrder: "asc",                   //排序方式
                        sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                        pageNumber: 1,                      //初始化加载第一页，默认第一页,并记录
                        pageSize: 5,                        //每页的记录行数（*）
                        pageList: [5, 10],                  //可供选择的每页的行数（*）
                        search: false,                      //是否显示表格搜索
                        strictSearch: true,                 //是否严格搜索
                        showColumns: true,                  //是否显示所有的列（选择显示的列）
                        showRefresh: true,                  //是否显示刷新按钮
                        minimumCountColumns: 2,             //最少允许的列数
                        clickToSelect: true,                //是否启用点击选中行
                        height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                        uniqueId: "id",                     //每一行的唯一标识，一般为主键列
                        showToggle: true,                   //是否显示详细视图和列表视图的切换按钮
                        cardView: false,                    //是否显示详细视图
                        detailView: false,                  //是否显示父子表
                        queryParams: function (params) {
                            //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                            var temp = {
                                rows: params.limit,                         //页面大小
                                page: (params.offset / params.limit) + 1,   //页码
                                name: $("#searchCarName").val(),        //查询
                                brand: $("#searchCarBrand").val()
                            };
                            return temp;
                        },
                        columns: [
                            {   field: 'id',
                                title: 'ID',
                                align:'center'
                            },{
                                field: 'imgUrl',
                                title: '照片',
                                align:'center',
                                formatter:function (value, row, index) {
                                    return '<img style="width: 100px;height: 70px;" src='+row.imgUrl+'>'
                                }
                            },  {
                                field: 'brand',
                                title: '品牌',
                                align:'center'
                            }, {
                                field: 'name',
                                title: '名称',
                                align:'center'
                            }, {
                                field: 'type',
                                title: '类型',
                                align:'center'
                            }, {
                                field: 'color',
                                title: '颜色',
                                align:'center'
                            },  {
                                field: 'time',
                                title: '出厂时间',
                                align:'center'
                            }, {
                                field: 'rent',
                                title: '租金/天',
                                align:'center'
                            },  {
                                field: 'remark',
                                title: '备注',
                                align:'center'
                            },  {
                                field: '',
                                title: '操作',
                                align:'center',
                                formatter: function (value, row, index) {
                                    var id = row.id;
                                    return '<button class="btn btn-primary"  onclick="chooseCar(' + id + ')" >租车</button>&nbsp;';
                                }
                            }]
                    });
                </script>
                <!-- 底部信息-->
                <div class="modal-footer">
                    <button class="btn btn-warning" id="btnIndexShowCarClose">取消</button>
                </div>
            </div>
        </div>
    </div>

    <div id="lunbo">
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

    <!--租车box-->
    <div>
        <div id="zc_box" style=" position: absolute;width: 245px;padding: 10px;height: 310px;margin-top: -600px;margin-left: 250px;">
            <h4 style="color: dodgerblue">租车自驾</h4>
            <form id="indexCarOutForm">
                <div class="form-group">
                    <label>城市</label>
                    <div>
                        <select id="zcCitySelect" data-bv-notempty="true"
                                data-bv-notempty-message="不能为空" class="selectpicker"></select>
                    </div>
                </div>
                <div class="form-group">
                    <label>门店</label>
                    <div>
                        <select id="zcShopSelect" name="shopId" data-bv-notempty="true"
                                data-bv-notempty-message="不能为空" class="selectpicker">
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label>提车时间</label>
                    <div >
                        <input id="zcTime" name="time" type="datetime-local" data-bv-notempty="true"
                               data-bv-notempty-message="不能为空" class="form-control"/>
                    </div>
                </div>
                <button id="chooseCar" type="button" class="btn btn-primary btn-block">立即选车</button>
            </form>
        </div>
    </div>

    </div>

    <%-- 我的订单   --%>
    <div id="my" class="container">
       <div>
           <h3>我的订单</h3>
           <div id="indexShowMyWin">
                   <div style="width: 1100px;margin-left: -200px;">
                       <%-- 数据表格 --%>
                       <div class="col-md-offset-3">
                           <table id="indexMyTable"></table>
                       </div>
                       <%-- 初始化表格数据 --%>
                       <script type="text/javascript">
                           $('#indexMyTable').bootstrapTable({
                               url: 'CarOut/fenYe.action',
                               method: 'GET',                      //请求方式（*）
                               toolbar: '#MyToolbar',            //工具按钮用哪个容器
                               striped: true,                      //是否显示行间隔色
                               cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                               pagination: true,                   //是否显示分页（*）
                               sortable: true,                     //是否启用排序
                               sortOrder: "asc",                   //排序方式
                               sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                               pageNumber: 1,                      //初始化加载第一页，默认第一页,并记录
                               pageSize: 5,                        //每页的记录行数（*）
                               pageList: [5, 10],                  //可供选择的每页的行数（*）
                               search: false,                      //是否显示表格搜索
                               strictSearch: true,                 //是否严格搜索
                               showColumns: true,                  //是否显示所有的列（选择显示的列）
                               showRefresh: true,                  //是否显示刷新按钮
                               minimumCountColumns: 2,             //最少允许的列数
                               clickToSelect: true,                //是否启用点击选中行
                               height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                               uniqueId: "id",                     //每一行的唯一标识，一般为主键列
                               showToggle: true,                   //是否显示详细视图和列表视图的切换按钮
                               cardView: false,                    //是否显示详细视图
                               detailView: false,                  //是否显示父子表
                               queryParams: function (params) {
                                   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                                   var temp = {
                                       rows: params.limit,                         //页面大小
                                       page: (params.offset / params.limit) + 1,   //页码
                                       userId: ${sessionScope.user.id}        //查询
                                   };
                                   return temp;
                               },
                               columns: [
                                   {   field: 'id',
                                       title: 'ID',
                                       align:'center'
                                   }, {
                                       field: 'carId',
                                       title: '车辆',
                                       align:'center',
                                       formatter:function (value, row, index) {
                                           return row.car.name;
                                       }
                                   }, {
                                       field: 'shopId',
                                       title: '门店',
                                       align:'center',
                                       formatter:function (value, row, index) {
                                           return row.shop.name;
                                       }
                                   }
                                   , {
                                       field: 'time',
                                       title: '时间',
                                       align: 'center'
                                   },
                                   {
                                       field: 'status',
                                       title: '状态',
                                       align: 'center',
                                       formatter: function (value, row,index) {
                                           if (row.status == 0) {
                                               return '<span style="color: blue">待审核</span>';
                                           } else if (row.status == 1) {
                                               return '<span style="color: green">已批准</span>';
                                           } else if (row.status == 2) {
                                               return '<span style="color: red">未批准</span>';
                                           }
                                       }
                                   },
                                   {
                                       field: ' ',
                                       width: 140,
                                       title: '操作',
                                       align: 'center',
                                       formatter:function (value,row,index) {
                                           var id = row.id;
                                           if (row.back==1){
                                               return '<label class="label-success">已还车</label>'
                                           }else {
                                           return '<button id="huanchebtn" class="btn btn-success"  onclick="huanche(' + id + ')" >还车</button>';
                                           }

                                       }
                                   }],
                               onLoadSuccess: function (data) {
                                   if ($("#mystatus").innerHTML=="待审核"){
                                       $("#huanchebtn").attr("disabled",true);
                                   }
                               }
                           });
                       </script>
                   </div>

            </div>
        </div>
    </div>

<script>
    $("#my").hide();
    $("#zcCitySelect").append("<option>长沙</option>");
    $("#zcCitySelect").selectpicker("refresh");
    $.ajax({
        type: 'get',
        url: 'Shop/queryAll.action',
        async: false,
        dataType: "json",
        success: function (data) {
            $("#zcShopSelect").empty();
            for (var i = 0; i < data.length; i++) {
                $("#zcShopSelect").append("<option value='" + data[i].id + "'>" + data[i].name + "</option>");
            }
            $("#zcShopSelect").selectpicker("refresh");
        }
    });

    //点击登录取消按钮
    $("#indexLoginClose").click(function () {
        //清处表单数据
        $('#indexLoginForm')[0].reset();
        //关闭模态框
        $("#indexLoginWin").modal("hide");
    });

    /*//点击登录按钮
    $("#indexLogin").click(function () {
        $("#indexLoginForm").bootstrapValidator('validate');  //提交验证
        if ($("#indexLoginForm").data('bootstrapValidator').isValid()) {  //获取验证结果
            $('#indexLoginForm').form('submit', {
                url: "user/login.action",
                success: function (data) {
                    alert(data =="true"? "登录成功" : "账号或密码错误");

                    //清除表单验证
                    $('#indexLoginForm').data("bootstrapValidator").resetForm();
                    if (data !="true"){
                        return ;
                    }
                    //清处表单数据
                    $('#indexLoginForm')[0].reset();
                    //关闭窗口
                    $("#indexLoginWin").modal("hide");
                    //
                    location.reload();
                }
            });
        }
    })*/
    window.onload=function () {
        var msg = "${errmsg}";

        if(msg!=""){
            alert(msg);
        }

    }
    //点击注册取消按钮
    $("#reindexLoginClose").click(function () {
        //清处表单数据
        $('#indexRegisterForm')[0].reset();
        //关闭模态框
        $("#indexRegisterWin").modal("hide");
    });

    //点击注册按钮
    $("#reindexLogin").click(function () {
        $("#indexRegisterForm").bootstrapValidator('validate');  //提交验证
        if ($("#indexRegisterForm").data('bootstrapValidator').isValid()) {  //获取验证结果
            $('#indexRegisterForm').form('submit', {
                url: "user/add.action",
                success: function (data) {
                    alert(data=="true" ? "注册成功" : "注册失败");
                    if (data=="true"){
                        $('#indexRegisterForm').form('submit', {
                            url: "user/login.action",
                            success: function (data) {
                                alert(data=="true" ? "已登录" : "请重新登录");
                                //清除表单验证
                                $('#indexRegisterForm').data("bootstrapValidator").resetForm();
                                //清处表单数据
                                $('#indexRegisterForm')[0].reset();
                                //关闭窗口
                                $("#indexRegisterWin").modal("hide");
                                location.reload();
                            }
                        });
                    }
                    //清除表单验证
                    $('#indexRegisterForm').data("bootstrapValidator").resetForm();
                    //清处表单数据
                    $('#indexRegisterForm')[0].reset();
                    //关闭窗口
                    $("#indexRegisterWin").modal("hide");
                }
            });
        }
    })

    //点击立即租车
    $("#chooseCar").click(function () {
        if("${sessionScope.user.id}"==""){
            alert("请先登录");
            return ;
        }
        if($("#zcTime").val()==""){
            alert("请选择时间");
            return ;
        }
        $("#indexShowCarWin").modal("show");
    })

    //点击注销注销
    function exitLogin() {
            $.post("user/exit.action", function (data) {
                alert(data ? "注销成功" : "注销失败");
                location.reload();
            }, 'json');
    }

    //选车
    function chooseCar(id) {
        $.post("CarOut/add.action",
            {"carId":id,"userId":"${sessionScope.user.id}","shopId":$("#zcShopSelect").val(),"time":$("#zcTime").val()},
            function (data) {
            alert(data ? "租车成功" : "租车失败");
            location.reload();
        }, 'json');
    }

    //编辑页面 点击取消按钮
    $("#btnIndexShowCarClose").click(function () {
        $("#indexShowCarWin").modal("hide");
    });

    //点击管理员
    function adminLogin(){
        location.href="admin.jsp";
    }

    //主页
    function showMain() {
        $("#lunbo").show();
        $("#my").hide();
    }
    //我的
    function showMy() {
        if (${sessionScope.user.id==null}){
            alert("请先登录");
            return ;
        }
        $("#lunbo").hide();
        $("#my").show();
    }
    //还车
    function huanche(id) {
        let myDate = new Date();
        let time=myDate.toLocaleString( );//获取日期与时间
        var time1=time.replace('下午','')+"";
        alert(time1);
        $.post("CarInto/add.action",{"CarOutId":id,"time":time1},function (data) {
            alert(data?"还车成功":"还车失败");
            if ($("#huanchebtn").innerHTML=="待审核"){
                $("#huanchebtn").attr("disabled",true);
            }
            $("#indexMyTable").bootstrapTable("refresh");
            $("#huanchebtn").innerHTML="待审核";
        },'json');
    }
</script>

</body>
</html>