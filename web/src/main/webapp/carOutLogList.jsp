<%--
  Created by IntelliJ IDEA.
  User: weikang
  Date: 2020/10/11
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
    <%-- 工具栏 --%>
    <div id="CarOutLogToolbar">
        <form class="form-inline">
            <input style="width: 100px" class="btn btn-primary" readonly data-toggle="modal"
                   data-target="#addCarOutLogWin" value="添加"/>
        </form>
    </div>

    <%-- 数据表格 --%>
    <div>
        <table id="CarOutLogTable"></table>
    </div>

    <%-- 添加模态框 --%>
    <div id="addCarOutLogWin" class="modal" data-backdrop="static">
        <!-- 对话框容器div-->
        <div class="modal-dialog">
            <!--内容容器 -->
            <div class="modal-content">
                <!-- 头部标题-->
                <div class="modal-title text-center">
                    <h4>添加</h4>
                </div>
                <!-- 主体内容-->
                <div class="modal-body">
                    <form id="addCarOutLogForm">
                        <div class="form-group">
                            <label>车辆</label>
                            <div>
                                <select id="addCarOutLogCarSelect"  name="carId"  data-bv-notempty="true" data-bv-notempty-message="不能为空" class="selectpicker" ></select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>门店</label>
                            <div>
                                <select id="addCarOutLogShopSelect" name="shopId" data-bv-notempty="true" data-bv-notempty-message="不能为空" class="selectpicker"></select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>用户</label>
                            <div>
                                <select id="addCarOutLogUserSelect" name="userId" data-bv-notempty="true" data-bv-notempty-message="不能为空" class="selectpicker"></select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>时间</label>
                            <div>
                                <input name="time" type="datetime-local" data-bv-notempty="true" data-bv-notempty-message="不能为空" class="form-control" />
                            </div>
                        </div>
                    </form>
                </div>
                <!-- 底部信息-->
                <div class="modal-footer">
                    <button id="btnAddCarOutLog" class="btn btn-primary">添加</button>
                    <button id="btnAddCarOutLogClose" class="btn btn-warning">取消</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 编辑模态框 --%>
    <div id="editCarOutLogWin" class="modal" data-backdrop="static">
        <!-- 对话框容器div-->
        <div class="modal-dialog">
            <!--内容容器 -->
            <div class="modal-content">
                <!-- 头部标题-->
                <div class="modal-title text-center">
                    <h4>编辑</h4></div>
                <!-- 主体内容-->
                <div class="modal-body">
                    <form id="editCarOutLogForm" class="form-horizontal text-center">
                        <div class="form-group">
                            <label class="col-md-2">ID</label>
                            <div class="col-md-4">
                                <input  name="id" readonly  type="text"  class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2">车辆</label>
                            <div class="col-md-4">
                                <select id="updateCarOutLogCarSelect"  name="carId"  data-bv-notempty="true" data-bv-notempty-message="不能为空" class="selectpicker" ></select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2">门店</label>
                            <div class="col-md-4">
                                <select id="updateCarOutLogShopSelect" name="shopId" data-bv-notempty="true" data-bv-notempty-message="不能为空" class="selectpicker" ></select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2">用户</label>
                            <div class="col-md-4">
                                <select id="updateCarOutLogUserSelect" name="userId" data-bv-notempty="true" data-bv-notempty-message="不能为空" class="selectpicker" ></select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2">时间</label>
                            <div class="col-md-5">
                                <input name="time" type="text" data-bv-notempty="true" data-bv-notempty-message="不能为空" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2">状态</label>
                            <div class="col-md-4">
                                <select id="updateCarOutLogStatusSelect"  name="status" data-bv-notempty="true" data-bv-notempty-message="不能为空" class="selection-handle">
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- 底部信息-->
                <div class="modal-footer">
                    <button class="btn btn-primary" id="btnEditCarOutLog">保存</button>
                    <button class="btn btn-warning" id="btnEditCarOutLogClose">取消</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 初始化表格数据 --%>
    <script type="text/javascript">
    $('#CarOutLogTable').bootstrapTable({
        url: 'CarOut/fenYe.action',
        method: 'GET',                      //请求方式（*）
        toolbar: '#CarOutLogToolbar',            //工具按钮用哪个容器
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
        height: 600,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
        uniqueId: "id",                     //每一行的唯一标识，一般为主键列
        showToggle: true,                   //是否显示详细视图和列表视图的切换按钮
        cardView: false,                    //是否显示详细视图
        detailView: false,                  //是否显示父子表
        queryParams: function (params) {
            //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            var temp = {
                rows: params.limit,                         //页面大小
                page: (params.offset / params.limit) + 1   //页码
            };
            return temp;
        },
        columns: [
            {   field: 'id',
                title: 'ID',
                align:'center'
            },{
                field: 'userId',
                title: '用户',
                align:'center',
                formatter:function (value, row, index) {
                    return row.user.name;
                }
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
                    return '<button class="btn btn-success"  onclick="editCarOutLog(' + id + ')" >编辑</button>&nbsp;' +
                        '<button class="btn btn-danger"   onclick="deleteCarOutLog(' + id + ')" >删除</button>';
                }
            }]
    });
    </script>

    <%-- 事件 --%>
    <script type="text/javascript">
        $("#updateCarOutLogStatusSelect").empty();
        $("#updateCarOutLogStatusSelect").append("<option value='0'>未审核</option>");
        $("#updateCarOutLogStatusSelect").append("<option value='1'>已批准</option>");
        $("#updateCarOutLogStatusSelect").append("<option value='2'>未批准</option>");
        $("#updateCarOutLogStatusSelect").selectpicker("refresh");

        $.ajax({
            type: 'get',
            url: 'Car/queryAll.action',
            async:false,
            dataType: "json",
            success: function (data) {
                $("#addCarOutLogCarSelect").empty();
                for(var i=0;i<data.length;i++){

                    $("#addCarOutLogCarSelect").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                }
                $("#addCarOutLogCarSelect").selectpicker("refresh");
            }
        });
        $.ajax({
            type: 'get',
            url: 'Shop/queryAll.action',
            async:false,
            dataType: "json",
            success: function (data) {
                $("#addCarOutLogShopSelect").empty();
                for(var i=0;i<data.length;i++){
                    $("#addCarOutLogShopSelect").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                }
                $("#addCarOutLogShopSelect").selectpicker("refresh");
            }
        });
        $.ajax({
            type: 'get',
            url: 'user/queryAll.action',
            async:false,
            dataType: "json",
            success: function (data) {
                $("#addCarOutLogUserSelect").empty();
                for(var i=0;i<data.length;i++){
                    $("#addCarOutLogUserSelect").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                }
                $("#addCarOutLogUserSelect").selectpicker("refresh");
            }
        });
        $.ajax({
            type: 'get',
            url: 'Car/queryAll.action',
            async:false,
            dataType: "json",
            success: function (data) {
                $("#updateCarOutLogCarSelect").empty();
                for(var i=0;i<data.length;i++){

                    $("#updateCarOutLogCarSelect").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                }
                $("#updateCarOutLogCarSelect").selectpicker("refresh");
            }
        });
        $.ajax({
            type: 'get',
            url: 'Shop/queryAll.action',
            async:false,
            dataType: "json",
            success: function (data) {
                $("#updateCarOutLogShopSelect").empty();
                for(var i=0;i<data.length;i++){
                    $("#updateCarOutLogShopSelect").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                }
                $("#updateCarOutLogShopSelect").selectpicker("refresh");
            }
        });
        $.ajax({
            type: 'get',
            url: 'user/queryAll.action',
            async:false,
            dataType: "json",
            success: function (data) {
                $("#updateCarOutLogUserSelect").empty();
                for(var i=0;i<data.length;i++){
                    $("#updateCarOutLogUserSelect").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                }
                $("#updateCarOutLogUserSelect").selectpicker("refresh");
            }
        });

        //查询条件
        $("#btnSearchCarOutLog").click(function () {
            $('#CarOutLogLogTable').bootstrapTable("refresh");
        })

        //添加页面表单验证
        $('#addCarOutLogForm').bootstrapValidator({
            // 表单框里右侧的icon
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            }
        });

        //添加页面 点击保存按钮
        $("#btnAddCarOutLog").click(function () {
            $("#addCarOutLogForm").bootstrapValidator('validate');  //提交验证
            if ($("#addCarOutLogForm").data('bootstrapValidator').isValid()) {  //获取验证结果
                $('#addCarOutLogForm').form('submit', {
                    url:"CarOut/add.action",
                    success:function(data){
                        alert(data?"添加成功":"添加失败");
                        //清除表单验证
                        $('#addCarOutLogForm').data("bootstrapValidator").resetForm();
                        //清除表单数据
                        $('#addCarOutLogForm')[0].reset();
                        //刷新后台表格数据
                        $("#CarOutLogTable").bootstrapTable("refresh");
                        //关闭窗口
                        $("#addCarOutLogWin").modal("hide");
                    }
                });
            }
        });

        //添加页面 点击取消按钮
        $("#btnAddCarOutLogClose").click(function () {
            //清除表单验证
            $('#addCarOutLogForm').data("bootstrapValidator").resetForm();
            //清处表单数据
            $('#addCarOutLogForm')[0].reset();
            //关闭模态框
            $("#addCarOutLogWin").modal("hide");
        });

        //编辑页面表单验证
        $('#editCarOutLogForm').bootstrapValidator({
            // 表单框里右侧的icon
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            }
        });

        //编辑页面 点击保存按钮
        $("#btnEditCarOutLog").click(function () {
            $("#editCarOutLogForm").bootstrapValidator('validate');  //提交验证
            if ($("#editCarOutLogForm").data('bootstrapValidator').isValid()) {  //获取验证结果
                $('#editCarOutLogForm').form('submit', {
                    url: "CarOut/update.action",
                    success: function (data) {
                        alert(data ? "修改成功" : "修改失败");
                        //清除表单验证
                        $('#editCarOutLogForm').data("bootstrapValidator").resetForm();
                        //刷新后台表格数据
                        $("#CarOutLogTable").bootstrapTable("refresh");
                        //关闭窗口
                        $("#editCarOutLogWin").modal("hide");
                    }
                });
            }
        })

        //编辑页面 点击取消按钮
        $("#btnEditCarOutLogClose").click(function () {
            //清除表单验证
            $('#editCarOutLogForm').data("bootstrapValidator").resetForm();
            $("#editCarOutLogWin").modal("hide");
        });

        //点击编辑按钮
        function editCarOutLog(id) {


            $("#editCarOutLogForm").form('load',"CarOut/queryById.action?id="+id);

            $("#editCarOutLogWin").modal("show");
        }

        //点击删除按钮
        function  deleteCarOutLog(id) {
            $.post("CarOut/delete.action",{"id":id},function (data) {
                //刷新后台表格数据
                $("#CarOutLogTable").bootstrapTable("refresh");
                alert(data?"删除成功":"删除失败");
            },'json');
        }
    </script>
</body>
</html>
