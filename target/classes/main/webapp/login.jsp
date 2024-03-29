
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
        <h1 class="form-signin-heading">请登录</h1>
        <input type="text" class="input-block-level" placeholder="userName" ng-model="userName" required name="userName">
        <input type="password" class="input-block-level" placeholder="Password" ng-model="passWord" required name="passWord">
        <label class="checkbox">
            <input type="checkbox" value="remember-me"> 下次自动登录
        </label>
        <button class="btn btn-large btn-primary" type="submit" >登录</button>
        <!--<button class="btn btn-large btn-primary" type="submit" ng-disabled="myForm.$invalid" >登录</button>-->
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
        $scope.save = function() {
            //alert($scope.userName+"##"+$scope.passWord)
            alert("数据验证、保存");
            window.location.href = "index.html";
        }
    }
</script>
</html>