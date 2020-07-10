
window.onload =function() {
    document.getElementById("form").onsubmit = function () {
        return checkName()&& checkPwd();
    }
    function checkName() {
        //获取用户名对象
        var username = document.getElementById("name").value;
        // 定义正则表达式:用户名正则，4到16位（字母，数字，下划线，减号）
        var reg = /^[a-zA-Z0-9_-]{4,16}$/;
        var flag = reg.test(username);

        if (flag) {
            flag = true;
        } else {
            alert("用户名非法！！！");
            flag =false;
        }
        return flag;
    }
    function checkPwd() {
        //获取用户名对象
        var password = document.getElementById("pwd").value;

        // 定义正则表达式,必须包含字母和数字6~16位
        var reg = /^[a-zA-Z0-9_-]{4,16}$/;
        var flag = reg.test(password);

        if (flag) {
            flag = true;
        } else {
            alert("密码非法！！！");
            flag = false;
        }
        return flag;
    }



}
