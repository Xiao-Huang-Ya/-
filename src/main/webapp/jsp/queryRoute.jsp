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
    <ul id="dashboard-menu" class="nav nav-list collapse in">
        <li><a href="/hello/queryRouteByPageServlet/1">旅游路线管理</a></li>
        <li><a href="/hello/querySightByPageServlet/1">旅游景区管理</a></li>

    </ul>
    <a href="#accounts-menu" class="nav-header" data-toggle="collapse"><i class="icon-exclamation-sign"></i>车辆管理</a>
    <ul id="accounts-menu" class="nav nav-list collapse ">
        <li><a href="/hello/queryVehicleByPageServlet/1">车辆信息查询</a></li>
        <li><a href="/hello/queryPassengerByPageServlet2/1">车辆调度</a></li>
    </ul>
    <a href="#guide-menu" class="nav-header collapsed" data-toggle="collapse"><i
            class="icon-exclamation-sign"></i>导游管理</a>
    <ul id="guide-menu" class="nav nav-list collapse ">
        <li><a href="/hello/queryGuideByPageServlet/1">导游信息查询</a></li>
        <li><a href="/hello/distrubutionGuideShowServlet/1">导游分配</a></li>
        <li><a href="/hello/returnMainPage">导游信息统计</a></li>
    </ul>

    <a href="#tourist-menu" class="nav-header" data-toggle="collapse"><i class="icon-exclamation-sign"></i>游客管理</a>
    <ul id="tourist-menu" class="nav nav-list collapse">
        <li><a href="/hello/queryPassengerByPageServlet/1">游客信息</a></li>

    </ul>
    <a href="#legal-menu" class="nav-header" data-toggle="collapse"><i class="icon-exclamation-sign"></i>系统页面</a>
    <ul id="legal-menu" class="nav nav-list collapse">
        <li><a href="/jsp/login.jsp">登录页面</a></li>

    </ul>

