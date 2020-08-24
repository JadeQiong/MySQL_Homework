<%--
  Created by IntelliJ IDEA.
  User: 87179
  Date: 2020/6/24
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="domain.*" %>
<%@ page import="Service.*" %>
<%@ page import="Service.IMPL.CustomerServiceImpl" %>
<%@ page import="dao.IMPL.*" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset='utf-8'>
    <title>农民网（nongmin.com）</title>
</head>

<script language="JavaScript">
    function change_to_edit() {
        document.getElementById("edit_info").style.display="block";
        document.getElementById("display_info").style.display="none";
    }
    function change_to_display(){
        document.getElementById("edit_info").style.display="none";
        document.getElementById("display_info").style.display="block";
    }
    function PayisValid(form) {
        if (form.pay.value == "") {
            alert("充值金额不能为空噢");
            return false;
        }
        alert("充值成功！请刷新查看")
        return true;
    };
    function ChangeisValid(form) {
        if (form.name.value == "") {
            alert("用户名不能为空噢");
            return false;
        }
        if(form.pwd1.value == ""){
            alert("密码不能为空噢")
            return false;
        }
        if(form.pwd1.value != form.pwd2.value){
            alert("两次密码不同")
            return false;
        }
        alert("修改成功！")
        return true;
    };
</script>

<link rel="stylesheet" href="AllSetting.css"  type="text/css">

<%

%>

<body background="./img/index.jpg"
      style="background-repeat:no-repeat; background-size:100% 100%;background-attachment: fixed">

<ul>
    <li><a href="poultry.jsp" class="fi" >家禽</a></li>
    <li><a href ="aquatic.jsp" class="fi">水产</a></li>
    <li><a href ="vegetables.jsp" class="fi">蔬菜</a></li>
    <li><a href ="fruit.jsp" class="fi">水果</a></li>
    <%
        request.setCharacterEncoding("utf-8");
        System.out.print("Attention plz...");

        String cur_userID = "";
        String cur_role="-1";


        if(request.getSession().getAttribute("userID")!=null && request.getSession().getAttribute("cur_role")!=null) {
            cur_userID = request.getSession().getAttribute("userID").toString();
            cur_role = request.getSession().getAttribute("cur_role").toString();
            System.out.println(cur_userID);
            System.out.println(cur_role);
        }

        customerdaoImpl customerdao= new customerdaoImpl();
//        customerdao.culwallet("00001",0.0);
        Customer cur_customer = customerdao.queryByUserID(cur_userID);

        if(cur_role.equals("1")){
    %>
    <li><a href ="saleraddgood.jsp" class="fi">商家服务</a></li>
        <%
            }
        else {
         %>

    <li><a href ="shopping.jsp" class="fi">购物车</a></li>
    <%}
    %>
    <li><a href ="setting.jsp" class="fi">我的</a></li>
</ul>

<h1 class = "text_big">设 置</h1>

<div class = "div1">
    <div class = "text_middle">在此修改您的注册信息，进行充值 </div>
    <br>
</div>

<hr>

<container>
    <div id = "display_info" class = "box"  style="display:block;">
        <h2>
            个人资料
        </h2>
        <center>在这里查看您的个人信息噢</center>
        <button type="button" style="color:slateblue; float: right;height: 50px; margin-right: 150px; background:transparent;border-width: 0px;outline: #F5F5F5; font-size: 16px;" onclick="change_to_edit()">修改资料</button>
        </br></br></br>

        <center>
            <table>
                <tr class="alt"><td style="width: 150px;">用户名:</td><td><% if(cur_customer!=null) out.println(cur_customer.getCustomer_name());
                else out.println("请登录");%></td></tr>
                <tr><td>用户ID :</td><td>  <% if(cur_customer!=null) out.println(cur_customer.getCustomer_ID());
                                                else out.println(" ");%></td></tr>
<%--                <tr><td>用户邮箱 :</td><td> <% if(cur_customer!=null) out.println(cur_customer.getCustomer_name());--%>
<%--                                                else out.println(" ");%></td></tr>--%>
                <%
                    //因为没有email字段，先用这个顶一顶
                %>
                <tr><td>用户邮箱 :</td><td> 123456@qq.com</td></tr>
                <tr><td>手机号 :</td><td>  <% if(cur_customer!=null) out.println(cur_customer.getPhone_number());
                                                else out.println(" ");%></td></tr>
                <tr><td>钱包余额 :</td><td>  <% if(cur_customer!=null) out.println(cur_customer.getWallet());
                                                 else out.println(" ");%></td></tr>
                <tr><td>注册日期 :</td><td> <% if(cur_customer!=null) out.println(cur_customer.getCustomer_ID());
                                                    else out.println(" ");%></td></tr>
            </table>
        </center>

        </br>



        <h2>
            钱包充值
        </h2>
        <center>钱包余额用于商城购物、充值会员等，如余额不足，将无法支付</center>
        </br>
        <button type="button" style="color:slateblue; float: right;height: 50px; margin-right: 150px; background:transparent;border-width: 0px;outline: #F5F5F5; font-size: 16px;"onclick="change()">
            对余额有疑问？
        </button>

        </br></br></br>
        <center>
            <div class = "div2">
                </br>
                <h4>请输入充值余额: </h4>
                <form action="setting.jsp" method="post" onsubmit="return PayisValid(this);">
                <input type="text" name="pay" size="30" style="height: 25px; width: 150px;"/>
                &nbsp;&nbsp;
                <input type="submit"style="width: 100px; height: 50px;" value="充值"/>
                </form>
            </div>
        </center>

    </div>

