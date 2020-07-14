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
    <a href="#accounts-menu" class="nav-header " data-toggle="collapse"><i class="icon-exclamation-sign"></i>车辆管理</a>
    <ul id="accounts-menu" class="nav nav-list collapse in">
        <li><a href="/hello/queryVehicleByPageServlet/1">车辆信息查询</a></li>
        <li><a href="/hello/queryPassengerByPageServlet2/1">车辆调度</a></li>

    </ul>
    <a href="#guide-menu" class="nav-header " data-toggle="collapse"><i
            class="icon-exclamation-sign"></i>导游管理</a>
    <ul id="guide-menu" class="nav nav-list collapse ">
        <li><a href="/hello/queryGuideByPageServlet/1">导游信息查询</a></li>
        <li><a href="/hello/distrubutionGuideShowServlet/1">导游分配</a></li>
        <li><a href="/hello/returnMainPage">导游信息统计</a></li>
    </ul>

    <a href="#tourist-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-exclamation-sign"></i>游客管理</a>
    <ul id="tourist-menu" class="nav nav-list collapse">
        <li><a href="/hello/queryPassengerByPageServlet/1">游客信息查询</a></li>

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
        <h1 class="page-title">调度车辆</h1>
    </div>
    <div class="well">
        <!-- table -->
        <form class="form-control" action="/hello/distributionBySingleSearchServlet" method="post">
            <p class="form-control">游客编号： <input class="form-control input-medium" name="pid" id="pid"
                                                 placeholder="请输入游客编号">

            </p>
            <button class="btn btn-primary" type="submit">分配车辆</button>

        </form>
    </div>
    <div class="well">
        <!-- table -->
        <table class="table table-hover table-striped">
            <%--        <table class="table table-bordered table-hover table-condensed">--%>
            <thead>
            <tr>


                <th>身份证</th>
                <th>姓名</th>
                <th>性别</th>
                <th>电话</th>
                <th>路线编号</th>
                <th>车辆编号</th>
                <th>导游编号</th>
                <th>旅客状态</th>

            </tr>
            </thead>
            <tbody>

            <c:forEach var="list" items="${tourPage.list}">

            <tr>
                <td>${list.pid}</td>
                <td>${list.pname}</td>
                <td>${list.pgender}</td>
                <td>${list.iphone}</td>
                <td>${list.rid}</td>
                <td>${list.vid}</td>
                <td>${list.id}</td>
                <td>${list.state}</td>

                <td>
                        <%--                    <a href="/hello/updateReturnRouteServlet/${list.sname}"><i class="icon-pencil"></i></a>--%>
                    <a href="/hello/distributionServlet/${list.pid}" class="btn btn-primary " role="button"
                       data-toggle="modal"
                       onclick="return confirm('你确定分配该游客吗？');">调度车辆</a>

                </td>
            </tr>

            </c:forEach>

        </table>
        <!-- 分页显示模块 -->
        <div class="pagination">
            <ul>


                <c:choose>
                    <c:when test="${tourPage.totalCount <= tourPage.pageSize}">
                        <li><a href="/hello/queryPassengerByPageServlet2/1">首页</a></li>
                        <li><a href="/hello/queryPassengerByPageServlet2/${tourPage.totalPage}">尾页</a></li>
                    </c:when>
                    <c:when test="${tourPage.currentPage == 1}">
                        <li class="disabled"><a>首页</a></li>
                        <li><a href="/hello/queryPassengerByPageServlet2/${tourPage.currentPage+1}">下页</a></li>
                        <li><a href="/hello/queryPassengerByPageServlet2/${tourPage.totalPage}">尾页</a></li>

                    </c:when>
                    <c:when test="${tourPage.currentPage == tourPage.totalPage}">
                        <li><a href="/hello/queryPassengerByPageServlet2/1">首页</a>
                        <li><a href="/hello/queryPassengerByPageServlet2/${tourPage.currentPage-1}">上页</a></li>
                        <li class="disabled"><a>尾页</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="/hello/queryPassengerByPageServlet2/1">首页</a></li>
                        <li><a href="/hello/queryPassengerByPageServlet2/${tourPage.currentPage-1}">上页</a></li>
                        <li><a href="/hello/queryPassengerByPageServlet2/${tourPage.currentPage+1}">下页</a></li>
                        <li><a href="/hello/queryPassengerByPageServlet2/${tourPage.totalPage}">尾页</a></li>

                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>

</div>
</body>
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<script src="/js/jquery-1.8.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script>
    <c:choose>
    <c:when test="${result=='distributionError'}">
    alert("分配信息错误！！！");
    </c:when>
    <c:when test="${result=='distributionSuccess'}">
    alert("分配信息成功！！！");
    </c:when>
    </c:choose>
</script>
</html>