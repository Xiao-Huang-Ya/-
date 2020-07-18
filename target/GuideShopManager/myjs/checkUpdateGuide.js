encodeURI('UTF-8');
window.onload = function () {
    document.getElementById("updateGuideForm").onsubmit = function () {
        return checkId2() && checkName2() && checkHours2() && checkSalary2();
    }
    function checkId2() {
        //获取用户名对象
        var rid = document.getElementById("id2").value;
        // 获取spanname
        // 定义正则表达式
        var reg = /^[A-Za-z0-9]+$/;
        var flag = reg.test(rid);
        if (flag == false) {
            alert("导游编号非法！！！");
        }
        return flag;
    }

    //检验总价：个位~十万位
    function checkName2() {
        var name = document.getElementById("name2").value;
        var reg = /^[\u4e00-\u9fa5]{1,30}$/;
        var flag = reg.test(name);
        if (flag == false) {
            alert("导游名字非法！！！");
        }
        return flag;
    }

    //检验价格：价格小数点前6位，小数点后3位
    function checkHours2() {
        //获取用户名对象
        var price = document.getElementById("hours2").value;
        var reg = /^[0-9]{1,2}$/;
        var flag = reg.test(price);

        if (flag == false) {
            alert("日工作量（/小时）！！！");
        }
        return flag;
    }

    //检验顾客名：汉字
    function checkSalary2() {
        var consignee = document.getElementById("salary2").value;
        var reg = /^[0-9]+(.[0-9]{1,5})?$/;
        var flag = reg.test(consignee);
        if (flag == false) {
            alert("日薪资（/元）非法！！！");
        }
        return flag;
    }
}
