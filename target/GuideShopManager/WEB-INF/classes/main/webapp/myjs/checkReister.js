encodeURI('UTF-8');
window.onload = function judge() {
        var pid = document.getElementById('pid').value;
        var pname = document.getElementById('pname').value;
        var pgender = document.getElementById('pgender').value;
        var iphone = document.getElementById('iphone').value;
        var username = document.getElementById('username').value;
        var password = document.getElementById('password').value;
        if (pid == "" || pid == null) {
            alert("身份证号不能为空！！！");
        }
        if (pname == "" || pname == null) {
            alert("姓名不能为空！！！");
        }
        if (pgender == "" || pgender == null) {
            alert("请选择性别！！！");
        }
        if (iphone == "" || iphone == null) {
            alert("手机号不能为空！！！");
        }
        if (username == "" || username == null) {
            alert("账户名不能为空！！！");
        }
        if (password == "" || password == null) {
            alert("密码不能为空！！！");
        }

}