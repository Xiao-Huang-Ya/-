<%--<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>--%>
<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="utf-8">--%>
<%--    <title>用户界面</title>--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <meta name="description" content="">--%>
<%--    <meta name="author" content="">--%>
<%--    <link rel="stylesheet" type="text/css" href="/css/main.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="/css/bootstrap-responsive.min.css">--%>
<%--</head>--%>
<%--<body>--%>
<%--<!-- 上 -->--%>
<%--<div class="navbar">--%>
<%--    <div class="navbar-inner">--%>
<%--        <div class="container-fluid">--%>
<%--            <ul class="nav pull-right">--%>
<%--                <li id="fat-menu" class="dropdown">--%>
<%--                    <a href="#" id="drop3" role="button" class="dropdown-toggle" data-toggle="dropdown">--%>
<%--                        <i class="icon-user icon-white"></i> Admin--%>
<%--                        <i class="icon-caret-down"></i>--%>
<%--                    </a>--%>
<%--                    <ul class="dropdown-menu">--%>

<%--                        <li><a tabindex="-1" href="/jsp/login.jsp" onclick="return confirm('您确定退出吗？');">安全退出</a></li>--%>
<%--                    </ul>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--            <a class="brand" href="/jsp/index.jsp"><span class="first">旅游管理</span></a>--%>
<%--            <ul class="nav">--%>
<%--                <li class="active"><a href="#">首页</a></li>--%>
<%--                <li class="dropdown">--%>
<%--                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">旅游数据分析<strong class="caret"></strong></a>--%>
<%--                    <ul class="dropdown-menu">--%>
<%--                        <li>--%>
<%--                            <a href="/hello/returnMainPage">导游信息统计</a>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <a href="/hello/vehicleDIServlet">车辆信息统计</a>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <a href="/hello/sightDIServlet">旅游景点信息统计</a>--%>
<%--                        </li>--%>

<%--                    </ul>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<!-- 左 -->--%>
<%--<div class="sidebar-nav">--%>
<%--    <a href="#dashboard-menu" class="nav-header" data-toggle="collapse"><i class="icon-exclamation-sign"></i>景点管理</a>--%>
<%--    <ul id="dashboard-menu" class="nav nav-list collapse in">--%>
<%--        <li><a href="/hello/queryRouteByPageServlet/1">旅游路线管理</a></li>--%>
<%--        <li><a href="/hello/querySightByPageServlet/1">旅游景区管理</a></li>--%>

<%--    </ul>--%>
<%--    <a href="#accounts-menu" class="nav-header" data-toggle="collapse"><i class="icon-exclamation-sign"></i>车辆管理</a>--%>
<%--    <ul id="accounts-menu" class="nav nav-list collapse">--%>
<%--        <li><a href="/hello/queryVehicleByPageServlet/1">车辆信息查询</a></li>--%>
<%--        <li><a href="/hello/queryPassengerByPageServlet2/1">车辆调度</a></li>--%>
<%--    </ul>--%>
<%--    <a href="#guide" class="nav-header" data-toggle="collapse"><i--%>
<%--            class="icon-exclamation-sign"></i>导游管理</a>--%>
<%--    <ul id="guide" class="nav nav-list collapse">--%>
<%--        <li><a href="/hello/queryGuideByPageServlet/1">导游信息查询</a></li>--%>
<%--        <li><a href="/hello/distrubutionGuideShowServlet/1">导游分配</a></li>--%>
<%--        <li><a href="/hello/returnMainPage">导游信息统计</a></li>--%>
<%--    </ul>--%>
<%--    <a href="#tourist-menu" class="nav-header" data-toggle="collapse"><i class="icon-exclamation-sign"></i>游客管理</a>--%>
<%--    <ul id="tourist-menu" class="nav nav-list collapse">--%>
<%--        <li><a href="/hello/queryPassengerByPageServlet/1">游客信息</a></li>--%>

<%--    </ul>--%>
<%--    <a href="#legal-menu" class="nav-header" data-toggle="collapse"><i class="icon-exclamation-sign"></i>系统页面</a>--%>
<%--    <ul id="legal-menu" class="nav nav-list collapse">--%>
<%--        <li><a href="login.html">登录页面</a></li>--%>
<%--        <li><a href="register.html">注册页面</a></li>--%>
<%--        <li><a href="updatepaasword.html">密码修改</a></li>--%>
<%--    </ul>--%>

<%--</div>--%>
<%--<!-- 右 -->--%>
<%--<div class="content">--%>
<%--    <div class="header">--%>
<%--        <h1 class="page-title">添加导游</h1>--%>
<%--    </div>--%>

<%--    <div class="well">--%>
<%--        <!-- edit form -->--%>
<%--        <form id="tab" action="/hello/updateRouteByRidServlet" method="post">--%>
<%--            <label>路线编号：</label>--%>
<%--            <input type="text" id="rid" name="rid" class="input-xlarge" value="${upRoute.rid}" readonly="readonly">--%>
<%--            <label>路线名称：</label>--%>
<%--            <input type="text" name="name" id="name" value="${upRoute.name}" class="input-xlarge">--%>
<%--            <label>路线终点</label>--%>

<%--            <input type="text" name="endPoint" id="endPoint" value="${upRoute.endPoint}" class="input-xlarge">--%>


<%--            <label>景点名称：</label>--%>
<%--            <input type="text" name="sight" id="sight" value="${upRoute.sight}" class="input-xlarge">--%>
<%--            <label>景点数量</label>--%>
<%--            <input type="text" name="number" id="number" value="${upRoute.number}" class="input-xlarge">--%>


<%--            <br/><input type="submit" class="btn btn-primary" value="修改">--%>
<%--        </form>--%>
<%--        &lt;%&ndash;        <button class="btn btn-primary" type="submit">添加</button>&ndash;%&gt;--%>
<%--    </div>--%>
<%--    <!-- footer -->--%>
<%--    <footer>--%>
<%--        <hr>--%>
<%--        <p>© 2013 <a href="http://www.yiquwei.com" target="_blank">Admin</a></p>--%>
<%--    </footer>--%>
<%--</div>--%>
<%--</body>--%>
<%--<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->--%>
<%--<!--[if lt IE 9]>--%>
<%--<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>--%>
<%--<![endif]-->--%>
<%--<script src="/js/jquery-1.8.1.min.js"></script>--%>
<%--<script src="/js/bootstrap.min.js"></script>--%>
<%--<script>--%>
<%--    <c:if test="${upflag == true}">--%>
<%--    alert("操作成功");--%>
<%--    </c:if>--%>

<%--    <c:if test="${upflag == false}">--%>
<%--    alert("操作失败");--%>
<%--    </c:if>--%>

<%--</script>--%>
<%--</html>--%>