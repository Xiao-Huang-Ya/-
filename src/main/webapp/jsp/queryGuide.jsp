<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>管理员界面</title>
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
    <ul id="accounts-menu" class="nav nav-list collapse ">
        <li><a href="/hello/queryVehicleByPageServlet/1">车辆信息查询</a></li>
        <li><a href="/hello/queryPassengerByPageServlet2/1">车辆调度</a></li>

    </ul>
    <a href="#guide-menu" class="nav-header " data-toggle="collapse"><i
            class="icon-exclamation-sign"></i>导游管理</a>
    <ul id="guide-menu" class="nav nav-list collapse in">
        <li><a href="/hello/queryGuideByPageServlet/1">导游信息查询</a></li>
        <li><a href="/hello/distrubutionGuideShowServlet/1">导游分配</a></li>
        <li><a href="/hello/returnMainPage">导游信息统计</a></li>
    </ul>

    <a href="#tourist-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-exclamation-sign"></i>游客管理</a>
    <ul id="tourist-menu" class="nav nav-list collapse">
        <li><a href="/hello/queryPassengerByPageServlet/1">游客信息查询</a></li>
<%--        <li><a href="#">游客登陆管理</a></li>--%>

    </ul>
    <a href="#legal-menu" class="nav-header" data-toggle="collapse"><i class="icon-exclamation-sign"></i>系统页面</a>
    <ul id="legal-menu" class="nav nav-list collapse">
        <li><a href="/jsp/login.jsp">登录页面</a></li>

    </ul>
