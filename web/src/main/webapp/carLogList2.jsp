<%--
  Created by IntelliJ IDEA.
  User: weikang
  Date: 2020/10/25
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="main2" class="col-md-6" style="height:400px;"></div>
<div id="main3" class="col-md-6" style="height:400px;"></div>
<script>
    // 基于准备好的dom，初始化echarts实例
    var myChart2 = echarts.init(document.getElementById('main2'));
    var myChart3 = echarts.init(document.getElementById('main3'));
    let arrayName = [];
    let arrayValue = [];
    let arrayCount=[];
    let arrayNameValue = [];
    let arrayNameValue2 = [];
    let sumTime=0;
    let sumCount=0;
    $.ajax({
        type: 'get',
        url: 'CarLog/fenYe.action',
        async: false,
        dataType: "json",
        success: function (data) {
            $.each(data.rows, function (index) {
                arrayName[index] = this.name;
                arrayValue[index] = Math.ceil(this.time/24);
                sumTime+=Math.ceil(this.time/24);
                arrayCount[index] = this.count;
                sumCount+=this.count;
                arrayNameValue[index] = {name: this.name, value: Math.ceil(this.time/24)};
                arrayNameValue2[index] = {name: this.name, value: this.count};
            })
        }
    });
    // 指定图表的配置项和数据
    option2 = {
        title: {
            text: '出租时间',
            subtext: '总计:'+sumTime+'天',
            left: 'center'
        },
        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b} : {c} ({d}%)'
        },
        toolbox: {
            feature: {
                dataView: {show: true, readOnly: false},
                saveAsImage: {show: true}
            }
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data: arrayName
        },
        series: [
            {
                name: '车型',
                type: 'pie',
                radius: '55%',
                center: ['50%', '60%'],
                data: arrayNameValue,
                emphasis: {
                    itemStyle: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart2.setOption(option2);

    option3 = {
        title: {
            text: '出租次数',
            subtext: '总计:'+sumCount+'次',
            left: 'center'
        },
        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b} : {c} ({d}%)'
        },
        toolbox: {
            feature: {
                dataView: {show: true, readOnly: false},
                saveAsImage: {show: true}
            }
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data: arrayName
        },
        series: [
            {
                name: '车型',
                type: 'pie',
                radius: '55%',
                center: ['50%', '60%'],
                data: arrayNameValue2,
                emphasis: {
                    itemStyle: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };
    myChart3.setOption(option3);
</script>
</body>
</html>

