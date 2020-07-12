encodeURI('UTF-8');

window.onload = function () {
    document.getElementById("form2").onsubmit = function () {
        return checkPid() && checkPname() &&
            checkPgender() && checkIphone()
            && checkUsername() && checkPassword()
    }
    document.getElementById("pid").onblur = checkPid;
    document.getElementById("pname").onblur = checkPname;
    document.getElementById("pgender").onblur = checkPgender;
    document.getElementById("iphone").onblur = checkIphone;
    document.getElementById("username").onblur = checkUsername;
    document.getElementById("password").onblur = checkPassword;
    var pid = document.getElementById('pid').value;
    var t_pid = document.getElementById('t_pid');
    var pname = document.getElementById('pname').value;
    var t_pname = document.getElementById('t_pname');
    var pgender = document.getElementById('pgender').value;
    var t_pgender = document.getElementById('t_pgender');
    var iphone = document.getElementById('iphone').value;
    var t_iphone = document.getElementById('t_iphone');
    var username = document.getElementById('username').value;
    var t_username = document.getElementById('t_username');
    var password = document.getElementById('password').value;
    var t_password = document.getElementById('t_password');

    function checkPid() {
        var reg = /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;
        var flag = reg.test(pid);
        if (flag)
            t_pid.innerHTML = "<img  width='35' height='25' src='/img/right.jpg'/>";
        else {
            t_pid.innerHTML = "<img  width='35' height='25' src='/img/error.jpg'/>";
        }
        return flag;
    }

    function checkPname() {
        var reg = /^([a-zA-Z0-9\u4e00-\u9fa5\·]{1,10})$/;
        var flag = reg.test(pname);

        if (flag)
            t_pname.innerHTML = "<img  width='35' height='25' src='/img/right.jpg'/>";
        else {
            t_pname.innerHTML = "<img  width='35' height='25' src='/img/error.jpg'/>";
        }
        return flag;
    }

    function checkPgender() {
        var reg = /^['男'|'女']$/;
        var flag = reg.test(pgender);

        if (flag)
            t_pgender.innerHTML = "<img  width='35' height='25' src='/img/right.jpg'/>";
        else {
            t_pgender.innerHTML = "<img  width='35' height='25' src='/img/error.jpg'/>";
        }
        return flag;

    }

    function checkIphone() {
        var reg = /^[1][3,4,5,7,8][0-9]{11}$/;

        var flag = reg.test(iphone);

        if (flag)
            t_iphone.innerHTML = "<img  width='35' height='25' src='/img/right.jpg'/>";
        else {
            t_iphone.innerHTML = "<img  width='35' height='25' src='/img/error.jpg'/>";
        }
        return flag;

    }

    function checkUsername() {
        //4~6位（字母，数字，下户线，减号）
        var reg = /^[a-zA-Z0-9_-]{4,16}$/;
        var flag = reg.test(username);

        if (flag)
            t_username.innerHTML = "<img  width='35' height='25' src='/img/right.jpg'/>";
        else {
            t_username.innerHTML = "<img  width='35' height='25' src='/img/error.jpg'/>";
        }
        return flag;
    }

    function checkPassword() {

        // 定义正则表达式,必须包含字母和数字6~16位
        var reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8}$/;
        var flag = reg.test(username);

        if (flag)
            t_password.innerHTML = "<img  width='35' height='25' src='/img/right.jpg'/>";
        else {
            t_password.innerHTML = "<img  width='35' height='25' src='/img/error.jpg'/>";
        }
        return flag;
    }

}