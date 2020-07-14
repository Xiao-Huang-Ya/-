<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>用户界面</title>
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
                        <i class="icon-user icon-white"></i> ${applicationScope.get("username")}
                        <i class="icon-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a tabindex="-1" data-toggle="modal"
                               data-target="#updateConsumerModal">修改密码</a></li>
                        <li class="divider"></li>
                        <li><a tabindex="-1" href="/jsp/login.jsp" onclick="return confirm('您确定退出吗？');">安全退出</a></li>
                    </ul>
                </li>
            </ul>
            <a class="brand" href="/hello/consumerLoginServlet"><span class="first">旅游主界面</span></a>

        </div>
    </div>
</div>
<!-- 左 -->
<div class="sidebar-nav">
    <a href="#route" class="nav-header" data-toggle="collapse"><i class="icon-exclamation-sign"></i>旅游景点</a>
    <ul id="route" class="nav nav-list collapse in ">
        <li>
            <a href="/hello/consumerQueryRouteServlet/${applicationScope.get("username")}/${applicationScope.get("password")}">旅游路线查询</a>
        </li>

        <li><a href="/hello/querySightByPageServlet2/1">旅游景点查询</a></li>

    </ul>

</div>
<!-- 右 -->
<div class="content">
    <!-- header -->
    <div class="header">
        <h1 class="page-title">欢迎${applicationScope.get("username")}的到来</h1>
    </div>
    <div class="well">
        <!-- table -->
        <table class="table table-hover table-striped">
            <%--        <table class="table table-bordered table-hover table-condensed">--%>
            <thead>
            <tr>
                <th>路线编号</th>
                <th>路线名称</th>
                <th>路线终点</th>
                <th>路线景点</th>
                <th>景点数量</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="list" items="${tourPage.list}">
            <tr>
                <td>${list.rid}</td>
                <td>${list.name}</td>
                <td>${list.endPoint}</td>
                <td>${list.sight}</td>
                <td>${list.number}</td>
                <td>

                    <a type="submit" href="/hello/signUpServlet/${applicationScope.get("username")}/${list.rid}"
                       onclick="return confirm('您确定报名吗？');"
                       class="form-control">报名</a>
                    <a type="button" href="/hello/signDownServlet/${applicationScope.get("username")}/${list.rid}"
                       onclick="return confirm('您确定退订吗？');"
                       class="form-control">退订</a>
                </td>
            </tr>
            </c:forEach>

        </table>

        <!-- 分页显示模块 -->
        <div class="pagination">
            <ul>

                <c:choose>
                    <c:when test="${tourPage.totalCount <= tourPage.pageSize}">
                        <li><a href="/hello/queryRouteByPageServlet2/1">首页</a></li>
                        <li><a href="/hello/queryRouteByPageServlet2/${tourPage.totalPage}">尾页</a></li>
                    </c:when>
                    <c:when test="${tourPage.currentPage == 1}">
                        <li class="disabled"><a>首页</a></li>
                        <li><a href="/hello/queryRouteByPageServlet2/${tourPage.currentPage+1}">下页</a></li>
                        <li><a href="/hello/queryRouteByPageServlet2/${tourPage.totalPage}">尾页</a></li>

                    </c:when>
                    <c:when test="${tourPage.currentPage == tourPage.totalPage}">
                        <li><a href="/hello/queryRouteByPageServlet2/1">首页</a>
                        <li><a href="/hello/queryRouteByPageServlet2/${tourPage.currentPage-1}">上页</a></li>
                        <li class="disabled"><a>尾页</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="/hello/queryRouteByPageServlet2/1">首页</a></li>
                        <li><a href="/hello/queryRouteByPageServlet2/${tourPage.currentPage-1}">上页</a></li>
                        <li><a href="/hello/queryRouteByPageServlet2/${tourPage.currentPage+1}">下页</a></li>
                        <li><a href="/hello/queryRouteByPageServlet2/${tourPage.totalPage}">尾页</a></li>

                    </c:otherwise>
                </c:choose>

            </ul>
        </div>
    </div>
    <%--更新用户密码--%>

    <div class="well">
        <%--        更新框容器--%>
        <div class="center-block" style="width:350px;background-color:rgba(0,0,0,0)">

            <!-- 模态框（Modal） -->
            <div class="modal fade" id="updateConsumerModal" tabindex="-1" role="dialog"
                 aria-labelledby="myAddGuideModal"
                 aria-hidden="true">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel3">
                        修改密码
                    </h4>
                </div>
                <div class="center-block offset1" style="width:400px;">
                    <form id="updateForm" action="/hello/updateConsumerServlet" method="post">
                        <div class="row-fluid" style="text-align: left;">
                            <div class="pull-left span6 unstyled">
                                <p>用户名：
                                    <input type="text" id="username" name="username"
                                           class="input-medium " value="${username}" readonly="readonly">
                                </p>
                                <p>密码：
                                    <input type="text" name="password" id="password" placeholder="请输入密码"
                                           class="input-medium" value="">
                                </p>
                            </div>
                        </div>
                        <div class="center-block " style="background-color:rgba(0,0,0,0)">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消
                            </button>
                            <button type="submit" class="btn btn-primary">
                                修改
                            </button>
                        </div>
                    </form>

                </div>
            </div>
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
    <%--     校验报名操作--%><%--        <c:when test="${judge=='registerSuccess'}">--%>
    <%--        alert("欢迎您的到来！！!");--%>
    <%--        </c:when>--%>
    <c:choose>

    <c:when test="${judge=='signUpError'}">
    alert("报名失败！！!");
    </c:when>
    <c:when test="${updateConsumer=='false'}">
    alert("更新密码失败！！!");
    </c:when>
    <c:when test="${judge=='signedUp' || judge=='waitAssigned'||judge=='successAssigned'}">
    alert("您已经报名了，请选择其他操作！！!");
    </c:when>
    <c:when test="${judge=='unsubscribe'}">
    alert("正在申请退订.....");
    </c:when>
    <c:when test="${judge=='noAction'}">
    alert("请求无效！！");
    </c:when>
    <c:when test="${flag == false}">
    alert("报名失败！！！");
    </c:when>
    <c:when test="${flag==true}">
    alert("报名成功！！!");
    </c:when>
    <%--    退订判断--%>
    <c:when test="${judge=='unsubscribe2'}">
    alert("正在处理您的退订，请耐心等待....");
    </c:when>

    <c:when test="${signDownflag==true}">
    alert("退订成功！！!");
    </c:when>

    <c:when test="${signDownflag==false}">
    alert("退订失败！！!");
    </c:when>

    <c:when test="${judge=='registered'}">
    alert("请您先选择旅游路线!!!");
    </c:when>

    <c:when test="${judge=='signDownError'}">
    alert("退订失败，请等待！！！");
    </c:when>

    </c:choose>
</script>
</html>