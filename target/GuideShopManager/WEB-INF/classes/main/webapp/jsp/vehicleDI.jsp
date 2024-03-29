<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Bootstrap Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" type="text/css" href="/css/main.css">
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/bootstrap-responsive.min.css">
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://code.highcharts.com/highcharts.js"></script>
</head>
<body>
<!-- 上 -->
<div class="navbar">
    <div class="navbar-inner">
        <div class="container-fluid">
            <ul class="nav pull-right">
                <li id="fat-menu" class="dropdown">
                    <a href="#" id="drop3" role="button" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="icon-user icon-white"></i> ${sessionScope.get("account")}
                        <i class="icon-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a tabindex="-1" href="/jsp/login.jsp" onclick="return confirm('您确定退出吗？');">安全退出</a></li>
                    </ul>
                </li>
            </ul>
            <a class="brand" href="/jsp/index.jsp"><span class="first">旅游管理界面</span></a>
            <ul class="nav">
                <li class="active"><a href="/jsp/index.jsp">首页</a></li>
                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">旅游数据分析<strong class="caret"></strong></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="/hello/returnMainPage">导游信息统计</a>
                        </li>
                        <li>
                            <a href="/hello/vehicleDIServlet">车辆信息统计</a>
                        </li>
                        <li>
                            <a href="/hello/sightDIServlet">旅游景点信息统计</a>
                        </li>

                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
<!-- 左 -->
<div class="sidebar-nav">
    <a href="#dashboard-menu" class="nav-header" data-toggle="collapse"><i class="icon-exclamation-sign"></i>景点管理</a>
    <ul id="dashboard-menu" class="nav nav-list collapse">
        <li><a href="/hello/queryRouteByPageServlet/1">旅游路线管理</a></li>
        <li><a href="/hello/querySightByPageServlet/1">旅游景区管理</a></li>

    </ul>
    <a href="#accounts-menu" class="nav-header" data-toggle="collapse"><i class="icon-exclamation-sign"></i>车辆管理</a>
    <ul id="accounts-menu" class="nav nav-list collapse">
        <li><a href="/hello/queryVehicleByPageServlet/1">车辆信息查询</a></li>
        <li><a href="/hello/queryPassengerByPageServlet2/1">车辆调度</a></li>
        <%--        <li><a href="crud.jsp">车辆删除</a></li>--%>
    </ul>
    <a href="#A" class="nav-header" data-toggle="collapse"><i class="icon-exclamation-sign"></i>导游管理</a>
    <ul id="#A" class="nav nav-list collapse in">
        <li><a href="/hello/queryGuideByPageServlet/1">导游信息查询</a></li>
        <li><a href="/hello/distrubutionGuideShowServlet/1">导游分配</a></li>
        <li><a href="/hello/returnMainPage">导游信息统计</a></li>
    </ul>

    <a href="#tourist-menu" class="nav-header" data-toggle="collapse"><i class="icon-exclamation-sign"></i>游客管理</a>
    <ul id="tourist-menu" class="nav nav-list collapse">
        <li><a href="/hello/queryPassengerByPageServlet/1">游客信息管理</a></li>
    </ul>
    <a href="#legal-menu" class="nav-header" data-toggle="collapse"><i class="icon-exclamation-sign"></i>系统页面</a>
    <ul id="legal-menu" class="nav nav-list collapse">
        <li><a href="/jsp/login.jsp">登录页面</a></li>
    </ul>
</div>
<!-- 右 -->
<div class="content">
    <!-- header -->
    <div class="header">
        <h1 class="page-title">车辆信息统计</h1>
    </div>
    <!-- highchat show -->
    <%--    <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>--%>
    <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
    <script language="JavaScript">
        $(document).ready(function () {
            var chart = {
                type: 'bar'
            };
            var title = {
                text: '车辆信息统计图'
            };
            var subtitle = {
                text: '每月按30天计'
            };
            var xAxis = {
                categories: [<c:forEach items="${tourPage.list}" var="vehicle"> '${vehicle.vid}', </c:forEach>],
                // categories: ['Africa', 'America', 'Asia', 'Europe', 'Oceania'],
                title: {
                    text: null
                }
            };
            var yAxis = {
                // categories:['0','100','200','300','400','500','600','700','800'],
                min: 0,
                title: {
                    text: '金额(/元)',
                    align: 'high'
                },
                labels: {
                    overflow: 'justify'
                }
            };
            var tooltip = {
                valueSuffix: ' 元'
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

            var series = [{
                name: '工作量：（每天6小时，按月计(30天)）',
                data: [<c:forEach items="${tourPage.list}" var="vehicle"> ${vehicle.vehiclecost*30}, </c:forEach>]
            }                // , {
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

</div>
</body>
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<%--<script src="js/LAB.min.js"></script>--%>
<%--<script src="/js/jquery-1.8.1.min.js"></script>--%>
<%--<script src="/js/bootstrap.min.js"></script>--%>

<script src="/js/LAB.min.js"></script>
<script>
    $LAB.script("/js/jquery-1.8.1.min.js")
        .script("/js/bootstrap.min.js")
        .wait()
    // .script("/js/highcharts.js")//for highchar
    // .script("js/exporting.js")//for highchar
    // .wait()
    // .script("/js/draw.js")
</script>

</html>

