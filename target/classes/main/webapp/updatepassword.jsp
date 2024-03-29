<%--
  Created by IntelliJ IDEA.
  User: 小黄鸭
  Date: 2020/7/4
  Time: 21:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" ng-app>
<head>
    <meta charset="utf-8">
    <title>Bootstrap Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.min.css">
    <style type="text/css">
        body {
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>
<div class="container">
    <form name="myForm" class="form-signin" ng-submit="save()" ng-controller="loginController">
        <h1 class="form-signin-heading">密码修改</h1>
        <input type="password" class="input-block-level" placeholder="旧密码" ng-model="oldPassWord" required name="oldPassWord" ng-pattern="/^\S{6,20}$/">
        <p class="error-block" ng-show="myForm.oldPassWord.$error.pattern" style="">请输入6-20位英文字母、数字或符号</p>
        <input type="password" class="input-block-level" placeholder="新密码" ng-model="passWord" required name="passWord" ng-pattern="/^\S{6,20}$/" ng-change="checkPassword()">
        <p class="error-block" ng-show="myForm.passWord.$error.pattern" style="">请输入6-20位英文字母、数字或符号</p>
        <input type="password" class="input-block-level" placeholder="重复新密码" ng-model="repassWord" required name="repassWord" ng-pattern="/^\S{6,20}$/" ng-change="checkPassword()">
        <p class="error-block" ng-show="myForm.repassWord.$error.pattern" style="">请输入6-20位英文字母、数字或符号</p>
        <p class="error-block" ng-show="myForm.repassWord.$error.dontMatch" style="">两次密码输入不一致</p>
        <button class="btn btn-large btn-primary" type="submit" ng-disabled="!!myForm.$error.pattern || !!myForm.$error.required">提交</button>
    </form>
</div>
</body>
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<script src="js/jquery-1.8.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/angular.min.js"></script>
<script>
    angular.element(document).ready(function() {
        angular.module("loginController",[]);
    });
    function loginController ($scope) {
        // 前后密码校验
        $scope.checkPassword = function() {
            $scope.myForm.repassWord.$error.dontMatch = ($scope.passWord !== $scope.repassWord);
        }
        $scope.save = function() {
            alert("数据验证、提交");
            window.location.href = "index.html";
        }
    }
</script>
</html>