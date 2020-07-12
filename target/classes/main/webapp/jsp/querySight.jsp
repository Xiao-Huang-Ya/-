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
                        <li><a tabindex="-1" href="/jsp/login.jsp" onclick="return confirm('您确定退出吗？');">安全退出</a></li>
                    </ul>
                </li>
            </ul>
            <a class="brand" href="/index.jsp"><span class="first">旅游管理界面</span></a>
            <ul class="nav">
                <li class="active"><a href="/index.jsp">首页</a></li>
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
    <ul id="accounts-menu" class="nav nav-list collapse ">
        <li><a href="/hello/queryVehicleByPageServlet/1">车辆信息查询</a></li>
        <li><a href="/hello/queryPassengerByPageServlet2/1">车辆调度</a></li>
    </ul>
    <a href="#error-menu" class="nav-header collapsed" data-toggle="collapse"><i
            class="icon-exclamation-sign"></i>导游管理</a>
    <ul id="error-menu" class="nav nav-list collapse ">
        <li><a href="/hello/queryGuideByPageServlet/1">导游信息查询</a></li>
        <li><a href="#">导游分配</a></li>
        <li><a href="/hello/returnMainPage">导游信息统计</a></li>
    </ul>

    <a href="#tourist-menu" class="nav-header" data-toggle="collapse"><i class="icon-exclamation-sign"></i>游客管理</a>
    <ul id="tourist-menu" class="nav nav-list collapse">
        <li><a href="/hello/queryPassengerByPageServlet/1">游客信息</a></li>

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
        <%--        添加模态框容器--%>
        <div class="center-block" style="width:350px;background-color:rgba(0,0,0,0)">
            <button class="btn btn-primary" data-toggle="modal" data-target="#myAddSightModal">
                添加景点
            </button>
            <!-- 模态框（Modal） -->
            <div class="modal fade" id="myAddSightModal" tabindex="-1" role="dialog" aria-labelledby="myAddSightModal"
                 aria-hidden="true">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel2">
                        添加旅游景点
                    </h4>
                </div>
                <div class="center-block offset1" style="width:300px;">
                    <form class="form-search" action="/hello/addSightServlet" method="post" name="form">
                        <div class="row-fluid" style="text-align: left;">
                            <div class="pull-left span4 unstyled">
                                <p> 景点名称：<input class="input-large" id="sname" name="sname" type="text"></p>
                                <p> 景点位置：<input class="input-large" id="location" name="location" type="text"></p>
                            </div>
                        </div>
                        <%--            <input class="btn btn-primary" type="submit" value="新增"/>--%>
                        <div class="center-block " style="background-color:rgba(0,0,0,0)">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消
                            </button>
                            <button type="submit" class="btn btn-primary">
                                提交
                            </button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
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
                       onclick="return confirm('你确定删除吗？');"><i class="icon-remove"></i></a>

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
    <div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="myModalLabel">Delete Confirmation</h3>
        </div>
        <div class="modal-body">
            <p class="error-text"><i class="icon-warning-sign modal-icon"></i>Are you sure you want to
                delete this data?
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