</div>
<!-- 右 -->
<div class="content">

    <div class="header">
        <h1 class="page-title">旅游路线管理</h1>
    </div>

    <div class="center-block" style="width:350px;background-color:rgba(0,0,0,0)">
        <!-- 按钮触发模态框 -->
        <button class="btn btn-primary" data-toggle="modal" data-target="#myModal2">
            添加路线
        </button>
        <!-- 模态框（Modal） -->
        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel2">
                    添加旅游路线页面
                </h4>
            </div>
            <%--添加花朵摸框               --%>
            <div class="center-block offset1" style="width:300px;">
                <form class="form-search" action="/hello/addRouteServlet" method="post" name="form" id="form">
                    <div class="row-fluid" style="text-align: left;">
                        <div class="pull-left span4 unstyled">
                            <p> 路线编号：<input class="input-large" id="rid" name="rid" type="text"></p>
                            <p> 路线名称：<input class="input-large" id="name" name="name" type="text"></p>
                            <p> 路线终点：<input class="input-large" id="endPoint" name="endPoint" type="text"></p>
                            <p> 景点名称：<input class="input-large" id="sight" name="sight" type="text"></p>
                            <p> 景点数量：<input class="input-large" id="number" name="number" type="text"></p>

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
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->

    <div class="well">
        <!-- table -->
        <table class="table table-hover table-striped" id="table">
            <%--        <table class="table table-bordered table-hover table-condensed">--%>
            <thead>
            <tr>
                <th>路线编号</th>
                <th>路线名称</th>
                <th>路线终点</th>
                <th>路线景点</th>
                <th>景点数量</th>
                <th>调度车辆数</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="list" items="${tourPage.list}" varStatus="vs">
            <tr>
                <td>${list.rid}</td>
                <td>${list.name}</td>
                <td>${list.endPoint}</td>
                <td>${list.sight}</td>
                <td>${list.number}</td>
                <td>${list.vehicleNumber}</td>
                <td>
                    <a onclick="updateRoute(this);" id="${vs.index+1}" data-toggle="modal"
                       data-target="#updateRouteModal"><i
                            class="icon-pencil"></i></a>
                        <%--                    <a href="/hello/updateReturnRouteServlet/${list.rid}"><i class="icon-pencil"></i></a>--%>

                    <a href="/hello/deleteRouteByRidServlet/${list.rid}" role="button" data-toggle="modal"
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
                        <li><a href="/hello/queryRouteByPageServlet/1">首页</a></li>
                        <li><a href="/hello/queryRouteByPageServlet/${tourPage.totalPage}">尾页</a></li>
                    </c:when>
                    <c:when test="${tourPage.currentPage == 1}">
                        <li class="disabled"><a>首页</a></li>
                        <li><a href="/hello/queryRouteByPageServlet/${tourPage.currentPage+1}">下页</a></li>
                        <li><a href="/hello/queryRouteByPageServlet/${tourPage.totalPage}">尾页</a></li>

                    </c:when>
                    <c:when test="${tourPage.currentPage == tourPage.totalPage}">
                        <li><a href="/hello/queryRouteByPageServlet/1">首页</a>
                        <li><a href="/hello/queryRouteByPageServlet/${tourPage.currentPage-1}">上页</a></li>
                        <li class="disabled"><a>尾页</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="/hello/queryRouteByPageServlet/1">首页</a></li>
                        <li><a href="/hello/queryRouteByPageServlet/${tourPage.currentPage-1}">上页</a></li>
                        <li><a href="/hello/queryRouteByPageServlet/${tourPage.currentPage+1}">下页</a></li>
                        <li><a href="/hello/queryRouteByPageServlet/${tourPage.totalPage}">尾页</a></li>

                    </c:otherwise>
                </c:choose>

            </ul>
        </div>
    </div>
    <%--  更新路线模态框--%>

    <div class="well">
        <%--        更新框容器--%>
        <div class="center-block" style="width:350px;background-color:rgba(0,0,0,0)">

            <!-- 模态框（Modal） -->
            <div class="modal fade" id="updateRouteModal" tabindex="-1" role="dialog"
                 aria-labelledby="myAddGuideModal"
                 aria-hidden="true">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myAddGuideModal">
                        更新导游
                    </h4>
                </div>
                <div class="center-block offset1" style="width:400px;">
                    <form id="updateForm" action="/hello/updateRouteByRidServlet" method="post">
                        <div class="row-fluid" style="text-align: left;">
                            <div class="pull-left span6 unstyled">
                                <p>路线编号：
                                    <input type="text" id="rid2" name="rid2"
                                           class="input-xlarge" value="" readonly="readonly">
                                </p>
                                <p>路线名称：
                                    <input type="text" name="name2" id="name2" placeholder="请输入路线名称"
                                           class="input-xlarge" value="">
                                </p>
                                <p>路线终点：
                                    <input type="text" name="endPoint2" id="enPoint2" placeholder="请输入路线终点"
                                           class="input-xlarge" value="">
                                </p>

                                <p>景点名称：
                                    <input type="text" name="sight2" id="sight2" placeholder="请输入景点名称"
                                           class="input-xlarge">
                                </p>
                                <p>景点数量：
                                    <input type="text" name="number2" id="number2" placeholder="请输入景点数量"
                                           class="input-xlarge">
                                </p>

                            </div>
                        </div>
                        <div class="center-block " style="background-color:rgba(0,0,0,0)">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消
                            </button>
                            <button type="submit" class="btn btn-primary" id="updateBtn">
                                更新
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

    window.onload = function () {

        document.getElementById("form").onsubmit = function () {
            return checkRid() && checkName() && checkEndPoint() && checkSight() && checkNumber();
        }

        function checkRid() {
            //获取用户名对象
            var rid = document.getElementById("rid").value;
            // 获取spanname
            // 定义正则表达式
            var reg = /^[A-Za-z0-9]+$/;
            var flag = reg.test(rid);
            if (flag == false) {
                alert("路线编号非法！！！");
            }

            return flag;
        }

        //检验总价：个位~十万位
        function checkName() {
            var name = document.getElementById("name").value;
            var reg = /^[\u4e00-\u9fa5]{1,30}$/;

            var flag = reg.test(name);
            if (flag == false) {
                alert("路线名称（汉字）非法！！！");
            }
            return flag;
        }

        //检验价格：价格小数点前6位，小数点后3位
        function checkEndPoint() {
            //获取用户名对象
            var price = document.getElementById("endPoint").value;

            var reg = /^[\u4e00-\u9fa5]{1,30}$/;
            var flag = reg.test(price);

            if (flag == false) {
                alert("路线终点（汉字）非法！！！");
            }
            return flag;
        }

        //检验顾客名：汉字
        function checkSight() {
            var consignee = document.getElementById("sight").value;
            var reg = /^([\u4e00-\u9fa5]|[-_.]){1,30}$/;
            var flag = reg.test(consignee);
            if (flag == false) {
                alert("景点（汉字或_）非法！！！");
            }
            return flag;
        }

        //检验电话号码
        function checkNumber() {
            var telephone = document.getElementById("number").value;
            var reg = /^[1-9]{1,3}$/;
            var flag = reg.test(telephone);
            if (flag == false) {
                alert("景点数量非法！！！");
            }
            return flag;
        }
    }
</script>

<script>
    ${flag == 'true'}
    <c:if test="${flag == 'true'}">
    alert("操作成功");
    </c:if>
    <c:if test="${flag == 'false'}">
    alert("操作失败");
    </c:if>
</script>
<script>
    function find() {

        document.form.action = "/hello/queryRouteByObjServlet";
        document.form.submit();

    }

    function add() {
        document.form.action = "/hello/addRouteServlet";
        document.form.submit();
    }

</script>

<script>
    function updateRoute(obj) {
        var id = $(obj).attr("id"); //动态获取每一次循环的 id
        var rid2 = document.getElementById("table").rows[id].cells[0].innerText;
        var name2 = document.getElementById("table").rows[id].cells[1].innerText;
        var endPoint2 = document.getElementById("table").rows[id].cells[2].innerText;
        var sight2 = document.getElementById("table").rows[id].cells[3].innerText;
        var number2 = document.getElementById("table").rows[id].cells[4].innerText;


        $('#rid2').val(rid2);
        $('#name2').val(name2);
        $('#enPoint2').val(endPoint2);
        $('#sight2').val(sight2);
        $('#number2').val(number2);


    }
</script>

</html>