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
<div id="main1" class="col-md-10" style="height:400px;width: 600px;"></div>
<script>

    let arrayName = [];
    let arrayValue = [];
    let arrayNameValue = [];
    let sum=0;
    $.ajax({
        type: 'get',
        url: 'CarLog/fenYe.action',
        async: false,
        dataType: "json",
        success: function (data) {
            $.each(data.rows, function (index) {
                arrayName[index] = this.name;
                arrayValue[index] = this.sum;
                sum+=this.sum;
                arrayNameValue[index] = {name: this.name, value: this.sum};
            })
        }
    });

    option = {
        title: {
            text: '营业额',
            subtext: '总计'+sum+'元',
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
    var myChart = echarts.init(document.getElementById('main1'));
    myChart.setOption(option);
</script>
</body>
</html>
