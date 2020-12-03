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
<div id="menuToolbar">
    <form class="form-inline">
        <div class="input-group">
            <span class="input-group-addon">名称</span>
            <input type="text" id="searchMenuName" class="form-control" placeholder="请输入名称">
            <span class="input-group-addon ">父节点</span>
            <input type="text" id="searchMenuParentId" class="form-control" placeholder="请输入父节点ID">
            <div class="input-group-btn">
                <input type="button" class="btn btn-success" id="btnSearchMenu" value="查询">
            </div>
        </div>
        <input style="width: 100px" class="btn btn-primary" readonly data-toggle="modal" data-target="#addMenuWin"
               value="添加"/>
    </form>
</div>

<%-- 数据表格 --%>
<div>
    <table id="menuTable"></table>
</div>

<%-- 添加模态框 --%>
<div id="addMenuWin" class="modal" data-backdrop="static">
    <!-- 对话框容器div-->
    <div class="modal-dialog">
        <!--内容容器 -->
        <div class="modal-content">
            <!-- 头部标题-->
            <div class="modal-title text-center">
                <h4>菜单添加</h4>
            </div>
            <!-- 主体内容-->
            <div class="modal-body">
                <form id="addMenuForm">
                    <div class="form-group">
                        <label>菜单名称</label>
                        <input name="name" type="text" data-bv-notempty="true" data-bv-notempty-message="菜单名称不能为空"
                               class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label>菜单代码</label>
                        <input name="menuCode" type="text" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label>父节点</label>
                        <input name="parentId" data-bv-notempty="true" data-bv-notempty-message="父节点不能为空" type="number"
                               class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label>节点类型</label>
                        <input name="nodeType" data-bv-notempty="true" data-bv-notempty-message="节点类型不能为空" type="number"
                               class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label>图标地址</label>
                        <input name="iconUrl" type="text" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label>菜单地址</label>
                        <input name="linkUrl" type="text" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label>层次</label>
                        <input name="level" data-bv-notempty="true" data-bv-notempty-message="层次不能为空" type="number"
                               class="form-control"/>
                    </div>
                </form>
            </div>
            <!-- 底部信息-->
            <div class="modal-footer">
                <button id="btnAddMenu" class="btn btn-primary">添加</button>
                <button id="btnAddMenuClose" class="btn btn-warning">取消</button>
            </div>
        </div>
    </div>
</div>

<%-- 编辑模态框 --%>
<div id="editMenuWin" class="modal" data-backdrop="static">
    <!-- 对话框容器div-->
    <div class="modal-dialog">
        <!--内容容器 -->
        <div class="modal-content">
            <!-- 头部标题-->
            <div class="modal-title text-center">
                <h4>菜单编辑</h4></div>
            <!-- 主体内容-->
            <div class="modal-body">
                <form id="editMenuForm">
                    <div class="form-group">
                        <label>ID</label>
                        <input id="updateMenuId" name="id" type="text" readonly class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label>名称</label>
                        <input id="updateMenuName" name="name" type="text" data-bv-notempty="true"
                               data-bv-notempty-message="菜单名称不能为空" class="form-control "/>
                    </div>
                    <div class="form-group">
                        <label>菜单代码</label>
                        <input id="updateMenuCode" name="menuCode" type="text" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label>父节点</label>
                        <input id="updateMenuParentId" name="parentId" data-bv-notempty="true"
                               data-bv-notempty-message="父节点不能为空" type="number" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label>节点类型</label>
                        <input id="updateMenuNodeType" name="nodeType" data-bv-notempty="true"
                               data-bv-notempty-message="节点类型不能为空" type="number" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>图标地址</label>
                        <input id="updateMenuIconUrl" name="iconUrl" type="text" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label>菜单地址</label>
                        <input id="updateMenuLinkUrl" name="linkUrl" type="text" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label>层次</label>
                        <input id="updateMenuLevel" name="level" data-bv-notempty="true"
                               data-bv-notempty-message="层次不能为空" type="number" class="form-control"/>
                    </div>
                </form>
            </div>
            <!-- 底部信息-->
            <div class="modal-footer">
                <button class="btn btn-primary" id="btnEditMenu">保存</button>
                <button class="btn btn-warning" id="btnEditMenuClose">取消</button>
            </div>
        </div>
    </div>
</div>

