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
    <div id="CarShopToolbar">
        <form class="form-inline">
            <div class="input-group">
                <span class="input-group-addon">车名</span>
                <select  id="searchCarShopCarSelect"  class="selectpicker" ></select>
                <span class="input-group-addon">门店</span>
                <select id="searchCarShopShopSelect"  class="selectpicker" ></select>
                <div class="input-group-btn">
                    <input type="button" class="btn btn-success" id="btnSearchCarShop" value="查询">
                </div>
            </div>
            <input style="width: 100px" class="btn btn-primary" readonly data-toggle="modal"
                   data-target="#addCarShopWin" value="添加"/>
        </form>
    </div>

    <%-- 数据表格 --%>
    <div>
        <table id="CarShopTable"></table>
    </div>

    <%-- 添加模态框 --%>
    <div id="addCarShopWin" class="modal" data-backdrop="static">
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
                    <form id="addCarShopForm">
                        <div class="form-group">
                            <label>车辆</label>
                            <div>
                                <select id="addCarShopCarSelect"  name="carId"  data-bv-notempty="true" data-bv-notempty-message="用户不能为空" class="selectpicker" ></select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>店铺</label>
                            <div>
                                <select id="addCarShopShopSelect" name="shopId" data-bv-notempty="true" data-bv-notempty-message="角色不能为空" class="selectpicker"></select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>数量</label>
                            <div>
                                <input name="count" type="number" data-bv-notempty="true" data-bv-notempty-message="数量不能为空" class="form-control" />
                            </div>
                        </div>
                    </form>
                </div>
                <!-- 底部信息-->
                <div class="modal-footer">
                    <button id="btnAddCarShop" class="btn btn-primary">添加</button>
                    <button id="btnAddCarShopClose" class="btn btn-warning">取消</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 编辑模态框 --%>
    <div id="editCarShopWin" class="modal" data-backdrop="static">
        <!-- 对话框容器div-->
        <div class="modal-dialog">
            <!--内容容器 -->
            <div class="modal-content">
                <!-- 头部标题-->
                <div class="modal-title text-center">
                    <h4>编辑</h4></div>
                <!-- 主体内容-->
                <div class="modal-body">
                    <form id="editCarShopForm" class="form-horizontal text-center">
                        <div class="form-group">
                            <label class="col-md-2">ID</label>
                            <div class="col-md-4">
                                <input  name="id" readonly  type="text"  class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2">车辆</label>
                            <div class="col-md-4">
                                <select id="updateCarShopCarSelect"  name="carId"  data-bv-notempty="true" data-bv-notempty-message="用户不能为空" class="selectpicker" ></select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2">店铺</label>
                            <div class="col-md-4">
                                <select id="updateCarShopShopSelect" name="shopId" data-bv-notempty="true" data-bv-notempty-message="角色不能为空" class="selectpicker" ></select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2">数量</label>
                            <div class="col-md-5">
                                <input name="count" type="number" data-bv-notempty="true" data-bv-notempty-message="数量不能为空" class="form-control" />
                            </div>
                        </div>
                    </form>
                </div>
                <!-- 底部信息-->
                <div class="modal-footer">
                    <button class="btn btn-primary" id="btnEditCarShop">保存</button>
                    <button class="btn btn-warning" id="btnEditCarShopClose">取消</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 初始化表格数据 --%>
    <script type="text/javascript">
    $('#CarShopTable').bootstrapTable({
        url: 'CarShop/fenYe.action',
        method: 'GET',                      //请求方式（*）
        toolbar: '#CarShopToolbar',            //工具按钮用哪个容器
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
                page: (params.offset / params.limit) + 1 ,  //页码
                carId:$("#searchCarShopCarSelect").val(),
                shopId:$("#searchCarShopShopSelect").val()
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
            },{
                field: 'count',
                title: '数量',
                align: 'center'
            }, {
                field: '',
                width: 140,
                title: '操作',
                align:'center',
                formatter: function (value, row, index) {
                    var id = row.id;
                    return '<button class="btn btn-success"  onclick="editCarShop(' + id + ')" >编辑</button>&nbsp;' +
                        '<button class="btn btn-danger"   onclick="deleteCarShop(' + id + ')" >删除</button>';
                }
            }]
    });
    </script>

    <%-- 事件 --%>
    <script type="text/javascript">
        $.ajax({
            type: 'get',
            url: 'Car/queryAll.action',
            async:false,
            dataType: "json",
            success: function (data) {
                $("#addCarShopCarSelect").empty();
                for(var i=0;i<data.length;i++){

                    $("#addCarShopCarSelect").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                }
                $("#addCarShopCarSelect").selectpicker("refresh");
            }
        });
        $.ajax({
            type: 'get',
            url: 'Shop/queryAll.action',
            async:false,
            dataType: "json",
            success: function (data) {
                $("#addCarShopShopSelect").empty();
                for(var i=0;i<data.length;i++){
                    $("#addCarShopShopSelect").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                }
                $("#addCarShopShopSelect").selectpicker("refresh");
            }
        });
            $.ajax({
                type: 'get',
                url: 'Car/queryAll.action',
                async:false,
                dataType: "json",
                success: function (data) {
                    $("#updateCarShopCarSelect").empty();
                    for(var i=0;i<data.length;i++){

                        $("#updateCarShopCarSelect").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                    }
                    $("#updateCarShopCarSelect").selectpicker("refresh");
                }
            });
            $.ajax({
                type: 'get',
                url: 'Shop/queryAll.action',
                async:false,
                dataType: "json",
                success: function (data) {
                    $("#updateCarShopShopSelect").empty();
                    for(var i=0;i<data.length;i++){
                        $("#updateCarShopShopSelect").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                    }
                    $("#updateCarShopShopSelect").selectpicker("refresh");
                }
            });
        $.ajax({
            type: 'get',
            url: 'Car/queryAll.action',
            async:false,
            dataType: "json",
            success: function (data) {
                $("#searchCarShopCarSelect").empty();
                $("#searchCarShopCarSelect").append("<option value='-1'>请选择</option>");
                for(var i=0;i<data.length;i++){

                    $("#searchCarShopCarSelect").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                }
                $("#searchCarShopCarSelect").selectpicker("refresh");
            }
        });
        $.ajax({
            type: 'get',
            url: 'Shop/queryAll.action',
            async:false,
            dataType: "json",
            success: function (data) {
                $("#searchCarShopShopSelect").empty();
                $("#searchCarShopShopSelect").append("<option value='-1'>请选择</option>");
                for(var i=0;i<data.length;i++){
                    $("#searchCarShopShopSelect").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                }
                $("#searchCarShopShopSelect").selectpicker("refresh");
            }
        });
        //查询条件
        $("#btnSearchCarShop").click(function () {
            $('#CarShopTable').bootstrapTable("refresh");
        })

        //添加页面表单验证
        $('#addCarShopForm').bootstrapValidator({
            // 表单框里右侧的icon
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            }
        });

        //添加页面 点击保存按钮
        $("#btnAddCarShop").click(function () {
            $("#addCarShopForm").bootstrapValidator('validate');  //提交验证
            if ($("#addCarShopForm").data('bootstrapValidator').isValid()) {  //获取验证结果
                $('#addCarShopForm').form('submit', {
                    url:"CarShop/add.action",
                    success:function(data){
                        alert(data?"添加成功":"添加失败");
                        //清除表单验证
                        $('#addCarShopForm').data("bootstrapValidator").resetForm();
                        //清除表单数据
                        $('#addCarShopForm')[0].reset();
                        //刷新后台表格数据
                        $("#CarShopTable").bootstrapTable("refresh");
                        //关闭窗口
                        $("#addCarShopWin").modal("hide");
                    }
                });
            }
        });

        //添加页面 点击取消按钮
        $("#btnAddCarShopClose").click(function () {
            //清除表单验证
            $('#addCarShopForm').data("bootstrapValidator").resetForm();
            //清处表单数据
            $('#addCarShopForm')[0].reset();
            //关闭模态框
            $("#addCarShopWin").modal("hide");
        });

        //编辑页面表单验证
        $('#editCarShopForm').bootstrapValidator({
            // 表单框里右侧的icon
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            }
        });

        //编辑页面 点击保存按钮
        $("#btnEditCarShop").click(function () {
            $("#editCarShopForm").bootstrapValidator('validate');  //提交验证
            if ($("#editCarShopForm").data('bootstrapValidator').isValid()) {  //获取验证结果
                $('#editCarShopForm').form('submit', {
                    url: "CarShop/update.action",
                    success: function (data) {
                        alert(data ? "修改成功" : "修改失败");
                        //清除表单验证
                        $('#editCarShopForm').data("bootstrapValidator").resetForm();
                        //刷新后台表格数据
                        $("#CarShopTable").bootstrapTable("refresh");
                        //关闭窗口
                        $("#editCarShopWin").modal("hide");
                    }
                });
            }
        })

        //编辑页面 点击取消按钮
        $("#btnEditCarShopClose").click(function () {
            //清除表单验证
            $('#editCarShopForm').data("bootstrapValidator").resetForm();
            $("#editCarShopWin").modal("hide");
        });

        //点击编辑按钮
        function editCarShop(id) {


            $("#editCarShopForm").form('load',"CarShop/queryById.action?id="+id);

            $("#editCarShopWin").modal("show");
        }

        //点击删除按钮
        function  deleteCarShop(id) {
            $.post("CarShop/delete.action",{"id":id},function (data) {
                //刷新后台表格数据
                $("#CarShopTable").bootstrapTable("refresh");
                alert(data?"删除成功":"删除失败");
            },'json');
        }

    </script>
</body>
</html>
