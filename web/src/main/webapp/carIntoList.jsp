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
    <div id="CarIntoToolbar">
        <form class="form-inline">
            <input style="width: 100px" class="btn btn-primary" readonly data-toggle="modal"
                   data-target="#addCarIntoWin" value="添加"/>
        </form>
    </div>

    <%-- 数据表格 --%>
    <div>
        <table id="CarIntoTable"></table>
    </div>

    <%-- 添加模态框 --%>
    <div id="addCarIntoWin" class="modal" data-backdrop="static">
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
                    <form id="addCarIntoForm">
                        <div class="form-group">
                            <label>用户 车辆</label>
                            <div>
                                <select id="addCarIntoCarSelect"  name="carOutId"  data-bv-notempty="true" data-bv-notempty-message="不能为空" class="selectpicker" ></select>
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
                    <button id="btnAddCarInto" class="btn btn-primary">添加</button>
                    <button id="btnAddCarIntoClose" class="btn btn-warning">取消</button>
                </div>
            </div>
        </div>
    </div>


    <%-- 初始化表格数据 --%>
    <script type="text/javascript">
    $('#CarIntoTable').bootstrapTable({
        url: 'CarInto/fenYe2.action',
        method: 'GET',                      //请求方式（*）
        toolbar: '#CarIntoToolbar',            //工具按钮用哪个容器
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
                field: ' ',
                width: 140,
                title: '审核',
                align: 'center',
                formatter:function (value,row,index) {
                    var id = row.id;
                    return '<button class="btn btn-success"  onclick="trueCarInto(' + id + ')" >批准</button>&nbsp;' +
                        '<button class="btn btn-danger"   onclick="falseCarInto(' + id + ')" >不批</button>';
                }
            }]
    });
    </script>

    <%-- 事件 --%>
    <script type="text/javascript">
        $.ajax({
            type: 'get',
            url: 'CarOut/queryAll2.action',
            async:false,
            dataType: "json",
            success: function (data) {
                $("#addCarIntoCarSelect").empty();
                for(var i=0;i<data.length;i++){
                        console.log(data[i].user)
                    $("#addCarIntoCarSelect").append("<option value='"+data[i].id+"'>"+data[i].user.name+'  '+data[i].car.name+"</option>");
                }
                $("#addCarIntoCarSelect").selectpicker("refresh");
            }
        });

        //添加页面表单验证
        $('#addCarIntoForm').bootstrapValidator({
            // 表单框里右侧的icon
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            }
        });

        //添加页面 点击保存按钮
        $("#btnAddCarInto").click(function () {
            $("#addCarIntoForm").bootstrapValidator('validate');  //提交验证
            if ($("#addCarIntoForm").data('bootstrapValidator').isValid()) {  //获取验证结果
                $('#addCarIntoForm').form('submit', {
                    url:"CarInto/add.action",
                    success:function(data){
                        alert(data?"添加成功":"添加失败");
                        //清除表单验证
                        $('#addCarIntoForm').data("bootstrapValidator").resetForm();
                        //清除表单数据
                        $('#addCarIntoForm')[0].reset();
                        //刷新后台表格数据
                        $("#CarIntoTable").bootstrapTable("refresh");
                        //关闭窗口
                        $("#addCarIntoWin").modal("hide");
                        //刷新下拉框
                        $.ajax({
                            type: 'get',
                            url: 'CarOut/queryAll2.action',
                            async:false,
                            dataType: "json",
                            success: function (data) {
                                $("#addCarIntoCarSelect").empty();
                                for(var i=0;i<data.length;i++){
                                    console.log(data[i].user)
                                    $("#addCarIntoCarSelect").append("<option value='"+data[i].id+"'>"+data[i].user.name+'  '+data[i].car.name+"</option>");
                                }
                                $("#addCarIntoCarSelect").selectpicker("refresh");
                            }
                        });
                    }
                });
            }
        });

        //添加页面 点击取消按钮
        $("#btnAddCarIntoClose").click(function () {
            //清除表单验证
            $('#addCarIntoForm').data("bootstrapValidator").resetForm();
            //清处表单数据
            $('#addCarIntoForm')[0].reset();
            //关闭模态框
            $("#addCarIntoWin").modal("hide");
        });


        function  trueCarInto(id) {
            $.post("CarInto/pz.action", {"id": id}, function (data) {
                //刷新后台表格数据
                $("#CarIntoTable").bootstrapTable("refresh");
                alert(data ? "操作成功" : "操作失败");
            }, 'json');
        }
        function  falseCarInto(id) {
            $.post("CarInto/bpz.action", {"id": id}, function (data) {
                //刷新后台表格数据
                $("#CarIntoTable").bootstrapTable("refresh");
                alert(data ? "操作成功" : "操作失败");
            }, 'json');
        }
    </script>
</body>
</html>
