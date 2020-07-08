<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
</head>
<body>
<!-- 上 -->
<div class="navbar">
    <div class="navbar-inner">
        <div class="container-fluid">
            <ul class="nav pull-right">
                <li id="fat-menu" class="dropdown">
                    <a href="#" id="drop3" role="button" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="icon-user icon-white"></i> Admin
                        <i class="icon-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a tabindex="-1" href="updatepaasword.html">修改密码</a></li>
                        <li class="divider"></li>
                        <li><a tabindex="-1" href="login.html">安全退出</a></li>
                    </ul>
                </li>
            </ul>
            <a class="brand" href="index.jsp"><span class="first">旅游管理</span></a>
            <ul class="nav">
                <li class="active"><a href="#">首页</a></li>
                <li><a href="#">运营管理</a></li>
                <li><a href="#">数据分析</a></li>
            </ul>
        </div>
    </div>
</div>
<!-- 左 -->
<div class="sidebar-nav">
    <a href="#dashboard-menu" class="nav-header" data-toggle="collapse"><i class="icon-exclamation-sign"></i>景点管理</a>
    <ul id="dashboard-menu" class="nav nav-list collapse in">
        <li><a href="/hello/queryRouteByPageServlet/1">旅游路线管理</a></li>
        <li><a href="/hello/querySightByPageServlet/1">旅游景区管理</a></li>

    </ul>
    <a href="#accounts-menu" class="nav-header" data-toggle="collapse"><i class="icon-exclamation-sign"></i>车辆管理</a>
    <ul id="accounts-menu" class="nav nav-list collapse">
        <li><a href="crud.jsp">车辆信息查询</a></li>
        <li><a href="crud.jsp">车辆添加</a></li>
        <li><a href="crud.jsp">车辆删除</a></li>
    </ul>
    <a href="/index.jsp" class="nav-header collapsed" data-toggle="collapse"><i
            class="icon-exclamation-sign"></i>导游管理</a>
    <ul id="/index.jsp" class="nav nav-list collapse in">
        <li><a href="/hello/queryGuideByPageServlet/1">导游信息查询</a></li>
        <li><a href="/jsp/addGuide.jsp">导游添加管理</a></li>
        <li><a href="/hello/returnMainPage">导游信息统计</a></li>
    </ul>
    <a href="#tourist-menu" class="nav-header" data-toggle="collapse"><i class="icon-exclamation-sign"></i>游客管理</a>
    <ul id="tourist-menu" class="nav nav-list collapse">
        <li><a href="index.jsp">游客信息管理</a></li>
        <li><a href="index.jsp">游客登陆管理</a></li>

    </ul>
    <a href="#legal-menu" class="nav-header" data-toggle="collapse"><i class="icon-exclamation-sign"></i>系统页面</a>
    <ul id="legal-menu" class="nav nav-list collapse">
        <li><a href="login.html">登录页面</a></li>
        <li><a href="register.html">注册页面</a></li>
        <li><a href="updatepaasword.html">密码修改</a></li>
    </ul>
    <a href="http://yiquwei.com/" target="_blank" class="nav-header"><i class="icon-exclamation-sign"></i>关于</a>
</div>
<!-- 右 -->
<div class="content">
    <div class="header">
        <h1 class="page-title">添加导游</h1>
    </div>

    <div class="well">
        <!-- edit form -->
        <form id="tab" action="/hello/addGuideServlet" method="post">
            <label>导游编号：</label>
            <input type="text" id="id2" name="id2" placeholder="请输入导游编号" class="input-xlarge">
            <label>姓名：</label>
            <input type="text" name="name" id="name" placeholder="请输入姓名" class="input-xlarge">
            <label>性别：</label>

            <%--            <input type="text" name="gender" id="gender" placeholder="请输入性别" class="input-xlarge">--%>
            <input id="gender" type="radio" name="gender" value="男" class="input-xlarge">男
            <input id="gender" type="radio" name="gender" value="女" class="input-xlarge">女


            <label>工作量（/小时）：</label>
            <input type="text" name="hours" id="hours" placeholder="请输入工作量（/小时）" class="input-xlarge">
            <label>时薪：</label>
            <input type="text" name="salary" id="salary" placeholder="请输入时薪" class="input-xlarge">


            <br/><input type="submit" class="btn btn-primary" value="添加">
        </form>
        <%--        <button class="btn btn-primary" type="submit">添加</button>--%>
    </div>
    <!-- footer -->
    <footer>
        <hr>
        <p>© 2013 <a href="http://www.yiquwei.com" target="_blank">Admin</a></p>
    </footer>
</div>
</body>
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<script src="js/jquery-1.8.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- 日期控件 -->
<script src="js/calendar/WdatePicker.js"></script>
<script>
    <c:if test="${flag == 'true'}">
    alert("操作成功");
    </c:if>

    <c:if test="${flag == 'false'}">
    alert("操作失败");
    </c:if>

</script>
</html>