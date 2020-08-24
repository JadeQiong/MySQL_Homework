<%--
  Created by IntelliJ IDEA.
  User: 87179
  Date: 2020/6/2
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>



<%@ page contentType="text/html;charset=UTF-8" language="java" import ="java.util.*" pageEncoding="utf-8"%>
<%
  //@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%>
<%@ page import="javax.jws.soap.SOAPBinding" %>
<%@ page import="com.panli.model.Users" %>
<%@ page import="com.panli.operation.UsersOperation" %>
<%@page import="com.alibaba.*" %>
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
<html>

<head>
  <meta charset='utf-8'>
  <title>农民网（nongmin.com）</title>
</head>
<link rel="stylesheet" href="AllIndex.css"  type="text/css">


<script language="JavaScript">
  function hideShowPsw() {
    var pwd_Img = document.getElementById("pwd_img");
    var pwd_Input = document.getElementById("pwd_input");
    if(pwd_Input.type == "password"){
      pwd_Input.type = "text";
      pwd_Img.src="./img/view.png";
    }
    else{
      pwd_Input.type="password";
      pwd_Img.src="./img/view_off.png"
    }
  };
  function isValid(form) {
    // var scan = $("input[name='role']:checked").val();
    // alert("You choose" + scan);
    if (form.username.value == "") {
      alert("用户名不能为空噢");
      return false;
    }
    if (form.pwd.value == "") {
      alert("密码不能为空噢");
      return false;
    }
    return true;
  };
</script>

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
    String cur_role="";
    if(request.getSession().getAttribute("userID")!=null && request.getSession().getAttribute("cur_role")!=null){
      cur_userID = request.getSession().getAttribute("userID").toString();
      cur_role= request.getSession().getAttribute("cur_role").toString();
      System.out.println(cur_userID);
      System.out.println(cur_role);

    if(cur_role.equals("1")){
    %>
  <li><a href ="saleraddgood.jsp" class="fi">商家服务</a></li>
    <%
     }
    else {
    %>

  <li><a href ="shopping.jsp" class="fi">购物车</a></li>

  <%
     }
    }
    else {
    %>
  <li><a href ="shopping.jsp" class="fi">购物车</a></li>
    <%
        };
    %>
    <li><a href ="setting.jsp" class="fi">我的</a></li>
</ul>



<h1 class = "text_big">农产品选购</h1>

<div class = "div1">
  <div class = "text_middle">欢迎来到农产品选购平台!</div>
  <br>

</div>

<div class="login">

  <%
    request.setCharacterEncoding("utf-8");
    String userID = request.getParameter("username");
    long startTime = System.currentTimeMillis();
    String pass = request.getParameter("pwd");
    boolean flag = false;
    cur_role = "-1";

    if(userID != null) {
      System.out.println("Test User_ID : "+ userID);
      System.out.println("Test User pwd : "+pass);
      try{
      CustomerService customerService = new CustomerServiceImpl();
      Customer cur_customer = customerService.login(userID,pass);
        if(cur_customer!=null) {
          flag = true;
          cur_role = "0";
        }
      }
      catch (Exception e){
        e.printStackTrace();
        System.out.println("Test Customer login failed");
      }
      if(cur_role.equals("-1")){
      try{
        SalerService salerService = new SalerServiceImpl();
        Saler cur_saler = salerService.login(userID,pass);
        if(cur_saler!=null)
        {
            flag = true;
            cur_role ="1";
        }
      }
      catch (Exception e){
        e.printStackTrace();
        System.out.println("Test saler login failed");
      }
      }
//      Users cur_user = new Users(userID, pass);
//      flag = UsersOperation.checkUser(cur_user);

      if (flag == true) {
        if(cur_role.equals("1")) {
          System.out.println("Saler "+ userID);
          User.setUser(userID,pass,1);
        }
        else {
          System.out.println("Customer " + userID);
          User.setUser(userID,pass,0);
        }
        System.out.println("User :" + cur_role + "Login successc!");

        request.getSession().setAttribute("cur_role", cur_role);
        request.getSession().setAttribute("userID",userID);
        long endTime1 = System.currentTimeMillis();
  %>
  <text> 登录成功！</text>
  <%
    long endTime2 = System.currentTimeMillis();
    long useTime1 = (endTime1-startTime);
    long useTime2 = (endTime1-startTime);
    System.out.println("The time: " + useTime1);
    System.out.println("The time: "+ useTime2);
  }else {
    System.out.println("Login Failed...");

  %>
</br>
  <text>用户名不存在或密码错误，请重试</text>
  <%}

  }
  else{
    System.out.println("Haven't ini yet.");
  }
  %>

