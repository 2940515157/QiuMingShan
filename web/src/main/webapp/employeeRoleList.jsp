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
    <title>管理</title>
</head>
<body>
    <%-- 工具栏 --%>
    <div id="employeeRoleToolbar">
        <form class="form-inline">
            <input style="width: 100px" class="btn btn-primary" readonly data-toggle="modal"
                   data-target="#addEmployeeRoleWin" value="添加"/>
        </form>
    </div>

    <%-- 数据表格 --%>
    <div>
        <table id="employeeRoleTable"></table>
    </div>

    <%-- 添加模态框 --%>
    <div id="addEmployeeRoleWin" class="modal" data-backdrop="static">
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
                    <form id="addEmployeeRoleForm">
                        <div class="form-group">
                            <label>员工</label>
                            <div>
                                <select id="addEmployeeRoleEmployeeSelect"  name="employeeId"  data-bv-notempty="true" data-bv-notempty-message="用户不能为空" class="selectpicker" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label>角色</label>
                            <div>
                                <select id="addEmployeeRoleRoleSelect" name="roleId" data-bv-notempty="true" data-bv-notempty-message="角色不能为空" class="selectpicker" />
                            </div>
                        </div>
                    </form>
                </div>
                <!-- 底部信息-->
                <div class="modal-footer">
                    <button id="btnAddEmployeeRole" class="btn btn-primary">添加</button>
                    <button id="btnAddEmployeeRoleClose" class="btn btn-warning">取消</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 编辑模态框 --%>
    <div id="editEmployeeRoleWin" class="modal" data-backdrop="static">
        <!-- 对话框容器div-->
        <div class="modal-dialog">
            <!--内容容器 -->
            <div class="modal-content">
                <!-- 头部标题-->
                <div class="modal-title text-center">
                    <h4>编辑</h4></div>
                <!-- 主体内容-->
                <div class="modal-body">
                    <form id="editEmployeeRoleForm" class="form-horizontal text-center">
                        <div class="form-group">
                            <label class="col-md-2">ID</label>
                            <div class="col-md-4">
                                <input  name="id" readonly  type="text"  class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2">员工</label>
                            <div class="col-md-2">
                                <select id="updateEmployeeRoleEmployeeSelect"  name="employeeId"  data-bv-notempty="true" data-bv-notempty-message="用户不能为空" class="selectpicker" ></select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2">角色</label>
                            <div class="col-md-2">
                                <select id="updateEmployeeRoleRoleSelect" name="roleId" data-bv-notempty="true" data-bv-notempty-message="角色不能为空" type="text" class="selectpicker" ></select>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- 底部信息-->
                <div class="modal-footer">
                    <button class="btn btn-primary" id="btnEditEmployeeRole">保存</button>
                    <button class="btn btn-warning" id="btnEditEmployeeRoleClose">取消</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 初始化表格数据 --%>
    <script type="text/javascript">
    $('#employeeRoleTable').bootstrapTable({
        url: 'EmployeeRole/fenYe.action',
        method: 'GET',                      //请求方式（*）
        toolbar: '#employeeRoleToolbar',            //工具按钮用哪个容器
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
        height: 630,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
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
            }, {
                field: 'name',
                title: '员工',
                align:'center',
                formatter:function (value, row, index) {
                    return row.employee.name;
                }
            }, {
                field: 'password',
                title: '角色',
                align:'center',
                formatter:function (value, row, index) {
                    return row.role.name;
                }
            }, {
                field: '',
                width: 140,
                title: '操作',
                align:'center',
                formatter: function (value, row, index) {
                    var id = row.id;
                    return '<button class="btn btn-success"  onclick="editEmployeeRole(' + id + ')" >编辑</button>&nbsp;' +
                        '<button class="btn btn-danger"   onclick="deleteEmployeeRole(' + id + ')" >删除</button>';
                }
            }]
    });
    </script>

    <%-- 事件 --%>
    <script type="text/javascript">
        $.ajax({
            type: 'get',
            url: 'role/queryAll.action',
            async:false,
            dataType: "json",
            success: function (data) {
                $("#addEmployeeRoleRoleSelect").empty();
                for(var i=0;i<data.length;i++){

                    $("#addEmployeeRoleRoleSelect").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                }
                $("#addEmployeeRoleRoleSelect").selectpicker("refresh");
            }
        });
        $.ajax({
            type: 'get',
            url: 'employee/queryAll.action',
            async:false,
            dataType: "json",
            success: function (data) {
                $("#addEmployeeRoleEmployeeSelect").empty();
                for(var i=0;i<data.length;i++){
                    $("#addEmployeeRoleEmployeeSelect").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                }
                $("#addEmployeeRoleEmployeeSelect").selectpicker("refresh");
            }
        });
            $.ajax({
                type: 'get',
                url: 'role/queryAll.action',
                async:false,
                dataType: "json",
                success: function (data) {
                    $("#updateEmployeeRoleRoleSelect").empty();
                    for(var i=0;i<data.length;i++){

                        $("#updateEmployeeRoleRoleSelect").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                    }
                    $("#updateEmployeeRoleRoleSelect").selectpicker("refresh");
                }
            });
            $.ajax({
                type: 'get',
                url: 'employee/queryAll.action',
                async:false,
                dataType: "json",
                success: function (data) {
                    $("#updateEmployeeRoleEmployeeSelect").empty();
                    for(var i=0;i<data.length;i++){
                        $("#updateEmployeeRoleEmployeeSelect").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                    }
                    $("#updateEmployeeRoleEmployeeSelect").selectpicker("refresh");
                }
            });
        //添加页面表单验证
        $('#addEmployeeRoleForm').bootstrapValidator({
            // 表单框里右侧的icon
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            }
        });

        //添加页面 点击保存按钮
        $("#btnAddEmployeeRole").click(function () {
            $("#addEmployeeRoleForm").bootstrapValidator('validate');  //提交验证
            if ($("#addEmployeeRoleForm").data('bootstrapValidator').isValid()) {  //获取验证结果
                $('#addEmployeeRoleForm').form('submit', {
                    url:"EmployeeRole/add.action",
                    success:function(data){
                        alert(data?"添加成功":"添加失败");
                        //清除表单验证
                        $('#addEmployeeRoleForm').data("bootstrapValidator").resetForm();
                        //清除表单数据
                        $('#addEmployeeRoleForm')[0].reset();
                        //刷新后台表格数据
                        $("#employeeRoleTable").bootstrapTable("refresh");
                        //关闭窗口
                        $("#addEmployeeRoleWin").modal("hide");
                    }
                });
            }
        });

        //添加页面 点击取消按钮
        $("#btnAddEmployeeRoleClose").click(function () {
            //清除表单验证
            $('#addEmployeeRoleForm').data("bootstrapValidator").resetForm();
            //清处表单数据
            $('#addEmployeeRoleForm')[0].reset();
            //关闭模态框
            $("#addEmployeeRoleWin").modal("hide");
        });

        //编辑页面表单验证
        $('#editEmployeeRoleForm').bootstrapValidator({
            // 表单框里右侧的icon
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            }
        });

        //编辑页面 点击保存按钮
        $("#btnEditEmployeeRole").click(function () {
            $("#editEmployeeRoleForm").bootstrapValidator('validate');  //提交验证
            if ($("#editEmployeeRoleForm").data('bootstrapValidator').isValid()) {  //获取验证结果
                $('#editEmployeeRoleForm').form('submit', {
                    url: "EmployeeRole/update.action",
                    success: function (data) {
                        alert(data ? "修改成功" : "修改失败");
                        //清除表单验证
                        $('#editEmployeeRoleForm').data("bootstrapValidator").resetForm();
                        //刷新后台表格数据
                        $("#employeeRoleTable").bootstrapTable("refresh");
                        //关闭窗口
                        $("#editEmployeeRoleWin").modal("hide");
                    }
                });
            }
        })

        //编辑页面 点击取消按钮
        $("#btnEditEmployeeRoleClose").click(function () {
            //清除表单验证
            $('#editEmployeeRoleForm').data("bootstrapValidator").resetForm();
            $("#editEmployeeRoleWin").modal("hide");
        });

        //点击编辑按钮
        function editEmployeeRole(id) {


            $("#editEmployeeRoleForm").form('load',"EmployeeRole/queryById.action?id="+id);

            $("#editEmployeeRoleWin").modal("show");
        }

        //点击删除按钮
        function  deleteEmployeeRole(id) {
            $.post("EmployeeRole/delete.action",{"id":id},function (data) {
                //刷新后台表格数据
                $("#employeeRoleTable").bootstrapTable("refresh");
                alert(data?"删除成功":"删除失败");
            },'json');
        }

    </script>
</body>
</html>
