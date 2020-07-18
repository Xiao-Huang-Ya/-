<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>login</title>
    <%--    <link rel="stylesheet" type="text/css" href="css/main.css">--%>
    <%--    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">--%>
    <%--    <link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.min.css">--%>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">

    <link type="text/css" rel="stylesheet" href="/css/login.css">

    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <%--    <script type="text/javascript" src="/myjs/checkReister.js"></script>--%>
    <%--    <script src="/js/myjs/checkLogin.js"></script>--%>
    <style>
        p {
            font-family: Muiicons;
            font-size: 16px;
            color: #0e90d2;
        }

    </style>
</head>
<body>
<div class="container">
    <div class="form row">
        <div class="form-horizontal col-md-offset-3" id="login_form">
            <h3 class="form-title">旅游管理系统</h3>
            <div class="col-md-9">
                <form action="" id="form" name="form" method="post">
                    <div class="form-group">

                        <select class="form-control" id="test">
                            <option value="manager">管理员</option>
                            <option value="consumer">用户</option>
                        </select>

                    </div>


                    <div class="form-group">
                        <i class="fa fa-user fa-lg"></i>
                        <input class="form-control required" type="text" placeholder="Username" id="name"
                               name="name" autofocus="autofocus"/>
                    </div>
                    <div class="form-group">
                        <i class="fa fa-lock fa-lg"></i>
                        <input class="form-control required" type="password" placeholder="Password" id="pwd"
                               name="pwd" autofocus="autofocus"/>
                    </div>

                    <div class="form-group col-md-offset-9">
                        <button type="submit" class="btn btn-primary" onclick="return login()">
                            登录
                        </button>
                        <button class="btn btn-primary" data-toggle="modal" data-target="#registerModal">
                            注册
                        </button>
                    </div>

                </form>
            </div>
        </div>
    </div>


    <%--         注册模态框    --%>
    <%--        添加模态框容器--%>
    <div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true" style="background-color:rgba(0,0,0,0);">
        <div class="modal-dialog col-md-offset-4">

            <div class="col-md-offset-1"
                 style="width:600px;text-align: center ;background-color: rgba(255,255,255,0.2)">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    更新信息
                </h4>
            </div>
            <div class="col-md-offset-1" style="width:600px;background-color: rgba(255,255,255,0.2)">
                <form action="/hello/registerServlet" method="post" id="form2" name="form2"
                      id="form2" style="width: 300px;height: 500px;" class="center-block">
                    <div class="row-fluid" style="text-align: left;">
                        <div class="col-md-offset-4 center-block span6 unstyled">

                            <p> 身份证<input class="input-medium form-control" id="pid" name="pid" type="text"
                                          placeholder="请输入身份证号">
                                <%--                                    <span id="t_pid" class="error"></span>--%>
                            </p>

                            <p> 姓名<input class="input-medium form-control" id="pname" name="pname" type="text"
                                         placeholder="请输入姓名">
                                <%--                                    <span id="t_pname" class="error"></span>--%>

                            </p>


                            <p> 性别
                                <input class="form-group" type="radio" name="pgender" value="男" checked="checked">男
                                <input class="input-medium" type="radio" name="pgender" value="女">女
                            </p>


                            <%--                              路线编号   车辆编号   导游编号    --%>
                            <p> 电话<input class="input-medium form-control" id="iphone" name="iphone" type="text"
                                         placeholder="请输入电话">

                                <%--                                    <span id="t_iphone" class="error"></span>--%>
                            </p>

                            <input class="input-medium form-control" id="rid" name="rid" type="hidden" value="">
                            <input class="input-medium form-control" id="vid" name="vid" type="hidden" value="">
                            <input class="input-medium form-control" id="id" name="id" type="hidden" value="">
                            <input class="input-medium form-control" id="state" name="state" type="hidden"
                                   value="已注册">


                            <p> 用户名<input class="input-medium form-control" id="username" name="username" type="text"
                                          placeholder="请输入用户名">
                                <%--                                <span id="t_username" class="error"></span>--%>

                            </p>
                            <p> 密码<input class="input-medium form-control" id="password" name="password" type="password"
                                         placeholder="请输入密码">

                                <%--                                <span id="t_password" class="error"></span></p>--%>
                        </div>
                    </div>
                    <%--            <input class="btn btn-primary" type="submit" value="新增"/>--%>
                    <div class="center-block " style="background-color:rgba(0,0,0,0)">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消
                        </button>
                        <button type="submit" class="btn btn-primary" name="buton">
                            注册
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        function login() {
            var end = false;
            var name = document.getElementById('name').value;
            var pwd = document.getElementById('pwd').value;
            var options = $("#test option:selected");
            var value = options.val();
            if (name == null || name == "") {
                alert("用户名不能为空！！！");
                return false;
            } else if (pwd == null || pwd == "") {
                alert("密码不能为空！！！");
                return false;
            } else if (value == "manager") {
                document.getElementById("form").action = "/hello/managerLoginServlet";
                document.getElementById("form").submit();
                return  true;
            } else if (value == "consumer") {
                document.getElementById("form").action = "/hello/consumerLoginServlet";
                document.getElementById("form").submit();
                return  true;
            } else {
                alert("登录跳转错");
                return false;
            }
        }


        <c:choose>
        <c:when test="${judge=='loginError'}">
        alert("登陆失败！！!");
        </c:when>
        <c:when test="${judge=='loginSuccess'}">
        alert("登陆成功！！!");
        </c:when>
        <c:when test="${updateConsumer=='true'}">
        alert("更新密码成功，请重新登录！！！");
        </c:when>

        <c:when test="${judge=='needRegister'}">
        alert("登录失败，请您注册！！！");
        </c:when>

        <c:when test="${judge == 'registerError'}">
        alert("注册失败,请注意填写信息");
        </c:when>
        <c:when test="${judge == 'registerSuccess'}">
        alert("注册成功，请登录！！！");
        </c:when>
        </c:choose>

    </script>
    <script>
        window.onload = function () {
            document.getElementById("form2").onsubmit = function () {
                return checkPid() && checkPname() && checkIphone() && checkUsername() && checkPassword();
            }

            function checkPid() {
                //获取用户名对象
                var rid = document.getElementById("pid").value;
                // 获取spanname
                // 定义正则表达式
                var reg = /(^\d{15}$)|(^\d{17}([0-9]|X)$)/;
                var flag = reg.test(rid);
                if (flag == false) {
                    alert("游客身份证非法！！！");
                }
                return flag;
            }

            //检验总价：个位~十万位
            function checkPname() {
                var name = document.getElementById("pname").value;
                var reg = /^[\u4e00-\u9fa5]{1,30}$/;

                var flag = reg.test(name);
                if (flag == false) {
                    alert("游客名字非法！！！");
                }
                return flag;
            }

            //检验价格：价格小数点前6位，小数点后3位
            function checkIphone() {
                //获取用户名对象
                var price = document.getElementById("iphone").value;
                var reg = /^1[3456789]\d{9,11}$/;
                var flag = reg.test(price);
                if (flag == false) {
                    alert("电话非法！！！");
                }
                return flag;
            }
            //检验顾客名：汉字
            function checkUsername() {
                var consignee = document.getElementById("username").value;
                var reg = /^[a-zA-Z0-9_-]{6,16}$/;
                var flag = reg.test(consignee);
                if (flag == false) {
                    alert("用户名（6~16位字母、数字、下划线）！！！");
                }
                return flag;
            }
            function checkPassword() {
                var consignee = document.getElementById("password").value;
                var reg = /^(\w){6,20}$/;
                var flag = reg.test(consignee);
                if (flag == false) {
                    alert("密码（6~20位字母、数字、下划线）！！！");
                }
                return flag;
            }
        }
    </script>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script src="/js/jquery-1.8.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</body>
</html>