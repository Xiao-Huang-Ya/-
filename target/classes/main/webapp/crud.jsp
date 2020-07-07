<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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
        <li><a href="index.jsp">旅游路线管理</a></li>
        <li><a href="index.jsp">旅游景区管理</a></li>

    </ul>
    <a href="#accounts-menu" class="nav-header" data-toggle="collapse"><i class="icon-exclamation-sign"></i>车辆管理</a>
    <ul id="accounts-menu" class="nav nav-list collapse">
        <li><a href="crud.jsp">车辆信息查询</a></li>
        <li><a href="crud.jsp">车辆添加</a></li>
        <li><a href="crud.jsp">车辆删除</a></li>
    </ul>
    <a href="#error-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-exclamation-sign"></i>导游管理</a>
    <ul id="error-menu" class="nav nav-list collapse">
        <li><a href="crud.jsp">导游信息查询</a></li>
        <li><a href="crud.jsp">导游添加管理</a></li>
        <li><a href="crud.jsp">导游删除管理</a></li>
    </ul>

    <a href="#tourist-menu" class="nav-header" data-toggle="collapse"><i class="icon-exclamation-sign"></i>游客管理</a>
    <ul id="tourist-menu" class="nav nav-list collapse ">
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
        <h1 class="page-title">商品管理</h1>
    </div>

    <div class="well">
        <!-- search button -->
        <form class="form-search">
            <div class="row-fluid" style="text-align: left;">
                <div class="pull-left span4 unstyled">
                    <p> 渠道商：<input class="input-medium" type="text"></p>
                    <p> 状态：
                        <select class="span1">
                            <option value="-2">上架</option>
                            <option value="-2">下架</option>
                        </select>
                    </p>
                    <p> 标签：
                        <select class="span1">
                            <option value="-2">所有</option>
                            <option value="-2">情趣</option>
                        </select>
                    </p>
                </div>
                <div class="pull-left span4 unstyled">
                    <p> 分类：
                        <select class="span1">
                            <option value="-2">所有</option>
                            <option value="161">情爱成人</option>
                            <option value="63">赠礼</option>
                            <option value="62">保健塑身</option>
                            <option value="47">配饰</option>
                            <option value="46">鞋包</option>
                            <option value="38">新奇数码</option>
                            <option value="37">创意百货</option>
                            <option value="35">美容</option>
                            <option value="34">服饰</option>
                        </select>
                    </p>
                    <p> 商户：
                        <select class="span1">
                            <option value="-2">所有</option>
                            <option value="161">情爱成人</option>
                            <option value="63">赠礼</option>
                            <option value="62">保健塑身</option>
                            <option value="47">配饰</option>
                            <option value="46">鞋包</option>
                            <option value="38">新奇数码</option>
                            <option value="37">创意百货</option>
                            <option value="35">美容</option>
                            <option value="34">服饰</option>
                        </select>
                    </p>
                    <p> 开始时间：<input class="input-medium" type="text" onclick="WdatePicker()"></p>
                </div>
                <div class="pull-left span4 unstyled">
                    <p> 二级分类：
                        <select class="span1">
                            <option value="-2">所有</option>
                            <option value="161">情爱成人</option>
                            <option value="63">赠礼</option>
                            <option value="62">保健塑身</option>
                            <option value="47">配饰</option>
                            <option value="46">鞋包</option>
                            <option value="38">新奇数码</option>
                            <option value="37">创意百货</option>
                            <option value="35">美容</option>
                            <option value="34">服饰</option>
                        </select>
                    </p>
                    <p>
                        商品名：<input class="input-medium" type="text">
                    </p>
                    <p> 结束时间：<input class="input-medium " type="text" onclick="WdatePicker()"></p>
                </div>
            </div>
            <button type="submit" class="btn">查找</button>
            <a class="btn btn-primary" onclick="javascript:window.location.href='operation.html'">新增</a>
        </form>
    </div>
    <div class="well">
        <!-- table -->
        <table class="table table-bordered table-hover table-condensed">
            <thead>
            <tr>
                <th>编号</th>
                <th>产品</th>
                <th>交付时间</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1</td>
                <td>TB - Monthly</td>
                <td>01/04/2012</td>
                <td>Default</td>
                <td>
                    <a href="operation.html"><i class="icon-pencil"></i></a>
                    <a href="#myModal" role="button" data-toggle="modal"><i class="icon-remove"></i></a>
                </td>
            </tr>
            <tr class="success">
                <td>1</td>
                <td>TB - Monthly</td>
                <td>01/04/2012</td>
                <td>Approved</td>
                <td>
                    <a href="operation.html"><i class="icon-pencil"></i></a>
                    <a href="#myModal" role="button" data-toggle="modal"><i class="icon-remove"></i></a>
                </td>
            </tr>
            <tr class="error">
                <td>2</td>
                <td>TB - Monthly</td>
                <td>02/04/2012</td>
                <td>Declined</td>
                <td>
                    <a href="operation.html"><i class="icon-pencil"></i></a>
                    <a href="#myModal" role="button" data-toggle="modal"><i class="icon-remove"></i></a>
                </td>
            </tr>
            <tr class="warning">
                <td>3</td>
                <td>TB - Monthly</td>
                <td>03/04/2012</td>
                <td>Pending</td>
                <td>
                    <a href="operation.html"><i class="icon-pencil"></i></a>
                    <a href="#myModal" role="button" data-toggle="modal"><i class="icon-remove"></i></a>
                </td>
            </tr>
            <tr class="info">
                <td>4</td>
                <td>TB - Monthly</td>
                <td>04/04/2012</td>
                <td>Call in to confirm</td>
                <td>
                    <a href="operation.html"><i class="icon-pencil"></i></a>
                    <a href="#myModal" role="button" data-toggle="modal"><i class="icon-remove"></i></a>
                </td>
            </tr>
            </tbody>
        </table>
        <!-- pagination -->
        <div class="pagination">
            <ul>
                <li><a href="#">Prev</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">Next</a></li>
            </ul>
        </div>
    </div>
    <!-- delete showmodaldialog -->
    <div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="myModalLabel">Delete Confirmation</h3>
        </div>
        <div class="modal-body">
            <p class="error-text"><i class="icon-warning-sign modal-icon"></i>Are you sure you want to delete this data?</p>
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
<script src="js/jquery-1.8.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- 日期控件 -->
<script src="js/calendar/WdatePicker.js"></script>
</html>