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
    <div id="CarToolbar">
        <form class="form-inline">
            <div class="input-group">
                <span class="input-group-addon">品牌</span>
                <input type="text" id="searchCarBrand" class="form-control" placeholder="请输入品牌">
                <span class="input-group-addon">名称</span>
                <input type="text" id="searchCarName" class="form-control" placeholder="请输入名称">
                <div class="input-group-btn">
                    <input type="button" class="btn btn-success" id="btnSearchCar" value="查询">
                </div>
            </div>
            <input style="width: 100px" class="btn btn-primary" readonly data-toggle="modal"
                   data-target="#addCarWin" value="添加"/>
        </form>
    </div>

    <%-- 数据表格 --%>
    <div>
        <table id="CarTable"></table>
    </div>

    <%-- 添加模态框 --%>
    <div id="addCarWin" class="modal" data-backdrop="static">
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
                    <form id="addCarForm">
                        <div class="form-group">
                            <label>品牌</label>
                            <input name="brand" type="text" data-bv-notempty="true" data-bv-notempty-message="品牌不能为空" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>车牌</label>
                            <input name="carID" type="text" data-bv-notempty="true" data-bv-notempty-message="车牌不能为空"  class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>名称</label>
                            <input  name="name" type="text" data-bv-notempty="true" data-bv-notempty-message="名称不能为空"  class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>类型</label>
                            <input name="type" type="text" data-bv-notempty="true" data-bv-notempty-message="类型不能为空" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>颜色</label>
                            <input name="color" type="text" data-bv-notempty="true" data-bv-notempty-message="颜色不能为空" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>出厂时间</label>
                            <input name="time" type="date" data-bv-notempty="true" data-bv-notempty-message="出厂时间不能为空" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>图片地址</label>
                            <input name="imgUrl" type="text" data-bv-notempty="true" data-bv-notempty-message="图片地址不能为空" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>租金/天</label>
                            <input name="rent" type="number" data-bv-notempty="true" data-bv-notempty-message="租金不能为空" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>备注</label>
                            <input name="remark" type="text" class="form-control" />
                        </div>
                    </form>
                </div>
                <!-- 底部信息-->
                <div class="modal-footer">
                    <button id="btnAddCar" class="btn btn-primary">添加</button>
                    <button id="btnAddCarClose" class="btn btn-warning">取消</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 编辑模态框 --%>
    <div id="editCarWin" class="modal" data-backdrop="static">
        <!-- 对话框容器div-->
        <div class="modal-dialog">
            <!--内容容器 -->
            <div class="modal-content">
                <!-- 头部标题-->
                <div class="modal-title text-center">
                    <h4>编辑</h4></div>
                <!-- 主体内容-->
                <div class="modal-body">
                    <form id="editCarForm">
                        <div class="form-group">
                            <label>ID</label>
                            <input name="id" readonly  type="text"  class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label>品牌</label>
                            <input name="brand" type="text" data-bv-notempty="true" data-bv-notempty-message="品牌不能为空" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>车牌</label>
                            <input name="carID" type="text" data-bv-notempty="true" data-bv-notempty-message="车牌不能为空"  class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>名称</label>
                            <input  name="name" type="text" data-bv-notempty="true" data-bv-notempty-message="名称不能为空"  class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>类型</label>
                            <input name="type" type="text" data-bv-notempty="true" data-bv-notempty-message="类型不能为空" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>颜色</label>
                            <input name="color" type="text" data-bv-notempty="true" data-bv-notempty-message="颜色不能为空" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>出厂时间</label>
                            <input name="time" type="date" data-bv-notempty="true" data-bv-notempty-message="出厂时间不能为空" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>图片地址</label>
                            <input name="imgUrl" type="text" data-bv-notempty="true" data-bv-notempty-message="图片地址不能为空" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>租金/天</label>
                            <input name="rent" type="number" data-bv-notempty="true" data-bv-notempty-message="租金不能为空" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>备注</label>
                            <input name="remark" type="text" class="form-control" />
                        </div>
                    </form>
                </div>
                <!-- 底部信息-->
                <div class="modal-footer">
                    <button class="btn btn-primary" id="btnEditCar">保存</button>
                    <button class="btn btn-warning" id="btnEditCarClose">取消</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 初始化表格数据 --%>
    <script type="text/javascript">
    $('#CarTable').bootstrapTable({
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
                name: $("#searchCarName").val(),        //查询
                brand: $("#searchCarBrand").val()
            };
            return temp;
        },
        columns: [
            {   field: 'id',
                title: 'ID',
                align:'center'
            },
            {
                field: 'imgUrl',
                title: '图片',
                align:'center',
                formatter:function (value, row, index) {
                    return '<img style="width: 100px;height: 70px;" src='+row.imgUrl+'>'
                }
            },{
                field: 'brand',
                title: '品牌',
                align:'center'
            }, {
                field: 'carID',
                title: '车牌',
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
            },   {
                field: 'rent',
                title: '租金/天',
                align:'center'
            },  {
                field: 'remark',
                title: '备注',
                align:'center'
            },  {
                field: '',
                width: 140,
                title: '操作',
                align:'center',
                formatter: function (value, row, index) {
                    var id = row.id;
                    return '<button class="btn btn-success"  onclick="editCar(' + id + ')" >编辑</button>&nbsp;' +
                        '<button class="btn btn-danger"   onclick="deleteCar(' + id + ')" >删除</button>';
                }
            }]
    });
    </script>

    <%-- 事件 --%>
    <script type="text/javascript">
        //查询条件
        $("#btnSearchCar").click(function () {
            $('#CarTable').bootstrapTable("refresh");
        })

        //添加页面表单验证
        $('#addCarForm').bootstrapValidator({
            // 表单框里右侧的icon
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            }
        });

        //添加页面 点击保存按钮
        $("#btnAddCar").click(function () {
            $("#addCarForm").bootstrapValidator('validate');  //提交验证
            if ($("#addCarForm").data('bootstrapValidator').isValid()) {  //获取验证结果
                $('#addCarForm').form('submit', {
                    url:"Car/add.action",
                    success:function(data){
                        alert(data?"添加成功":"添加失败");
                        //清除表单验证
                        $('#addCarForm').data("bootstrapValidator").resetForm();
                        //清除表单数据
                        $('#addCarForm')[0].reset();
                        //刷新后台表格数据
                        $("#CarTable").bootstrapTable("refresh");
                        //关闭窗口
                        $("#addCarWin").modal("hide");
                    }
                });
            }
        });

        //添加页面 点击取消按钮
        $("#btnAddCarClose").click(function () {
            //清除表单验证
            $('#addCarForm').data("bootstrapValidator").resetForm();
            //清处表单数据
            $('#addCarForm')[0].reset();
            //关闭模态框
            $("#addCarWin").modal("hide");
        });

        //编辑页面表单验证
        $('#editCarForm').bootstrapValidator({
            // 表单框里右侧的icon
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            }
        });

        //编辑页面 点击保存按钮
        $("#btnEditCar").click(function () {
            $("#editCarForm").bootstrapValidator('validate');  //提交验证
            if ($("#editCarForm").data('bootstrapValidator').isValid()) {  //获取验证结果
                $('#editCarForm').form('submit', {
                    url: "Car/update.action",
                    success: function (data) {
                        alert(data ? "修改成功" : "修改失败");
                        //清除表单验证
                        $('#editCarForm').data("bootstrapValidator").resetForm();
                        //刷新后台表格数据
                        $("#CarTable").bootstrapTable("refresh");
                        //关闭窗口
                        $("#editCarWin").modal("hide");
                    }
                });
            }
        })

        //编辑页面 点击取消按钮
        $("#btnEditCarClose").click(function () {
            //清除表单验证
            $('#editCarForm').data("bootstrapValidator").resetForm();
            $("#editCarWin").modal("hide");
        });

        //点击编辑按钮
        function editCar(id) {
            $("#editCarWin").modal("show");
            $("#editCarForm").form('load',"Car/queryById.action?id="+id);
        }

        //点击删除按钮
        function  deleteCar(id) {
            $.post("Car/delete.action",{"id":id},function (data) {
                //刷新后台表格数据
                $("#CarTable").bootstrapTable("refresh");
                alert(data?"删除成功":"删除失败");
            });
        }

    </script>
</body>
</html>