</div>
<!-- 右 -->
<div class="content">
    <div class="header">
        <h1 class="page-title">导游管理界面</h1>
    </div>
    <%--添加导游模块--%>
    <div class="well">
        <%--        添加模态框容器--%>
        <div class="center-block" style="width:350px;background-color:rgba(0,0,0,0)">
            <button class="btn btn-primary" data-toggle="modal" data-target="#myAddGuideModal">
                添加导游
            </button>
            <!-- 模态框（Modal） -->
            <div class="modal fade" id="myAddGuideModal" tabindex="-1" role="dialog" aria-labelledby="myAddGuideModal"
                 aria-hidden="true">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel2">
                        添加导游
                    </h4>
                </div>
                <div class="center-block offset1" style="width:400px;">
                    <form id="tab" action="/hello/addGuideServlet" method="post">
                        <div class="row-fluid" style="text-align: left;">
                            <div class="pull-left span6 unstyled">
                                <p>导游编号：
                                    <input type="text" id="id" name="id" placeholder="请输入导游编号" class="input-xlarge">
                                </p>
                                <p>姓名：
                                    <input type="text" name="name" id="name" placeholder="请输入姓名" class="input-xlarge">
                                </p>
                                <p>性别：

                                    <%--            <input type="text" name="gender" id="gender" placeholder="请输入性别" class="input-xlarge">--%>
                                    <input id="gender" type="radio" name="gender" value="男" class="input-xlarge">男
                                    <input id="gender" type="radio" name="gender" value="女" class="input-xlarge">女


                                </p>
                                <p>工作量（/小时）：
                                    <input type="text" name="hours" id="hours" placeholder="请输入工作量（/小时）"
                                           class="input-xlarge">
                                </p>
                                <p>时薪：
                                    <input type="text" name="salary" id="salary" placeholder="请输入时薪"
                                           class="input-xlarge">
                                </p>
                            </div>
                        </div>
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
        <table class="table table-hover table-striped" id="table" name="table">
            <%--        <table class="table table-bordered table-hover table-condensed">--%>
            <thead>
            <tr>
                <th>导游编号</th>
                <th>名字</th>
                <th>性别</th>
                <th>工作量（/小时）</th>
                <th>时薪</th>
                <th>是否工作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="list" items="${tourPage.list}" varStatus="vs">
            <tr>
                <td>${list.id}</td>
                <td>${list.name}</td>
                <td>${list.gender}</td>
                <td>${list.hours}</td>
                <td>${list.salary}</td>
                <td>${list.state}</td>
                <td>
                    <a onclick="updateGuide(this);" id="${vs.index+1}" data-toggle="modal"
                       data-target="#updateGuideModal"><i
                            class="icon-pencil"></i></a>
                    <a href="/hello/deleteGuideServlet/${list.id}" role="button" data-toggle="modal"
                       onclick="return confirm('你确定删除吗？');"><i class="icon-remove"></i></a>

                </td>
            </tr>
            </c:forEach>

        </table>

        <%--更新导游模块--%>
        <div class="well">
            <%--        更新框容器--%>
            <div class="center-block" style="width:350px;background-color:rgba(0,0,0,0)">
                <%--                <button class="btn btn-primary" data-toggle="modal" data-target="#updateGuideModal">--%>
                <%--                    添加导游--%>
                <%--                </button>--%>
                <!-- 模态框（Modal） -->
                <div class="modal fade" id="updateGuideModal" tabindex="-1" role="dialog"
                     aria-labelledby="myAddGuideModal"
                     aria-hidden="true">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel3">
                            更新导游
                        </h4>
                    </div>
                    <div class="center-block offset1" style="width:400px;">
                        <form id="updateForm" action="/hello/updateGuideByIdServlet" method="post">
                            <div class="row-fluid" style="text-align: left;">
                                <div class="pull-left span6 unstyled">
                                    <p>导游编号：
                                        <input type="text" id="id2" name="id2" placeholder="请输入导游编号"
                                               class="input-xlarge" value="" readonly="readonly">
                                    </p>
                                    <p>姓名：
                                        <input type="text" name="name2" id="name2" placeholder="请输入姓名"
                                               class="input-xlarge" value="">
                                    </p>
                                    <p>性别：

                                        <%--            <input type="text" name="gender" id="gender" placeholder="请输入性别" class="input-xlarge">--%>
                                        <input id="gender1" type="radio" name="gender2" value="男" class="input-xlarge">男
                                        <input id="gender2" type="radio" name="gender2" value="女" class="input-xlarge">女


                                    </p>
                                    <p>工作量（/小时）：
                                        <input type="text" name="hours2" id="hours2" placeholder="请输入工作量（/小时）"
                                               class="input-xlarge">
                                    </p>
                                    <p>时薪：
                                        <input type="text" name="salary2" id="salary2" placeholder="请输入时薪"
                                               class="input-xlarge">
                                    </p>

                                </div>
                            </div>
                            <div class="center-block " style="background-color:rgba(0,0,0,0)">
                                <button type="button" class="btn btn-default" data-dismiss="modal">取消
                                </button>
                                <button type="submit" class="btn btn-primary">
                                    更新
                                </button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
        <!-- 分页显示模块 -->
        <div class="pagination">
            <ul>
                <%--                <%--%>
                <%--                    if (page2.getTotalCount() <= page2.getPageSize()) {--%>
                <%--                %>--%>
                <c:choose>
                    <c:when test="${tourPage.totalCount <= tourPage.pageSize}">
                        <li><a href="/hello/queryGuideByPageServlet/1">首页</a></li>
                        <li><a href="/hello/queryGuideByPageServlet/${tourPage.totalPage}">尾页</a></li>
                    </c:when>
                    <c:when test="${tourPage.currentPage == 1}">
                        <li class="disabled"><a>首页</a></li>
                        <li><a href="/hello/queryGuideByPageServlet/${tourPage.currentPage+1}">下页</a></li>
                        <li><a href="/hello/queryGuideByPageServlet/${tourPage.totalPage}">尾页</a></li>

                    </c:when>
                    <c:when test="${tourPage.currentPage == tourPage.totalPage}">
                        <li><a href="/hello/queryGuideByPageServlet/1">首页</a>
                        <li><a href="/hello/queryGuideByPageServlet/${tourPage.currentPage-1}">上页</a></li>
                        <li class="disabled"><a>尾页</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="/hello/queryGuideByPageServlet/1">首页</a></li>
                        <li><a href="/hello/queryGuideByPageServlet/${tourPage.currentPage-1}">上页</a></li>
                        <li><a href="/hello/queryGuideByPageServlet/${tourPage.currentPage+1}">下页</a></li>
                        <li><a href="/hello/queryGuideByPageServlet/${tourPage.totalPage}">尾页</a></li>


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
    function updateGuide(obj) {
        var id = $(obj).attr("id"); //动态获取每一次循环的 id
        var id2 = document.getElementById("table").rows[id].cells[0].innerText;
        var name2 = document.getElementById("table").rows[id].cells[1].innerText;
        var gender2 = document.getElementById("table").rows[id].cells[2].innerText;
        var hours2 = document.getElementById("table").rows[id].cells[3].innerText;
        var salary2 = document.getElementById("table").rows[id].cells[4].innerText;


        $('#id2').val(id2);
        $('#name2').val(name2);
        if (gender2 == '男') {
            document.getElementById('gender1').checked = true;
        } else {
            document.getElementById('gender2').checked = true;
        }
        $('#hours2').val(hours2);
        $('#salary2').val(salary2);

    }
</script>
<script>
    <c:if test="${flag == 'true'}">
    alert("操作成功！");
    </c:if>

    <c:if test="${updateGuideFlag == 'false'}">
    alert("更新失败！");
    </c:if>
    <c:if test="${updateGuideFlag == 'true'}">
    alert("更新成功！");
    </c:if>

    <c:if test="${flag == 'false'}">
    alert("操作失败！");
    </c:if>

</script>
</html>