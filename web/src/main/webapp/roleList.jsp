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
    <title>菜单管理</title>
</head>
<body>
    <%-- 工具栏 --%>
    <div id="roleToolbar">
        <form class="form-inline">
            <div class="input-group">
                <span class="input-group-addon">名称</span>
                <input type="text" id="searchRoleName" class="form-control" placeholder="请输入名称">
                <div class="input-group-btn">
                    <input type="button" class="btn btn-success" id="btnSearchRole" value="查询">
                </div>
            </div>
            <input style="width: 100px" class="btn btn-primary" readonly data-toggle="modal" data-target="#addRoleWin" value="添加"/>
        </form>
    </div>

    <%-- 数据表格 --%>
    <div>
        <table id="roleTable"></table>
    </div>

    <%-- 添加模态框 --%>
    <div id="addRoleWin" class="modal" data-backdrop="static">
        <!-- 对话框容器div-->
        <div class="modal-dialog">
            <!--内容容器 -->
            <div class="modal-content">
                <!-- 头部标题-->
                <div class="modal-title text-center">
                    <h4>角色添加</h4>
                </div>
                <!-- 主体内容-->
                <div class="modal-body">
                    <form id="addRoleForm">
                        <div class="form-group">
                            <label>名称</label>
                            <input name="name" data-bv-notempty="true" data-bv-notempty-message="名称不能为空" type="text"  class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>备注</label>
                            <input name="remark"  type="text" class="form-control" />
                        </div>
                    </form>
                </div>
                <!-- 底部信息-->
                <div class="modal-footer">
                    <button id="btnAddRole" class="btn btn-primary">添加</button>
                    <button id="btnAddRoleClose" class="btn btn-warning">取消</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 编辑模态框 --%>
    <div id="editRoleWin" class="modal" data-backdrop="static">
        <!-- 对话框容器div-->
        <div class="modal-dialog">
            <!--内容容器 -->
            <div class="modal-content">
                <!-- 头部标题-->
                <div class="modal-title text-center">
                    <h4>角色编辑</h4></div>
                <!-- 主体内容-->
                <div class="modal-body">
                    <form id="editRoleForm">
                        <div class="form-group">
                            <label>ID</label>
                            <input id="updateRoleId" name="id" type="text" readonly class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label>名称</label>
                            <input id="updateRoleName" data-bv-notempty="true" data-bv-notempty-message="名称不能为空" name="name" type="text" required class="form-control " />
                        </div>
                        <div class="form-group">
                            <label>备注</label>
                            <input id="updateRoleRemark" name="remark" required type="text" class="form-control" />
                        </div>

                    </form>
                </div>
                <!-- 底部信息-->
                <div class="modal-footer">
                    <button class="btn btn-primary" id="btnEditRole">保存</button>
                    <button class="btn btn-warning" id="btnEditRoleClose">取消</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 初始化表格数据 --%>
    <script type="text/javascript">
    $('#roleTable').bootstrapTable({
        url: 'role/fenYe.action',
        method: 'GET',                      //请求方式（*）
        toolbar: '#roleToolbar',            //工具按钮用哪个容器
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
                page: (params.offset / params.limit) + 1,   //页码
                name: $("#searchRoleName").val()         //查询
            };
            return temp;
        },
        columns: [
            {   field: 'id',
                align:'center',
                title: 'ID'
            }, {
                field: 'name',
                align:'center',
                title: '名称'
            }, {
                field: 'remark',
                align:'center',
                title: '备注'
            }, {
                field: '',
                width: 140,
                title: '操作',
                formatter: function (value, row, index) {
                    var id = row.id;
                    return '<button class="btn btn-success"  onclick="editRole(' + id + ')" >编辑</button>&nbsp;' +
                        '<button class="btn btn-danger"   onclick="deleteRole(' + id + ')" >删除</button>';
                }
            }]
    });
    </script>

    <%-- 事件 --%>
    <script type="text/javascript">
        //查询条件
        $("#btnSearchRole").click(function () {
            $('#roleTable').bootstrapTable("refresh");
        })

        //添加页面表单验证
        $('#addRoleForm').bootstrapValidator({
            // 表单框里右侧的icon
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            }
        });

        //添加页面 点击保存按钮
        $("#btnAddRole").click(function () {
            $("#addRoleForm").bootstrapValidator('validate');  //提交验证
            if ($("#addRoleForm").data('bootstrapValidator').isValid()) {  //获取验证结果
                $('#addRoleForm').form('submit', {
                    url: "role/add.action",
                    success: function (data) {
                        alert(data ? "添加成功" : "添加失败");
                        //清除表单验证
                        $('#addRoleForm').data("bootstrapValidator").resetForm();
                        //清除表单数据
                        $('#addRoleForm')[0].reset();
                        //刷新后台表格数据
                        $("#roleTable").bootstrapTable("refresh");
                        //关闭窗口
                        $("#addRoleWin").modal("hide");
                    }
                });
            }
        });

        //添加页面 点击取消按钮
        $("#btnAddRoleClose").click(function () {
            //清除表单验证
            $('#addRoleForm').data("bootstrapValidator").resetForm();
            //清除表单数据
            $('#addRoleForm')[0].reset();
            //关闭模态框
            $("#addRoleWin").modal("hide");
        });

        //编辑页面表单验证
        $('#editRoleForm').bootstrapValidator({
            // 表单框里右侧的icon
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            }
        });

        //编辑页面 点击保存按钮
        $("#btnEditRole").click(function () {
            $("#editRoleForm").bootstrapValidator('validate');  //提交验证
            if ($("#editRoleForm").data('bootstrapValidator').isValid()) {  //获取验证结果
                $('#editRoleForm').form('submit', {
                    url: "role/update.action",
                    success: function (data) {
                        alert(data ? "修改成功" : "修改失败");
                        //清除表单验证
                        $('#editRoleForm').data("bootstrapValidator").resetForm();
                        //刷新后台表格数据
                        $("#roleTable").bootstrapTable("refresh");
                        //关闭窗口
                        $("#editRoleWin").modal("hide");
                    }
                });
            }
        });

        //编辑页面 点击取消按钮
        $("#btnEditRoleClose").click(function () {
            //清除表单验证
            $('#editRoleForm').data("bootstrapValidator").resetForm();
            $("#editRoleWin").modal("hide");
        });

        //点击编辑按钮
        function editRole(id) {
            $("#editRoleWin").modal("show");
            /*$.post("role/queryById.action",{"id":id},function (data) {
                $("#updateRoleId").val(data.id);
                $("#updateRoleName").val(data.name);
                $("#updateRoleRemark").val(data.remark);
            })*/
            $("#editRoleForm").form('load',"role/queryById.action?id="+id);
        }

        //点击删除按钮
        function  deleteRole(id) {
            $.post("role/delete.action",{"id":id},function (data) {
                //刷新后台表格数据
                $("#roleTable").bootstrapTable("refresh");
                alert(data?"删除成功":"删除失败");
            });
        }

    </script>
</body>
</html>