<% if(flag == false){ %>
  <div style="color:#ffffff; padding: 20px; font-size: 120%;">登录体验更多功能哦</div>
  <center>
  <table>
  <form action="index.jsp" method="post" onsubmit="return isValid(this);">
  <tr><td>&nbsp;<text style="color:#ffffff">用户名:</text>&nbsp;&nbsp;&nbsp;&nbsp;</td><td><input type="text" name="username" size="20"/></td></tr>&nbsp;
  <tr><td><text style="color:#ffffff">密&nbsp;码&nbsp; :</text> &nbsp;&nbsp;&nbsp;</td><td><input id = "pwd_input" type="password" name="pwd" size="20"/></td></tr>
<%--  <img id="pwd_img"  style="width: 20px;height: 20px;" onclick="hideShowPsw()" src="./img/view_off.png">--%>
  <tr><td>
<%--    <input type="reset" value="重置"/>--%>

  </table>
    <input  type="submit" value="登录"/>
    </form>
  </center>
  <br/>

    <text style="color:white"> 如果您还没有注册，请单击<a href="register.jsp" class="se">这里</a>注册</text><br/><br/>

  <% }
  %>

</div>


<hr>

<container>

  <div class = "box1">
    <h2>中国农产品 </h2>
    据新华社全国农副产品和价格行情系统监测，与前一日相比，2013年1月8日，肉类、鸡蛋、面粉价格上涨；食用油价格以涨为主；水果、水产品价格微幅波动；大米、奶类价格基本稳定。 [1]
    中国首次成为其整个财年排名第一的出口市场。美国农业部预测，当前财年对中国和加拿大的农产品出口额将各为190亿美元。过去一年，中国大量购买美国棉花引起关注。中国在10月中旬时曾购买90万吨美国棉花，据信在3月购买了125万吨棉花的未具名买家也是中国。
    中国是仅次美国的世界第二大棉花出产国，美国是世界第一棉花出口国。
    </br></br></br>

    <img src = "img/timg-15.jpeg"  align="right"  hspace="25" vspace="25" height="300px" width="300px"></img>

    整体看，美国2011财年农产品出口创纪录，出口额达1,374亿美元，预计始于10月1日的2012财年出口额将为1,370亿美元。主要出口市场为中国、加拿大、墨西哥、日本、欧盟和韩国。
    监测的21种蔬菜中，13种价格上涨，5种价格下降，3种价格持平；普通鲜鸡蛋价格上涨0.2%；猪后臀尖肉、猪五花肉价格均上涨0.3%；牛腱肉、牛腩肉价格分别上涨0.3%、0.2%，去骨鲜羊肉、带骨鲜羊肉价格涨幅均不足0.1%；标一粉、特一粉价格分别上涨0.5%、0.4%。
    在促进农业发展、增加农民收入、保障农民利益等方面发挥了巨大的作用,不仅是我国现代农业经营体系的基本组织形式,也是入社农户的市场工具,使其能从市场上得到最大的利益。
    全国农民合作社达到95.07万家,成员7221万户,占农户总数的27.8%。
    </br></br></br>
    全国各级示范社已突破10万家,开展内部信用合作的合作社已有近2万家,联合社5600多家、联合会2554家。同时,还有1.49万家合作社在2.7万个社区设立了2.3万个直销店,7500万人受益。
    农民合作社正由数量增长向数量增长与质量提升并重的方向转变,由注重生产联合向产加销一体化经营方向转变,由单一要素合作向劳动、技术、资金、土地等多要素合作方向转变。
    </br></br></br>
    但是,我国农民合作社存在的问题依然较多,需要引起高度重视,否则将制约现代农业经营体系的发展。
    中国是一个农业大国，农业关系到国计民生，是国民经济的支柱产业。1995年，中国农业生产总值突破万亿元大关；进入21世纪以来，农业生产总值年均增长10%以上，2011年达到47712亿元。伴随农业生产总值的稳步增长，中国农业生产经营水平稳步上升，农民生活水平稳步提高。
    在农业产业化实现较快发展的同时，中国农产品加工业规模呈快速扩张之势，加工企业数量不断增加，且经营效益良好。2004年，我国规模以上农产品加工企业约为9318 家；至2011 年，这一数量增至20187 家，增幅达到166.45%。
    据统计，2011 年，我国规模以上农产品加实现工业总产值44132.38亿元；规模以上农产品加工业实现销售收入43896.10亿元，同比增长33.23%；规模以上农产品加工业利润总额2372.96 亿元，同比增长40.80%。

  </div>




  <div class = "box2">
    <h2>中国农产品 </h2>
    据新华社全国农副产品和价格行情系统监测，与前一日相比，2013年1月8日，肉类、鸡蛋、面粉价格上涨；食用油价格以涨为主；水果、水产品价格微幅波动；大米、奶类价格基本稳定。 [1]
    中国首次成为其整个财年排名第一的出口市场。美国农业部预测，当前财年对中国和加拿大的农产品出口额将各为190亿美元。过去一年，中国大量购买美国棉花引起关注。中国在10月中旬时曾购买90万吨美国棉花，据信在3月购买了125万吨棉花的未具名买家也是中国。
    中国是仅次美国的世界第二大棉花出产国，美国是世界第一棉花出口国。
    </br></br></br>

    <img src = "img/timg-16.jpeg"  align="left"  hspace="25" vspace="25" height="300px" width="300px"></img>

    整体看，美国2011财年农产品出口创纪录，出口额达1,374亿美元，预计始于10月1日的2012财年出口额将为1,370亿美元。主要出口市场为中国、加拿大、墨西哥、日本、欧盟和韩国。
    监测的21种蔬菜中，13种价格上涨，5种价格下降，3种价格持平；普通鲜鸡蛋价格上涨0.2%；猪后臀尖肉、猪五花肉价格均上涨0.3%；牛腱肉、牛腩肉价格分别上涨0.3%、0.2%，去骨鲜羊肉、带骨鲜羊肉价格涨幅均不足0.1%；标一粉、特一粉价格分别上涨0.5%、0.4%。
    在促进农业发展、增加农民收入、保障农民利益等方面发挥了巨大的作用,不仅是我国现代农业经营体系的基本组织形式,也是入社农户的市场工具,使其能从市场上得到最大的利益。
    全国农民合作社达到95.07万家,成员7221万户,占农户总数的27.8%。
    </br></br></br>
    全国各级示范社已突破10万家,开展内部信用合作的合作社已有近2万家,联合社5600多家、联合会2554家。同时,还有1.49万家合作社在2.7万个社区设立了2.3万个直销店,7500万人受益。
    农民合作社正由数量增长向数量增长与质量提升并重的方向转变,由注重生产联合向产加销一体化经营方向转变,由单一要素合作向劳动、技术、资金、土地等多要素合作方向转变。
    </br></br></br>
    但是,我国农民合作社存在的问题依然较多,需要引起高度重视,否则将制约现代农业经营体系的发展。
    中国是一个农业大国，农业关系到国计民生，是国民经济的支柱产业。1995年，中国农业生产总值突破万亿元大关；进入21世纪以来，农业生产总值年均增长10%以上，2011年达到47712亿元。伴随农业生产总值的稳步增长，中国农业生产经营水平稳步上升，农民生活水平稳步提高。
    在农业产业化实现较快发展的同时，中国农产品加工业规模呈快速扩张之势，加工企业数量不断增加，且经营效益良好。2004年，我国规模以上农产品加工企业约为9318 家；至2011 年，这一数量增至20187 家，增幅达到166.45%。
    据统计，2011 年，我国规模以上农产品加实现工业总产值44132.38亿元；规模以上农产品加工业实现销售收入43896.10亿元，同比增长33.23%；规模以上农产品加工业利润总额2372.96 亿元，同比增长40.80%。

  </div>


  <div class = "box1">
    <h2>中国农产品 </h2>
    据新华社全国农副产品和价格行情系统监测，与前一日相比，2013年1月8日，肉类、鸡蛋、面粉价格上涨；食用油价格以涨为主；水果、水产品价格微幅波动；大米、奶类价格基本稳定。 [1]
    中国首次成为其整个财年排名第一的出口市场。美国农业部预测，当前财年对中国和加拿大的农产品出口额将各为190亿美元。过去一年，中国大量购买美国棉花引起关注。中国在10月中旬时曾购买90万吨美国棉花，据信在3月购买了125万吨棉花的未具名买家也是中国。
    中国是仅次美国的世界第二大棉花出产国，美国是世界第一棉花出口国。
    </br></br></br>

    <img src = "img/timg-12.jpeg"  align="right"  hspace="25" vspace="25" height="300px" width="300px"></img>

    整体看，美国2011财年农产品出口创纪录，出口额达1,374亿美元，预计始于10月1日的2012财年出口额将为1,370亿美元。主要出口市场为中国、加拿大、墨西哥、日本、欧盟和韩国。
    监测的21种蔬菜中，13种价格上涨，5种价格下降，3种价格持平；普通鲜鸡蛋价格上涨0.2%；猪后臀尖肉、猪五花肉价格均上涨0.3%；牛腱肉、牛腩肉价格分别上涨0.3%、0.2%，去骨鲜羊肉、带骨鲜羊肉价格涨幅均不足0.1%；标一粉、特一粉价格分别上涨0.5%、0.4%。
    在促进农业发展、增加农民收入、保障农民利益等方面发挥了巨大的作用,不仅是我国现代农业经营体系的基本组织形式,也是入社农户的市场工具,使其能从市场上得到最大的利益。
    全国农民合作社达到95.07万家,成员7221万户,占农户总数的27.8%。
    </br></br></br>
    全国各级示范社已突破10万家,开展内部信用合作的合作社已有近2万家,联合社5600多家、联合会2554家。同时,还有1.49万家合作社在2.7万个社区设立了2.3万个直销店,7500万人受益。
    农民合作社正由数量增长向数量增长与质量提升并重的方向转变,由注重生产联合向产加销一体化经营方向转变,由单一要素合作向劳动、技术、资金、土地等多要素合作方向转变。
    </br></br></br>
    但是,我国农民合作社存在的问题依然较多,需要引起高度重视,否则将制约现代农业经营体系的发展。
    中国是一个农业大国，农业关系到国计民生，是国民经济的支柱产业。1995年，中国农业生产总值突破万亿元大关；进入21世纪以来，农业生产总值年均增长10%以上，2011年达到47712亿元。伴随农业生产总值的稳步增长，中国农业生产经营水平稳步上升，农民生活水平稳步提高。
    在农业产业化实现较快发展的同时，中国农产品加工业规模呈快速扩张之势，加工企业数量不断增加，且经营效益良好。2004年，我国规模以上农产品加工企业约为9318 家；至2011 年，这一数量增至20187 家，增幅达到166.45%。
    据统计，2011 年，我国规模以上农产品加实现工业总产值44132.38亿元；规模以上农产品加工业实现销售收入43896.10亿元，同比增长33.23%；规模以上农产品加工业利润总额2372.96 亿元，同比增长40.80%。

  </div>

</container>

</body>
</html>

