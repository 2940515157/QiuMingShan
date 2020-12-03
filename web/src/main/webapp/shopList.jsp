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
    <div id="ShopToolbar">
        <form class="form-inline">
            <div class="input-group">
                <span class="input-group-addon">店名</span>
                <input type="text" id="searchShopName" class="form-control" placeholder="请输入名称">
                <div class="input-group-btn">
                    <input type="button" class="btn btn-success" id="btnSearchShop" value="查询">
                </div>
            </div>
            <input style="width: 100px" class="btn btn-primary" readonly data-toggle="modal"
                   data-target="#addShopWin" value="添加"/>
        </form>
    </div>

    <%-- 数据表格 --%>
    <div>
        <table id="ShopTable"></table>
    </div>

    <%-- 添加模态框 --%>
    <div id="addShopWin" class="modal" data-backdrop="static">
        <!-- 对话框容器div-->
        <div class="modal-dialog">
            <!--内容容器 -->
            <div class="modal-content">
                <!-- 头部标题-->
                <div class="modal-title text-center">
                    <h4>门店添加</h4>
                </div>
                <!-- 主体内容-->
                <div class="modal-body">
                    <form id="addShopForm">
                        <div class="form-group">
                            <label>店名</label>
                            <input name="name" type="text" data-bv-notempty="true" data-bv-notempty-message="店名不能为空" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>店长</label>
                            <input name="manager" data-bv-notempty="true" data-bv-notempty-message="店长不能为空" type="text" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>电话</label>
                            <input name="tel" data-bv-notempty="true" data-bv-notempty-message="电话不能为空" type="text" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>地址</label>
                            <input name="address" data-bv-notempty="true" data-bv-notempty-message="地址不能为空" type="text" class="form-control" />
                        </div>
                    </form>
                </div>
                <!-- 底部信息-->
                <div class="modal-footer">
                    <button id="btnAddShop" class="btn btn-primary">添加</button>
                    <button id="btnAddShopClose" class="btn btn-warning">取消</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 编辑模态框 --%>
    <div id="editShopWin" class="modal" data-backdrop="static">
        <!-- 对话框容器div-->
        <div class="modal-dialog">
            <!--内容容器 -->
            <div class="modal-content">
                <!-- 头部标题-->
                <div class="modal-title text-center">
                    <h4>门店编辑</h4></div>
                <!-- 主体内容-->
                <div class="modal-body">
                    <form id="editShopForm">
                        <div class="form-group">
                            <label>ID</label>
                            <input name="id" readonly  type="text"  class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label>店名</label>
                            <input name="name" type="text" data-bv-notempty="true" data-bv-notempty-message="店名不能为空" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>店长</label>
                            <input name="manager" data-bv-notempty="true" data-bv-notempty-message="店长不能为空" type="text" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>电话</label>
                            <input name="tel" data-bv-notempty="true" data-bv-notempty-message="电话不能为空" type="text" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>地址</label>
                            <input name="address" data-bv-notempty="true" data-bv-notempty-message="地址不能为空" type="text" class="form-control" />
                        </div>
                    </form>
                </div>
                <!-- 底部信息-->
                <div class="modal-footer">
                    <button class="btn btn-primary" id="btnEditShop">保存</button>
                    <button class="btn btn-warning" id="btnEditShopClose">取消</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 初始化表格数据 --%>
    <script type="text/javascript">
    $('#ShopTable').bootstrapTable({
        url: 'Shop/fenYe.action',
        method: 'GET',                      //请求方式（*）
        toolbar: '#ShopToolbar',            //工具按钮用哪个容器
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
                name: $("#searchShopName").val()         //查询
            };
            return temp;
        },
        columns: [
            {   field: 'id',
                title: 'ID',
                align:'center'
            }, {
                field: 'name',
                title: '店名',
                align:'center'
            }, {
                field: 'manager',
                title: '店长',
                align:'center'
            }, {
                field: 'tel',
                title: '电话',
                align:'center'
            }, {
                field: 'address',
                title: '地址',
                align:'center'
            },  {
                field: '',
                width: 140,
                title: '操作',
                align:'center',
                formatter: function (value, row, index) {
                    var id = row.id;
                    return '<button class="btn btn-success"  onclick="editShop(' + id + ')" >编辑</button>&nbsp;' +
                        '<button class="btn btn-danger"   onclick="deleteShop(' + id + ')" >删除</button>';
                }
            }]
    });
    </script>

    <%-- 事件 --%>
    <script type="text/javascript">
        //查询条件
        $("#btnSearchShop").click(function () {
            $('#ShopTable').bootstrapTable("refresh");
        })

        //添加页面表单验证
        $('#addShopForm').bootstrapValidator({
            // 表单框里右侧的icon
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            }
        });

        //添加页面 点击保存按钮
        $("#btnAddShop").click(function () {
            $("#addShopForm").bootstrapValidator('validate');  //提交验证
            if ($("#addShopForm").data('bootstrapValidator').isValid()) {  //获取验证结果
                $('#addShopForm').form('submit', {
                    url:"Shop/add.action",
                    success:function(data){
                        alert(data?"添加成功":"添加失败");
                        //清除表单验证
                        $('#addShopForm').data("bootstrapValidator").resetForm();
                        //清除表单数据
                        $('#addShopForm')[0].reset();
                        //刷新后台表格数据
                        $("#ShopTable").bootstrapTable("refresh");
                        //关闭窗口
                        $("#addShopWin").modal("hide");
                    }
                });
            }
        });

        //添加页面 点击取消按钮
        $("#btnAddShopClose").click(function () {
            //清除表单验证
            $('#addShopForm').data("bootstrapValidator").resetForm();
            //清处表单数据
            $('#addShopForm')[0].reset();
            //关闭模态框
            $("#addShopWin").modal("hide");
        });

        //编辑页面表单验证
        $('#editShopForm').bootstrapValidator({
            // 表单框里右侧的icon
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            }
        });

        //编辑页面 点击保存按钮
        $("#btnEditShop").click(function () {
            $("#editShopForm").bootstrapValidator('validate');  //提交验证
            if ($("#editShopForm").data('bootstrapValidator').isValid()) {  //获取验证结果
                $('#editShopForm').form('submit', {
                    url: "Shop/update.action",
                    success: function (data) {
                        alert(data ? "修改成功" : "修改失败");
                        //清除表单验证
                        $('#editShopForm').data("bootstrapValidator").resetForm();
                        //刷新后台表格数据
                        $("#ShopTable").bootstrapTable("refresh");
                        //关闭窗口
                        $("#editShopWin").modal("hide");
                    }
                });
            }
        })

        //编辑页面 点击取消按钮
        $("#btnEditShopClose").click(function () {
            //清除表单验证
            $('#editShopForm').data("bootstrapValidator").resetForm();
            $("#editShopWin").modal("hide");
        });

        //点击编辑按钮
        function editShop(id) {
            $("#editShopWin").modal("show");
            $("#editShopForm").form('load',"Shop/queryById.action?id="+id);
        }

        //点击删除按钮
        function  deleteShop(id) {
            $.post("Shop/delete.action",{"id":id},function (data) {
                //刷新后台表格数据
                $("#ShopTable").bootstrapTable("refresh");
                alert(data?"删除成功":"删除失败");
            });
        }

    </script>
</body>
</html>
