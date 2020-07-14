<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>管理员界面</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css">

    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/bootstrap-responsive.min.css">

    <script type="text/javascript" src="/js/jquery-1.8.1.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>


    <%--    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>--%>
    <%--    <script type="text/javascript" src="https://code.highcharts.com/highcharts.js"></script>--%>
</head>
<body>
<!-- 上 -->
<div class="navbar">
    <div class="navbar-inner">
        <div class="container-fluid">
            <ul class="nav pull-right">
                <li id="fat-menu" class="dropdown">
                    <a href="#" id="drop3" role="button" class="dropdown-toggle" data-toggle="dropdown">
                        <c:set value="${managerInfo.account}" var="account" scope="session"/>
                        <c:set value="${managerInfo.password}" var="password" scope="session"/>
                        <i class="icon-user icon-white"></i>${sessionScope.get("account")}
                        <i class="icon-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a tabindex="-1" href="/jsp/login.jsp" onclick="return confirm('确定退出吗？')">安全退出</a></li>
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
    <a href="#route" class="nav-header" data-toggle="collapse"><i class="icon-exclamation-sign"></i>景点管理</a>
    <ul id="route" class="nav nav-list ">
        <li><a href="/hello/queryRouteByPageServlet/1">旅游路线管理</a></li>

        <li><a href="/hello/querySightByPageServlet/1">旅游景点管理</a></li>


    </ul>
    <a href="#accounts-menu" class="nav-header" data-toggle="collapse"><i class="icon-exclamation-sign"></i>车辆管理</a>
    <ul id="accounts-menu" class="nav nav-list collapse">
        <li><a href="/hello/queryVehicleByPageServlet/1">车辆信息查询</a></li>
        <li><a href="/hello/queryPassengerByPageServlet2/1">车辆调度</a></li>

    </ul>
    <a href="#error-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-exclamation-sign"></i>导游管理</a>
    <ul id="error-menu" class="nav nav-list collapse">
        <li><a href="/hello/queryGuideByPageServlet/1">导游信息查询</a></li>
        <%--        <li><a href="/jsp/addGuide.jsp">导游添加管理</a></li>--%>
        <li><a href="/hello/returnMainPage">导游信息统计</a></li>
        <li><a href="/hello/distrubutionGuideShowServlet/1">导游分配管理</a></li>
    </ul>

    <a href="#tourist-menu" class="nav-header" data-toggle="collapse"><i class="icon-exclamation-sign"></i>游客管理</a>
    <ul id="tourist-menu" class="nav nav-list collapse">
        <li><a href="/hello/queryPassengerByPageServlet/1">游客信息</a></li>

    </ul>
    <a href="#legal-menu" class="nav-header" data-toggle="collapse"><i class="icon-exclamation-sign"></i>系统页面</a>
    <ul id="legal-menu" class="nav nav-list collapse">
        <li><a href="/jsp/login.jsp">登录页面</a></li>
<%--                <li><a href="/jsp/register.jsp">注册页面</a></li>--%>
<%--        <li><a href="updatepaasword.html">密码修改</a></li>--%>
    </ul>
<%----%>
</div>
<!-- 右 -->
<div class="content">
    <!-- header -->
    <div class="header">

        <h1 class="page-title">欢迎${account}的到来</h1>
    </div>
    <!-- highchat show -->
    <%--    <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>--%>


</div>
</body>
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<%--<script src="/js/jquery-1.8.1.min.js"></script>--%>
<%--<script src="/js/bootstrap.min.js"></script>--%>

<script src="/js/LAB.min.js"></script>
<%--<script>--%>
<%--    $LAB.script("/js/jquery-1.8.1.min.js")--%>
<%--        .script("/js/bootstrap.min.js")--%>
<%--        .wait()--%>
<%--</script>--%>
</html>