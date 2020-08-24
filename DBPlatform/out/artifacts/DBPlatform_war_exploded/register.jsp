<%--
  Created by IntelliJ IDEA.
  User: 87179
  Date: 2020/6/17
  Time: 8:38
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.panli.operation.UsersOperation" %>
<%@page import="com.panli.model.Users"%>
<%@page import="Service.*"%>
<%@page import="domain.*" %>
<%@page import="com.alibaba.druid.*" %>
<%@page import="dao.IMPL.salerdaoImpl"%>
<%@page import="java.util.ServiceConfigurationError" %>
<%@page import="Service.IMPL.SalerServiceImpl" %>
<%@page import="java.io.FileInputStream" %>
<%@page import="java.util.Properties" %>
<%@page import="Util.Jdbcutil" %>
<%@ page import="Service.IMPL.CustomerServiceImpl" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
</head>
<body>
</body>
</html>

<br>

<head>
    <meta charset='utf-8'>
    <title>农民网（nongmin.com）</title>
</head>

<link rel="stylesheet" href="AllRegister.css"  type="text/css">

<script language="JavaScript">
    function isValid(form) {
        // var scan = $("input[name='role']:checked").val();
        // alert("You choose" + scan);

        if (form.username.value == "") {
            alert("用户名不能为空噢");
            return false;
        }
        if (form.pwd1.value != form.pwd2.value) {
            alert("两次密码不一致");
            return false;
        } else if (form.pwd1.value == "") {
            alert("密码不能为空噢");
            return false;
        }
        return true;
    };
    function hideShowPsw() {
        var pwd_Img1 = document.getElementById("pwd_img1");
        var pwd_Img2 = document.getElementById("pwd_img2");
        var pwd_Input1 = document.getElementById("pwd_input1");
        var pwd_Input2 = document.getElementById("pwd_input2");
        if(pwd_Input1.type == "password"){
            pwd_Input1.type = "text";
            pwd_Img1.src="./img/view.png";
        }
        else{
            pwd_Input1.type="password";
            pwd_Img1.src="./img/view_off.png"
        }
        if(pwd_Input2.type == "password"){
            pwd_Input2.type = "text";
            pwd_Img2.src="./img/view.png";
        }
        else{
            pwd_Input2.type="password";
            pwd_Img2.src="./img/view_off.png"
        }
    }
</script>

<body background="./img/index.jpg"
      style="background-repeat:no-repeat; background-size:100% 100%;background-attachment: fixed">
<ul>
    <li><a href="poultry.jsp" class="fi" >家禽</a></li>
    <li><a href ="aquatic.jsp" class="fi">水产</a></li>
    <li><a href ="vegetables.jsp" class="fi">蔬菜</a></li>
    <li><a href ="fruit.jsp" class="fi">水果</a></li>
    <li><a href ="shopping.jsp" class="fi">购物车</a></li>
    <li><a href ="setting.jsp" class="fi">我的</a></li>
</ul>

<h1 class = "text_big">新用户注册</h1>

<div class = "div1">
    <div class = "text_middle">欢迎注册哦!</div>

    <br>

</div>


<div class="login">

    <div style="color:white; padding: 20px; font-size: 120%;">登录体验更多功能哦</div>
    <div style="color:white; padding: 5px; font-size: 110%;">用户注册表单</div><br/>
    <form action="register.jsp" method="post" onsubmit="return isValid(this);">
    <center>
        <table>
    <tr><td>&nbsp;用户名:&nbsp;&nbsp;&nbsp;&nbsp;</td><td><input type="text" name="username" size="20"/></td></tr>

    <tr><td>电子邮箱:&nbsp;&nbsp;&nbsp;&nbsp;</td><td><input type="text" name="email" size="20"/></td></tr>

    <tr><td>&nbsp;密&nbsp;码:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><input id = "pwd_input1" type="password" name="pwd1" size="20"/></td></tr>
<%--        <img id="pwd_img1"  style="width: 20px;height: 20px;" onclick="hideShowPsw()" src="./img/view_off.png">--%>

    <tr><td>密码确认:&nbsp;&nbsp;&nbsp;&nbsp;</td><td><input id = "pwd_input2" type="password" name="pwd2" size="20"/></td></tr>
<%--        <img id="pwd_img2" style="width: 20px;height: 20px;"  onclick="hideShowPsw()" src="./img/view_off.png">--%>
        <br/>
            &nbsp;&nbsp;&nbsp;您的身份: &nbsp;&nbsp;&nbsp;
    <label><input type="radio" name="role" value="buyer">买家</label> &nbsp;&nbsp;&nbsp;
    <label><input type="radio" name="role" value="saler">卖家</label>
    <br/><br/>
        </table>

        <input type="submit" value="提交注册"/>
    </center>
    </form>
    <%
    request.setCharacterEncoding("utf-8");
    String cur_name = request.getParameter("username");
    String cur_id = cur_name;
    String cur_email = request.getParameter("email");
    String cur_pass = request.getParameter("pwd1");
    String cur_role_a = request.getParameter("role");
    int cur_role = 0;
    boolean flag = false;
    System.out.println(cur_role_a);
    if(cur_role_a != null){
        if(cur_role_a.equals("saler")){
            cur_role = 1;
        }
        else cur_role = 0;
    }
    else{
        System.out.println("未加载出来");
    }
    if(cur_role_a!=null && cur_name!="") {
        System.out.println("Check info: ");
        Users cur_user = new Users(cur_id, cur_name, cur_email, cur_pass, cur_role);
        System.out.println("Your userID: " + cur_user.getUser_ID());
        System.out.println("Your username : " + cur_user.getUsername());
        System.out.println("Your useremail : " + cur_user.getUser_email());
        System.out.println("Your password:" + cur_user.getUser_pwd());
        System.out.println("Your role : " + cur_user.getUser_role());
       // UsersOperation.insertData(cur_user);
        if(cur_role == 1){
            try {
            Saler saler = new Saler(cur_name,cur_id,cur_pass);
            System.out.println("Get saler");
            SalerService salerService = new SalerServiceImpl();
            System.out.println("Get sakerIml");
            salerService.register(saler);
            System.out.println("Register Success.");
            flag = true;
            }
            catch (Exception e){
                e.printStackTrace();
                System.out.println("Add Saler failed");
            }
        }
        else{
            try {
//            public Customer(String customer_name, String customer_ID, String customer_password, String area, String phone_number, Double wallet)
                Customer customer = new Customer(cur_name, cur_id, cur_pass, "area", cur_email, 0.0);
                System.out.println("Get customer");
                CustomerService customerService = new CustomerServiceImpl();
                System.out.println("Customer service ok");
                //俺想吃粽子
                customerService.register(customer);
                flag = true;
                System.out.println("Add customer success.");
            }
            catch (Exception e){
                e.printStackTrace();
                System.out.println("F**k, Add customer failed");
            }
        }
        if(flag == false){
            out.println(" ");
            out.print("操作失败，请重试");
        }
        else{
            out.println(" ");
            out.print("操作成功，请返回首页");
        }
    }
    %>
</br>
    <center>
        <a href ="index.jsp" class="fi" style="align-self: center">一键返回首页登录</a>
    </center>
</div>

<hr>

<container>

    <div class = "box">
        Bug:等待维修中...
    </div>

</container>


</body>
</html>

