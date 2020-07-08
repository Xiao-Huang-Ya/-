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
            <a class="brand" href="index.html"><span class="first">旅游管理界面</span></a>
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
        <li><a href="/hello/querySightByPageServlet/1">旅游景点区管理</a></li>

    </ul>
    <a href="#accounts-menu" class="nav-header" data-toggle="collapse"><i class="icon-exclamation-sign"></i>车辆管理</a>
    <ul id="accounts-menu" class="nav nav-list collapse ">
        <li><a href="crud.jsp">车辆信息查询</a></li>
        <li><a href="crud.jsp">车辆添加</a></li>
        <li><a href="crud.jsp">车辆删除</a></li>
    </ul>
    <a href="#error-menu" class="nav-header collapsed" data-toggle="collapse"><i
            class="icon-exclamation-sign"></i>导游管理</a>
    <ul id="error-menu" class="nav nav-list collapse ">
        <li><a href="/hello/querySightByPageServlet/1">导游信息查询</a></li>
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
        <h1 class="page-title">旅游景区管理</h1>
    </div>

    <div class="well">
        <!-- search button -->
        <form class="form-search" action="/hello/addSightServlet" method="post" name="form">
            <div class="row-fluid" style="text-align: left;">
                <div class="pull-left span4 unstyled">
                    <p> 景点名称：<input class="input-medium" id="sname" name="sname" type="text"></p>
                    <p> 景点位置：<input class="input-medium" id="location" name="location" type="text"></p>
                </div>
            </div>
            <input class="btn btn-primary" type="submit" value="新增"/>
        </form>
    </div>
    <div class="well">
        <!-- table -->
        <table class="table table-hover table-striped">
            <%--        <table class="table table-bordered table-hover table-condensed">--%>
            <thead>
            <tr>
                <th>景点名称</th>
                <th>景点位置</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="list" items="${tourPage.list}">
            <tr>
                <td>${list.sname}</td>
                <td>${list.location}</td>

                <td>
<%--                    <a href="/hello/updateReturnRouteServlet/${list.sname}"><i class="icon-pencil"></i></a>--%>
                    <a href="/hello/deleteSightServlet/${list.sname}" role="button" data-toggle="modal"
                       onclick="confirm('确定要删除吗？');"><i class="icon-remove"></i></a>

                </td>
            </tr>
            </c:forEach>

        </table>
        <!-- 分页显示模块 -->
        <div class="pagination">
            <ul>

                <c:choose>
                    <c:when test="${tourPage.totalCount <= tourPage.pageSize}">
                        <li><a href="/hello/querySightByPageServlet/1">首页</a></li>
                        <li><a href="/hello/querySightByPageServlet/${tourPage.totalPage}">尾页</a></li>
                    </c:when>
                    <c:when test="${tourPage.currentPage == 1}">
                        <li class="disabled"><a>首页</a></li>
                        <li><a href="/hello/querySightByPageServlet/${tourPage.currentPage+1}">下页</a></li>
                        <li><a href="/hello/querySightByPageServlet/${tourPage.totalPage}">尾页</a></li>

                    </c:when>
                    <c:when test="${tourPage.currentPage == tourPage.totalPage}">
                        <li><a href="/hello/querySightByPageServlet/1">首页</a>
                        <li><a href="/hello/querySightByPageServlet/${tourPage.currentPage-1}">上页</a></li>
                        <li class="disabled"><a>尾页</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="/hello/querySightByPageServlet/1">首页</a></li>
                        <li><a href="/hello/querySightByPageServlet/${tourPage.currentPage-1}">上页</a></li>
                        <li><a href="/hello/querySightByPageServlet/${tourPage.currentPage+1}">下页</a></li>
                        <li><a href="/hello/querySightByPageServlet/${tourPage.totalPage}">尾页</a></li>

                    </c:otherwise>
                </c:choose>

            </ul>
        </div>
    </div>
    <!-- delete showmodaldialog -->
    <div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="myModalLabel">Delete Confirmation</h3>
        </div>
        <div class="modal-body">
            <p class="error-text"><i class="icon-warning-sign modal-icon"></i>Are you sure you want to delete this data?
            </p>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
            <button class="btn btn-danger" data-dismiss="modal">Delete</button>
        </div>
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
<script src="/js/jquery-1.8.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>


<script>
    <c:if test="${flag == 'true'}">
    alert("操作成功");
    </c:if>

    <c:if test="${flag == 'false'}">
    alert("操作失败");
    </c:if>

</script>

</html>