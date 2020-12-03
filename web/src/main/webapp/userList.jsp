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
    <title>用户管理</title>
</head>
<body>
    <%-- 工具栏 --%>
    <div id="userToolbar">
        <form class="form-inline">
            <div class="input-group">
                <span class="input-group-addon">用户名</span>
                <input type="text" id="searchUserName" class="form-control" placeholder="请输入名称">
                <div class="input-group-btn">
                    <input type="button" class="btn btn-success" id="btnSearchUser" value="查询">
                </div>
            </div>
            <input style="width: 100px" class="btn btn-primary" readonly data-toggle="modal"
                   data-target="#addUserWin" value="添加"/>
        </form>
    </div>

    <%-- 数据表格 --%>
    <div>
        <table id="userTable"></table>
    </div>

    <%-- 添加模态框 --%>
    <div id="addUserWin" class="modal" data-backdrop="static">
        <!-- 对话框容器div-->
        <div class="modal-dialog">
            <!--内容容器 -->
            <div class="modal-content">
                <!-- 头部标题-->
                <div class="modal-title text-center">
                    <h4>用户添加</h4>
                </div>
                <!-- 主体内容-->
                <div class="modal-body">
                    <form id="addUserForm">
                        <div class="form-group">
                            <label>用户名</label>
                            <input name="name" type="text" data-bv-notempty="true" data-bv-notempty-message="用户名不能为空" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>密码</label>
                            <input name="password" data-bv-notempty="true" data-bv-notempty-message="密码不能为空" type="text" class="form-control" />
                        </div>
                    </form>
                </div>
                <!-- 底部信息-->
                <div class="modal-footer">
                    <button id="btnAddUser" class="btn btn-primary">添加</button>
                    <button id="btnAddUserClose" class="btn btn-warning">取消</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 编辑模态框 --%>
    <div id="editUserWin" class="modal" data-backdrop="static">
        <!-- 对话框容器div-->
        <div class="modal-dialog">
            <!--内容容器 -->
            <div class="modal-content">
                <!-- 头部标题-->
                <div class="modal-title text-center">
                    <h4>用户编辑</h4></div>
                <!-- 主体内容-->
                <div class="modal-body">
                    <form id="editUserForm">
                        <div class="form-group">
                            <label>ID</label>
                            <input id="updateUserId" name="id" readonly  type="text"  class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label>用户名</label>
                            <input id="updateUserName" data-bv-notempty="true" data-bv-notempty-message="用户名不能为空" name="name" type="text"  class="form-control " />
                        </div>
                        <div class="form-group">
                            <label>密码</label>
                            <input id="updateUserPassword" data-bv-notempty="true" data-bv-notempty-message="密码不能为空" name="password"  type="text" class="form-control" />
                        </div>

                    </form>
                </div>
                <!-- 底部信息-->
                <div class="modal-footer">
                    <button class="btn btn-primary" id="btnEditUser">保存</button>
                    <button class="btn btn-warning" id="btnEditUserClose">取消</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 初始化表格数据 --%>
    <script type="text/javascript">
    $('#userTable').bootstrapTable({
        url: 'user/fenYe.action',
        method: 'GET',                      //请求方式（*）
        toolbar: '#userToolbar',            //工具按钮用哪个容器
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
                name: $("#searchUserName").val()         //查询
            };
            return temp;
        },
        columns: [
            {   field: 'id',
                title: 'ID',
                align:'center'
            }, {
                field: 'name',
                title: '名称',
                align:'center'
            }, {
                field: 'password',
                title: '密码',
                align:'center'
            }, {
                field: '',
                width: 140,
                title: '操作',
                align:'center',
                formatter: function (value, row, index) {
                    var id = row.id;
                    return '<button class="btn btn-success"  onclick="editUser(' + id + ')" >编辑</button>&nbsp;' +
                        '<button class="btn btn-danger"   onclick="deleteUser(' + id + ')" >删除</button>';
                }
            }]
    });
    </script>

    <%-- 事件 --%>
    <script type="text/javascript">
        //查询条件
        $("#btnSearchUser").click(function () {
            $('#userTable').bootstrapTable("refresh");
        })

        //添加页面表单验证
        $('#addUserForm').bootstrapValidator({
            // 表单框里右侧的icon
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            }
        });

        //添加页面 点击保存按钮
        $("#btnAddUser").click(function () {
            $("#addUserForm").bootstrapValidator('validate');  //提交验证
            if ($("#addUserForm").data('bootstrapValidator').isValid()) {  //获取验证结果
                $('#addUserForm').form('submit', {
                    url:"user/add.action",
                    success:function(data){
                        alert(data?"添加成功":"添加失败");
                        //清除表单验证
                        $('#addUserForm').data("bootstrapValidator").resetForm();
                        //清除表单数据
                        $('#addUserForm')[0].reset();
                        //刷新后台表格数据
                        $("#userTable").bootstrapTable("refresh");
                        //关闭窗口
                        $("#addUserWin").modal("hide");
                    }
                });
            }
        });

        //添加页面 点击取消按钮
        $("#btnAddUserClose").click(function () {
            //清除表单验证
            $('#addUserForm').data("bootstrapValidator").resetForm();
            //清处表单数据
            $('#addUserForm')[0].reset();
            //关闭模态框
            $("#addUserWin").modal("hide");
        });

        //编辑页面表单验证
        $('#editUserForm').bootstrapValidator({
            // 表单框里右侧的icon
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            }
        });

        //编辑页面 点击保存按钮
        $("#btnEditUser").click(function () {
            $("#editUserForm").bootstrapValidator('validate');  //提交验证
            if ($("#editUserForm").data('bootstrapValidator').isValid()) {  //获取验证结果
                $('#editUserForm').form('submit', {
                    url: "user/update.action",
                    success: function (data) {
                        alert(data ? "修改成功" : "修改失败");
                        //清除表单验证
                        $('#editUserForm').data("bootstrapValidator").resetForm();
                        //刷新后台表格数据
                        $("#userTable").bootstrapTable("refresh");
                        //关闭窗口
                        $("#editUserWin").modal("hide");
                    }
                });
            }
        })

        //编辑页面 点击取消按钮
        $("#btnEditUserClose").click(function () {
            //清除表单验证
            $('#editUserForm').data("bootstrapValidator").resetForm();
            $("#editUserWin").modal("hide");
        });

        //点击编辑按钮
        function editUser(id) {
            $("#editUserWin").modal("show");
            $("#editUserForm").form('load',"user/queryById.action?id="+id);
        }

        //点击删除按钮
        function  deleteUser(id) {
            $.post("user/delete.action",{"id":id},function (data) {
                //刷新后台表格数据
                $("#userTable").bootstrapTable("refresh");
                alert(data?"删除成功":"删除失败");
            });
        }

    </script>
</body>
</html>