<%-- 初始化表格数据 --%>
<script type="text/javascript">
    $('#menuTable').bootstrapTable({
        url: 'menu/fenYe.action',
        method: 'GET',                      //请求方式（*）
        toolbar: '#menuToolbar',            //工具按钮用哪个容器
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
                page: (params.offset / params.limit) + 1,   //页码
                name: $("#searchMenuName").val(),           //查询
                parentId: $("#searchMenuParentId").val()
            };
            return temp;
        },
        columns: [
            {
                field: 'id',
                align: 'center',
                title: 'ID'
            }, {
                field: 'name',
                align: 'center',
                title: '名称'
            }, {
                field: 'menuCode',
                align: 'center',
                title: '菜单代码'
            }, {
                field: 'parentId',
                title: '父节点',
                align: 'center'
            }, {
                field: 'nodeType',
                align: 'center',
                title: '节点类型'
            }, {
                field: 'iconUrl',
                align: 'center',
                title: '图标地址'
            }, {
                field: 'linkUrl',
                align: 'center',
                title: '菜单地址'
            }, {
                field: 'level',
                align: 'center',
                title: '层次'
            }, {
                field: '',
                width: 140,
                align: 'center',
                title: '操作',
                formatter: function (value, row, index) {
                    var id = row.id;
                    return '<button class="btn btn-success"  onclick="editMenu(' + id + ')" >编辑</button>&nbsp;' +
                        '<button class="btn btn-danger"   onclick="deleteMenu(' + id + ')" >删除</button>';
                }
            }]
    });
</script>

<%-- 事件 --%>
<script type="text/javascript">
    //查询条件
    $("#btnSearchMenu").click(function () {
        $('#menuTable').bootstrapTable("refresh");
    })

    //添加页面表单验证
    $('#addMenuForm').bootstrapValidator({
        // 表单框里右侧的icon
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        }
    });

    //添加页面 点击保存按钮
    $("#btnAddMenu").click(function () {
        $("#addMenuForm").bootstrapValidator('validate');  //提交验证
        if ($("#addMenuForm").data('bootstrapValidator').isValid()) {  //获取验证结果
            $('#addMenuForm').form('submit', {
                url: "menu/add.action",
                success: function (data) {
                    alert(data ? "添加成功" : "添加失败");
                    //清除表单数据
                    $('#addMenuForm')[0].reset();
                    //刷新后台表格数据
                    $("#menuTable").bootstrapTable("refresh");
                    //关闭窗口
                    $("#addMenuWin").modal("hide");
                }
            });
        }
    });

    //添加页面 点击取消按钮
    $("#btnAddMenuClose").click(function () {
        //清处表单数据
        $('#addMenuForm')[0].reset();
        $("#addMenuWin").modal("hide");
    });

    //编辑页面表单验证
    $('#editMenuForm').bootstrapValidator({
        // 表单框里右侧的icon
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        }
    });

    //编辑页面 点击保存按钮
    $("#btnEditMenu").click(function () {
        $("#editMenuForm").bootstrapValidator('validate');  //提交验证
        if ($("#editMenuForm").data('bootstrapValidator').isValid()) {  //获取验证结果
            $('#editMenuForm').form('submit', {
                url: "menu/update.action",
                success: function (data) {
                    alert(data ? "修改成功" : "修改失败");
                    //刷新后台表格数据
                    $("#menuTable").bootstrapTable("refresh");
                    //关闭窗口
                    $("#editMenuWin").modal("hide");
                }
            });
        }
    })

    //编辑页面 点击取消按钮
    $("#btnEditMenuClose").click(function () {
        $("#editMenuWin").modal("hide");
    });

    //点击编辑按钮
    function editMenu(id) {
        $("#editMenuWin").modal("show");
        $.post("menu/queryById.action",{"id":id},function (data) {
            $("#updateMenuId").val(data.id);
            $("#updateMenuName").val(data.name);
            $("#updateMenuCode").val(data.menuCode);
            $("#updateMenuParentId").val(data.parentId);
            $("#updateMenuNodeType").val(data.nodeType);
            $("#updateMenuIconUrl").val(data.iconUrl);
            $("#updateMenuLinkUrl").val(data.linkUrl);
            $("#updateMenuLevel").val(data.level);
        })
        //$("#editMenuForm").form('load', "menu/queryById.action?id=" + id);
    }

    //点击删除按钮
    function deleteMenu(id) {
        $.post("menu/delete.action", {"id": id}, function (data) {
            //刷新后台表格数据
            $("#menuTable").bootstrapTable("refresh");
            alert(data ? "删除成功" : "删除失败");
        });
    }

</script>
</body>
</html>
