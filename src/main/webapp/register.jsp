<%--
  Created by IntelliJ IDEA.
  User: 小黄鸭
  Date: 2020/7/4
  Time: 21:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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
        <h1 class="form-signin-heading">注册</h1>
        <input type="text" class="input-block-level" placeholder="用户名" ng-model="userName" required name="userName" ng-pattern="/^\S{6,20}$/">
        <p class="error-block" ng-show="myForm.userName.$error.pattern" style="">请输入6-20位英文字母、数字或符号</p>
        <input type="password" class="input-block-level" placeholder="密码" ng-model="passWord" required name="passWord" ng-pattern="/^\S{6,20}$/" ng-change="checkPassword()">
        <p class="error-block" ng-show="myForm.passWord.$error.pattern" style="">请输入6-20位英文字母、数字或符号</p>
        <input type="password" class="input-block-level" placeholder="重复密码" ng-model="repassWord" required name="repassWord" ng-pattern="/^\S{6,20}$/" ng-change="checkPassword()">
        <p class="error-block" ng-show="myForm.repassWord.$error.pattern" style="">请输入6-20位英文字母、数字或符号</p>
        <p class="error-block" ng-show="myForm.repassWord.$error.dontMatch" style="">两次密码输入不一致</p>
        <input type="text" class="input-block-level" placeholder="邮箱" ng-model="email" required name="email" ng-pattern="/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/">
        <p class="error-block" ng-show="myForm.email.$error.pattern" style="">请输入正确的邮箱格式</p>
        <div id="region">
            <select id="province" class="prov input-small"></select>
            <select id="city" class="city input-small"></select>
            <select id="district" class="dist input-small" disabled="disabled" style="display: none;"></select>
        </div>
        <label class="checkbox">
            <input ng-model="agreement" type="checkbox">
            同意"服务协议"和"隐私条款"
        </label>
        <button class="btn btn-large btn-primary" type="submit" ng-disabled="!!myForm.$error.pattern || !!myForm.$error.required || hasNotAgreed()">提交</button>
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
<!-- 城市联动插件 -->
<script src="js/city_json.min.js"></script>
<script src="js/city.min.js"></script>
<script>
    angular.element(document).ready(function() {
        angular.module("loginController",[]);
    });
    function loginController ($scope) {
        //默认勾选
        $scope.agreement = true;
        //填充城市信息
        $("#region").citySelect({prov:"上海",nodata:"none"});
        // 同意条款勾选
        $scope.hasNotAgreed = function() {
            return !$scope.agreement;
        }
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