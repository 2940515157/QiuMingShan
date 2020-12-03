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
    <div id="CarOutToolbar">
        <form class="form-inline">
            <input style="width: 100px" class="btn btn-primary" readonly data-toggle="modal"
                   data-target="#addCarOutWin" value="添加"/>
        </form>
    </div>

    <%-- 数据表格 --%>
    <div>
        <table id="CarOutTable"></table>
    </div>

    <%-- 添加模态框 --%>
    <div id="addCarOutWin" class="modal" data-backdrop="static">
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
                    <form id="addCarOutForm">
                        <div class="form-group">
                            <label>车辆</label>
                            <div>
                                <select id="addCarOutCarSelect"  name="carId"  data-bv-notempty="true" data-bv-notempty-message="不能为空" class="selectpicker" ></select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>门店</label>
                            <div>
                                <select id="addCarOutShopSelect" name="shopId" data-bv-notempty="true" data-bv-notempty-message="不能为空" class="selectpicker"></select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>用户</label>
                            <div>
                                <select id="addCarOutUserSelect" name="userId" data-bv-notempty="true" data-bv-notempty-message="不能为空" class="selectpicker"></select>
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
                    <button id="btnAddCarOut" class="btn btn-primary">添加</button>
                    <button id="btnAddCarOutClose" class="btn btn-warning">取消</button>
                </div>
            </div>
        </div>
    </div>


    <%-- 初始化表格数据 --%>
    <script type="text/javascript">
    $('#CarOutTable').bootstrapTable({
        url: 'CarOut/fenYe2.action',
        method: 'GET',                      //请求方式（*）
        toolbar: '#CarOutToolbar',            //工具按钮用哪个容器
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
                field: ' ',
                width: 140,
                title: '审核',
                align: 'center',
                formatter:function (value,row,index) {
                    var id = row.id;
                    return '<button class="btn btn-success"  onclick="trueCarOut(' + id + ')" >批准</button>&nbsp;' +
                        '<button class="btn btn-danger"   onclick="falseCarOut(' + id + ')" >不批</button>';
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
                $("#addCarOutCarSelect").empty();
                for(var i=0;i<data.length;i++){

                    $("#addCarOutCarSelect").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                }
                $("#addCarOutCarSelect").selectpicker("refresh");
            }
        });
        $.ajax({
            type: 'get',
            url: 'Shop/queryAll.action',
            async:false,
            dataType: "json",
            success: function (data) {
                $("#addCarOutShopSelect").empty();
                for(var i=0;i<data.length;i++){
                    $("#addCarOutShopSelect").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                }
                $("#addCarOutShopSelect").selectpicker("refresh");
            }
        });
        $.ajax({
            type: 'get',
            url: 'user/queryAll.action',
            async:false,
            dataType: "json",
            success: function (data) {
                $("#addCarOutUserSelect").empty();
                for(var i=0;i<data.length;i++){
                    $("#addCarOutUserSelect").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                }
                $("#addCarOutUserSelect").selectpicker("refresh");
            }
        });
       /* $.ajax({
            type: 'get',
            url: 'Car/queryAll.action',
            async:false,
            dataType: "json",
            success: function (data) {
                $("#updateCarOutCarSelect").empty();
                for(var i=0;i<data.length;i++){

                    $("#updateCarOutCarSelect").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                }
                $("#updateCarOutCarSelect").selectpicker("refresh");
            }
        });
        $.ajax({
            type: 'get',
            url: 'Shop/queryAll.action',
            async:false,
            dataType: "json",
            success: function (data) {
                $("#updateCarOutShopSelect").empty();
                for(var i=0;i<data.length;i++){
                    $("#updateCarOutShopSelect").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                }
                $("#updateCarOutShopSelect").selectpicker("refresh");
            }
        });
        $.ajax({
            type: 'get',
            url: 'user/queryAll.action',
            async:false,
            dataType: "json",
            success: function (data) {
                $("#updateCarOutUserSelect").empty();
                for(var i=0;i<data.length;i++){
                    $("#updateCarOutUserSelect").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                }
                $("#updateCarOutUserSelect").selectpicker("refresh");
            }
        });*/

        //查询条件
        $("#btnSearchCarOut").click(function () {
            $('#CarOutTable').bootstrapTable("refresh");
        })

        //添加页面表单验证
        $('#addCarOutForm').bootstrapValidator({
            // 表单框里右侧的icon
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            }
        });

        //添加页面 点击保存按钮
        $("#btnAddCarOut").click(function () {
            $("#addCarOutForm").bootstrapValidator('validate');  //提交验证
            if ($("#addCarOutForm").data('bootstrapValidator').isValid()) {  //获取验证结果
                $('#addCarOutForm').form('submit', {
                    url:"CarOut/add.action",
                    success:function(data){
                        alert(data?"添加成功":"添加失败");
                        //清除表单验证
                        $('#addCarOutForm').data("bootstrapValidator").resetForm();
                        //清除表单数据
                        $('#addCarOutForm')[0].reset();
                        //刷新后台表格数据
                        $("#CarOutTable").bootstrapTable("refresh");
                        //关闭窗口
                        $("#addCarOutWin").modal("hide");
                    }
                });
            }
        });

        //添加页面 点击取消按钮
        $("#btnAddCarOutClose").click(function () {
            //清除表单验证
            $('#addCarOutForm').data("bootstrapValidator").resetForm();
            //清处表单数据
            $('#addCarOutForm')[0].reset();
            //关闭模态框
            $("#addCarOutWin").modal("hide");
        });

       /* //编辑页面表单验证
        $('#editCarOutForm').bootstrapValidator({
            // 表单框里右侧的icon
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            }
        });

        //编辑页面 点击保存按钮
        $("#btnEditCarOut").click(function () {
            $("#editCarOutForm").bootstrapValidator('validate');  //提交验证
            if ($("#editCarOutForm").data('bootstrapValidator').isValid()) {  //获取验证结果
                $('#editCarOutForm').form('submit', {
                    url: "CarOut/update.action",
                    success: function (data) {
                        alert(data ? "修改成功" : "修改失败");
                        //清除表单验证
                        $('#editCarOutForm').data("bootstrapValidator").resetForm();
                        //刷新后台表格数据
                        $("#CarOutTable").bootstrapTable("refresh");
                        //关闭窗口
                        $("#editCarOutWin").modal("hide");
                    }
                });
            }
        })

        //编辑页面 点击取消按钮
        $("#btnEditCarOutClose").click(function () {
            //清除表单验证
            $('#editCarOutForm').data("bootstrapValidator").resetForm();
            $("#editCarOutWin").modal("hide");
        });

        //点击编辑按钮
        function editCarOut(id) {


            $("#editCarOutForm").form('load',"CarOut/queryById.action?id="+id);

            $("#editCarOutWin").modal("show");
        }

        //点击删除按钮
        function  deleteCarOut(id) {
            $.post("CarOut/delete.action",{"id":id},function (data) {
                //刷新后台表格数据
                $("#CarOutTable").bootstrapTable("refresh");
                alert(data?"删除成功":"删除失败");
            },'json');
        }*/
        function  trueCarOut(id) {
            $.post("CarOut/pz.action", {"id": id}, function (data) {
                //刷新后台表格数据
                $("#CarOutTable").bootstrapTable("refresh");
                alert(data ? "操作成功" : "操作失败");
            }, 'json');
        }
        function  falseCarOut(id) {
            $.post("CarOut/bpz.action", {"id": id}, function (data) {
                //刷新后台表格数据
                $("#CarOutTable").bootstrapTable("refresh");
                alert(data ? "操作成功" : "操作失败");
            }, 'json');
        }
    </script>
</body>
</html>
