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
    <div id="CarIntoLogToolbar">
        <form class="form-inline">
            <input style="width: 100px" class="btn btn-primary" readonly data-toggle="modal"
                   data-target="#addCarIntoLogWin" value="添加"/>
        </form>
    </div>

    <%-- 数据表格 --%>
    <div>
        <table id="CarIntoLogTable"></table>
    </div>

    <%-- 添加模态框 --%>
    <div id="addCarIntoLogWin" class="modal" data-backdrop="static">
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
                    <form id="addCarIntoLogForm">
                        <div class="form-group">
                            <label>用户 车辆</label>
                            <div>
                                <select id="addCarIntoLogCarSelect"  name="carId"  data-bv-notempty="true" data-bv-notempty-message="不能为空" class="selectpicker" ></select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>时间</label>
                            <div>
                                <input name="time" type="datetime-local" data-bv-notempty="true" data-bv-notempty-message="不能为空" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2">状态</label>
                            <div class="col-md-4">
                                <select id="addCarIntoLogStatusSelect"  name="status" data-bv-notempty="true" data-bv-notempty-message="不能为空" class="selection-handle">
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- 底部信息-->
                <div class="modal-footer">
                    <button id="btnAddCarIntoLog" class="btn btn-primary">添加</button>
                    <button id="btnAddCarIntoLogClose" class="btn btn-warning">取消</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 编辑模态框 --%>
    <div id="editCarIntoLogWin" class="modal" data-backdrop="static">
        <!-- 对话框容器div-->
        <div class="modal-dialog">
            <!--内容容器 -->
            <div class="modal-content">
                <!-- 头部标题-->
                <div class="modal-title text-center">
                    <h4>编辑</h4></div>
                <!-- 主体内容-->
                <div class="modal-body">
                    <form id="editCarIntoLogForm" class="form-horizontal text-center">
                        <div class="form-group">
                            <label class="col-md-2">ID</label>
                            <div class="col-md-4">
                                <input  name="id" readonly  type="text"  class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2">用户 车辆</label>
                            <div class="col-md-4">
                                <select id="updateCarIntoLogCarSelect"  name="carOutId"  data-bv-notempty="true" data-bv-notempty-message="不能为空" class="selectpicker" ></select>
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
                                <select id="updateCarIntoLogStatusSelect"  name="status" data-bv-notempty="true" data-bv-notempty-message="不能为空" class="selection-handle">
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- 底部信息-->
                <div class="modal-footer">
                    <button class="btn btn-primary" id="btnEditCarIntoLog">保存</button>
                    <button class="btn btn-warning" id="btnEditCarIntoLogClose">取消</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 初始化表格数据 --%>
    <script type="text/javascript">
    $('#CarIntoLogTable').bootstrapTable({
        url: 'CarInto/fenYe.action',
        method: 'GET',                      //请求方式（*）
        toolbar: '#CarIntoLogToolbar',            //工具按钮用哪个容器
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
                    return row.carOut.user.name;
                }
            }, {
                field: 'carId',
                title: '车辆',
                align:'center',
                formatter:function (value, row, index) {
                    return row.carOut.car.name;
                }
            }, {
                field: 'shopId',
                title: '门店',
                align:'center',
                formatter:function (value, row, index) {
                    return row.carOut.shop.name;
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
                    return '<button class="btn btn-success"  onclick="editCarIntoLog(' + id + ')" >编辑</button>&nbsp;' +
                        '<button class="btn btn-danger"   onclick="deleteCarIntoLog(' + id + ')" >删除</button>';
                }
            }]
    });
    </script>

    <%-- 事件 --%>
    <script type="text/javascript">
        $("#addCarIntoLogStatusSelect").empty();
        $("#addCarIntoLogStatusSelect").append("<option value='0'>未审核</option>");
        $("#addCarIntoLogStatusSelect").append("<option value='1'>已批准</option>");
        $("#addCarIntoLogStatusSelect").append("<option value='2'>未批准</option>");
        $("#addCarIntoLogStatusSelect").selectpicker("refresh");

        $("#updateCarIntoLogStatusSelect").empty();
        $("#updateCarIntoLogStatusSelect").append("<option value='0'>未审核</option>");
        $("#updateCarIntoLogStatusSelect").append("<option value='1'>已批准</option>");
        $("#updateCarIntoLogStatusSelect").append("<option value='2'>未批准</option>");
        $("#updateCarIntoLogStatusSelect").selectpicker("refresh");

        $.ajax({
            type: 'get',
            url: 'CarOut/queryAll.action',
            async:false,
            dataType: "json",
            success: function (data) {
                $("#addCarIntoLogCarSelect").empty();
                for(var i=0;i<data.length;i++){

                    $("#addCarIntoLogCarSelect").append("<option value='"+data[i].id+"'>"+data[i].user.name+'   '+data[i].car.name+"</option>");
                }
                $("#addCarIntoLogCarSelect").selectpicker("refresh");
            }
        });
        $.ajax({
            type: 'get',
            url: 'CarOut/queryAll.action',
            async:false,
            dataType: "json",
            success: function (data) {
                $("#updateCarIntoLogCarSelect").empty();
                for(var i=0;i<data.length;i++){
                    $("#updateCarIntoLogCarSelect").append("<option value='"+data[i].id+"'>"+data[i].user.name+'   '+data[i].car.name+"</option>");
                }
                $("#updateCarIntoLogCarSelect").selectpicker("refresh");
            }
        });
        //添加页面表单验证
        $('#addCarIntoLogForm').bootstrapValidator({
            // 表单框里右侧的icon
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            }
        });

        //添加页面 点击保存按钮
        $("#btnAddCarIntoLog").click(function () {
            $("#addCarIntoLogForm").bootstrapValidator('validate');  //提交验证
            if ($("#addCarIntoLogForm").data('bootstrapValidator').isValid()) {  //获取验证结果
                $('#addCarIntoLogForm').form('submit', {
                    url:"CarInto/add.action",
                    success:function(data){
                        alert(data?"添加成功":"添加失败");
                        //清除表单验证
                        $('#addCarIntoLogForm').data("bootstrapValidator").resetForm();
                        //清除表单数据
                        $('#addCarIntoLogForm')[0].reset();
                        //刷新后台表格数据
                        $("#CarIntoLogTable").bootstrapTable("refresh");
                        //关闭窗口
                        $("#addCarIntoLogWin").modal("hide");
                    }
                });
            }
        });

        //添加页面 点击取消按钮
        $("#btnAddCarIntoLogClose").click(function () {
            //清除表单验证
            $('#addCarIntoLogForm').data("bootstrapValidator").resetForm();
            //清处表单数据
            $('#addCarIntoLogForm')[0].reset();
            //关闭模态框
            $("#addCarIntoLogWin").modal("hide");
        });

        //编辑页面表单验证
        $('#editCarIntoLogForm').bootstrapValidator({
            // 表单框里右侧的icon
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            }
        });

        //编辑页面 点击保存按钮
        $("#btnEditCarIntoLog").click(function () {
            $("#editCarIntoLogForm").bootstrapValidator('validate');  //提交验证
            if ($("#editCarIntoLogForm").data('bootstrapValidator').isValid()) {  //获取验证结果
                $('#editCarIntoLogForm').form('submit', {
                    url: "CarInto/update.action",
                    success: function (data) {
                        alert(data ? "修改成功" : "修改失败");
                        //清除表单验证
                        $('#editCarIntoLogForm').data("bootstrapValidator").resetForm();
                        //刷新后台表格数据
                        $("#CarIntoLogTable").bootstrapTable("refresh");
                        //关闭窗口
                        $("#editCarIntoLogWin").modal("hide");
                    }
                });
            }
        })

        //编辑页面 点击取消按钮
        $("#btnEditCarIntoLogClose").click(function () {
            //清除表单验证
            $('#editCarIntoLogForm').data("bootstrapValidator").resetForm();
            $("#editCarIntoLogWin").modal("hide");
        });

        //点击编辑按钮
        function editCarIntoLog(id) {


            $("#editCarIntoLogForm").form('load',"CarInto/queryById.action?id="+id);

            $("#editCarIntoLogWin").modal("show");
        }

        //点击删除按钮
        function  deleteCarIntoLog(id) {
            $.post("CarInto/delete.action",{"id":id},function (data) {
                //刷新后台表格数据
                $("#CarIntoLogTable").bootstrapTable("refresh");
                alert(data?"删除成功":"删除失败");
            },'json');
        }
    </script>
</body>
</html>
