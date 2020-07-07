
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Bootstrap Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.min.css">
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
            <a class="brand" href="index.jsp"><span class="first">口袋映画</span></a>
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
    <a href="#dashboard-menu" class="nav-header" data-toggle="collapse"><i class="icon-exclamation-sign"></i>用户PV浏览</a>
    <ul id="dashboard-menu" class="nav nav-list collapse in">
        <li><a href="index.jsp">新用户PV</a></li>
        <li><a href="index.html">累计用户PV</a></li>
        <li><a href="index.html">活跃用户PV</a></li>
    </ul>
    <a href="#accounts-menu" class="nav-header" data-toggle="collapse"><i class="icon-exclamation-sign"></i>运营管理</a>
    <ul id="accounts-menu" class="nav nav-list collapse">
        <li><a href="crud.jsp">商品管理</a></li>
        <li><a href="crud.jsp">资讯管理</a></li>
        <li><a href="crud.jsp">应用管理</a></li>
    </ul>
    <a href="#error-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-exclamation-sign"></i>系统权限</a>
    <ul id="error-menu" class="nav nav-list collapse">
        <li><a href="crud.jsp">角色管理</a></li>
        <li><a href="crud.jsp">权限管理</a></li>
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
        <h1 class="page-title">新增/修改商品</h1>
    </div>

    <div class="well">
        <!-- edit form -->
        <form id="tab">
            <label>商品货号：</label>
            <input type="text" value="100001" class="input-xlarge">
            <label>商品名：</label>
            <input type="text" value="好吃的橙子" class="input-xlarge">
            <label>原价：</label>
            <input type="text" value="22.22" class="input-xlarge">
            <label>现价：</label>
            <input type="text" value="11.11" class="input-xlarge">
            <label>简介：</label>
            <textarea value="Smith" rows="3" class="input-xlarge">好棒的橙子，来自加州。
            </textarea>
            <label>分类：</label>
            <select name="DropDownTimezone" id="DropDownTimezone" class="input-xlarge">
                <option value="-12.0">服装</option>
                <option value="-11.0">水果</option>
                <option value="-10.0">数码</option>
                <option value="-9.0">情趣</option>
            </select>
        </form>
        <button class="btn btn-primary" onclick="save()">Save</button>
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
<script>
    function save(){
        alert("保存成功");
        window.location.href = "crud.html";
    }
</script>
</html>