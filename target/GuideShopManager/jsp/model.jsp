<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Highcharts </title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://code.highcharts.com/highcharts.js"></script>
</head>
<body>
<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
<script language="JavaScript">
    $(document).ready(function() {
        var chart = {
            type: 'bar'
        };
        var title = {
            text: '导游的月工作量，月提成金额统计图'
        };
        var subtitle = {
            text: '月提成率：总工资的5%；每月按30天计'
        };
        var xAxis = {
            categories:[<c:forEach items="${tourPage.list}" var="guide"> '${guide.name}',</c:forEach>],
            // categories: ['Africa', 'America', 'Asia', 'Europe', 'Oceania'],
            title: {
                text: null
            }
        };
        var yAxis = {
            // categories:['0','100','200','300','400','500','600','700','800'],
            min: 0,
            title: {
                text: 'Population (millions)',
                align: 'high'
            },
            labels: {
                overflow: 'justify'
            }
        };
        var tooltip = {
            valueSuffix: ' millions'
        };
        var plotOptions = {
            bar: {
                dataLabels: {
                    enabled: true
                }
            }
        };
        var legend = {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'top',
            x: -40,
            y: 100,
            floating: true,
            borderWidth: 1,
            backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
            shadow: true
        };
        var credits = {
            enabled: false
        };

        var series= [{
            name: '工作量：（小时，按月计(30天)）',
            data: [<c:forEach items="${tourPage.list}" var="guide"> ${guide.hours*28},</c:forEach>]
        }, {
            name: '销售提成：（元，按月计5%）',
            data: [<c:forEach items="${tourPage.list}" var="guide"> ${guide.salary*guide.hours*28*0.05},</c:forEach>]
        }
            // , {
            //     name: 'Year 2008',
            //     data: [973, 914, 4054, 732, 34]
            // }
        ];

        var json = {};
        json.chart = chart;
        json.title = title;
        json.subtitle = subtitle;
        json.tooltip = tooltip;
        json.xAxis = xAxis;
        json.yAxis = yAxis;
        json.series = series;
        json.plotOptions = plotOptions;
        json.legend = legend;
        json.credits = credits;
        $('#container').highcharts(json);

    });
</script>
</body>
</html>