<%

    request.setCharacterEncoding("utf-8");
    String cur_pay_string = request.getParameter("pay");

    if(cur_pay_string!=null && cur_customer!=null){
        System.out.println("You want to pay " + cur_pay_string);
        double cur_pay = Double.parseDouble(cur_pay_string);
        try {
        double cur_tot = cur_pay + cur_customer.getWallet();
        if(customerdao.culwallet(cur_userID,cur_tot)>0){
//            customerdaoImpl customerdao2 = new customerdaoImpl();
//            System.out.println(customerdao2.culwallet("00001",88.0));
//
//            System.out.println(customerdao.culwallet("00001",99.0));
            System.out.println(cur_userID + " " + cur_tot);
            System.out.println("Pay success! Now you have " + cur_tot);
        }
        else{
                System.out.println("Failed");
            }
        }
        catch (Exception e){
            e.printStackTrace();
            System.out.println("OK, FINE, Pay failed.");
        }
    }
%>



    <div class = "box" id = "edit_info" style="display:none;">
        <h2>
            编辑个人信息
        </h2>
        <button type="button" style="color:slateblue; float: right;height: 50px; margin-right: 150px; background:transparent;border-width: 0px;outline: #F5F5F5; font-size: 16px;"onclick="change_to_display()">返回</button>

        </br></br></br>
        <center>

            <form action="setting.jsp" method="post" onsubmit="return ChangeisValid(this);">
            <table>
                <tr><td>用户ID :</td><td> <%if(cur_customer!=null) out.println(cur_customer.getCustomer_ID());
                                           else out.println(" ");%></td></tr>
                <tr><td>注册日期 :</td><td> <%
                    Date cur = new Date();
                    out.print(cur.toString());
                %></td></tr>

                <tr class="alt"><td style="width: 150px;">用户昵称:</td><td>
                    <input  type="text" name="name" placeholder="给自己起个好听的名字叭"  size="60" value="<% if(cur_customer!=null) out.println(cur_customer.getCustomer_name());%>" style="border: transparent; height: 25px;"/></td></tr>
                <tr><td>用户邮箱 :</td><td>
<%--                    <input type="text" name="email" size="60"style="border: transparent; height: 25px;" value="<%if(cur_customer!=null) out.println(cur_customer.getCustomer_name());%>"/></td></tr>--%>
                <input type="text" name="email" size="60"style="border: transparent; height: 25px;" value="123456@qq.com"/></td></tr>
                <tr><td>手机号 :</td><td>
                    <input type="text" name="phone" size="60"style="border: transparent; height: 25px;"placeholder="填写您的手机号" value="<%if(cur_customer!=null) out.println(cur_customer.getPhone_number());%>"/></td></tr>
                <tr><td>密码 :</td><td>
                    <input type="password" name="pwd1" size="60"style="border: transparent; height: 25px;" value="<% if(cur_customer!=null) out.println(cur_customer.getCustomer_password());%>"/></td></tr>
                <tr><td>重置密码 :</td><td>
                    <input type="password" name="pwd2" size="60"style="border: transparent; height: 25px;" value="<% if(cur_customer!=null) out.println(cur_customer.getCustomer_password());%>"/></td></tr>
                <tr><td></td><td> </td></tr>
                <tr><td></td><td> </td></tr>
            </table>
                <input type="submit" style="width: 100px; height: 50px;" value="保存"/>
            </form>

            </br>

            <!-- <button type="button" style="height: 50px; border-width: 0px; outline: #F5F5F5; font-size: 16px;" onclick="change_to_display()">保存</button> -->
        </center>

    </div>
</container>

</body>
</html>

<%
    //只实现了买家的信息修改
    String cur_username = request.getParameter("name");
   // String cur_email = request.getParameter("");
    String cur_phone = request.getParameter("phone");
    String cur_pwd = request.getParameter("pwd1");

    try{
        if(cur_customer!=null){
             if(cur_username!=null) {
              System.out.println("Cur username " + cur_username);
             cur_customer.setCustomer_name(cur_username);
             }
             if(cur_phone!=null) {
                System.out.println("Cur phone "+ cur_phone);
                 cur_customer.setPhone_number(cur_phone);
              }
            if(cur_pwd!=null) {
              System.out.println("Cur pwd "+ cur_pwd);
              cur_customer.setCustomer_password(cur_pwd);
          }
        }

        customerdaoImpl customerdaoImpl = new customerdaoImpl();
        if(cur_username!=null || cur_pwd!=null || cur_phone!=null){
            try{
                customerdaoImpl.updateCustomer(cur_customer);
                System.out.println("Change info success!");
            }
             catch (Exception e){
                 e.printStackTrace();
                  System.out.println("F**k, Change user failed");
             }
        }

    }
    catch (Exception e){
        e.printStackTrace();
        System.out.println("Change Failed...");
    }

%>