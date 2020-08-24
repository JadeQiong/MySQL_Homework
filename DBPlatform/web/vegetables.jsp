<%--
  Created by IntelliJ IDEA.
  User: 87179
  Date: 2020/6/9
  Time: 0:11
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>

<%--</body>--%>
<%--</html>--%>
<%--
  Created by IntelliJ IDEA.
  User: AlanLee
  Date: 2019/3/21
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="dao.IMPL.*"%>
<%@page import="com.panli.model.*" %>
<%@ page import="com.panli.dbutil.Dbutil" %>
<%@ page import="com.panli.operation.VegetablesOperation" %>
<%@ page import="javax.xml.crypto.Data" %>
<%@ page import="domain.Good" %>
<%@ page import="domain.Shopping" %>
<%@ page import="Service.ShoppingService" %>
<%@ page import="Service.IMPL.ShoppingServiceImpl" %>
<%@ page import="Service.IMPL.GoodServiceImpl" %>


<%--<%--%>
<%--    //      定义一些参数--%>
<%--    String DRIVER_PATH = "com.mysql.cj.jdbc.Driver";    //驱动路径--%>

<%--    //的端口（默认3306），jspdb为你建的数据库的名称--%>
<%--    //?serverTimezone=UTC 这段要加上，不然会报错，我的是mysql8.0.15--%>
<%--    String URL = "jdbc:mysql://localhost:3306/product?serverTimezone=UTC";--%>
<%--    String USER_NAME = "root";      //数据库用户名--%>
<%--    String PASSWORD = "";     //数据库密码--%>
<%--    Connection con = null;--%>
<%--    Class.forName(DRIVER_PATH).newInstance();--%>
<%--    con = DriverManager.getConnection(URL,USER_NAME,PASSWORD);--%>

<%--//      判断数据库是否连接成功--%>
<%--    if (con != null){--%>
<%--        out.println("数据库连接成功");--%>
<%--    }else {--%>
<%--        out.println("数据库连接失败");--%>
<%--    }--%>
<%--    String sql = "SELECT * FROM test_vegetables";--%>
<%--    PreparedStatement preparedStatement = con.prepareStatement(sql);--%>
<%--    ResultSet resultSet = preparedStatement.executeQuery();--%>
<%--%>--%>


<html>

<head>
    <meta charset='utf-8'>
    <title>农民网（nongmin.com）</title>
</head>
<%--//禁止从本地缓存调用内容--%>
<meta http-equiv="pragma" content="no-cache">
<%--清楚缓存--%>
<meta http-equiv="cache-control" content="no-cache">
<%--网页到期时间--%>
<meta http-equiv="expires" content="0">
<%--关键字（搜索引擎）--%>
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">

<link rel="stylesheet" href="AllShoppingPage.css"  type="text/css">

<body background="img/vegetables.jpg"
      style="background-repeat:no-repeat; background-size:100% 100%;background-attachment: fixed">

<%--<form action="vegetables.jsp" method="POST" target="_blank">--%>
<%--    <input type = "submit" name = "btnSearch" value = "检索">--%>
<%--    <input type="checkbox" name="google" checked="checked" /> Google--%>
<%--    <input type="checkbox" name="runoob"  /> 菜鸟教程--%>
<%--    <input type="checkbox" name="taobao" checked="checked" />--%>
<%--    淘宝--%>
<%--    <input type="submit" value="选择网站" />--%>
<%--</form>--%>

<%--<%--%>
<%--    Enumeration paramNames = request.getParameterNames();--%>

<%--    while(paramNames.hasMoreElements()) {--%>
<%--        String s1 = request.getParameter("btnSearch");--%>
<%--        out.print(s1);--%>
<%--        String paramName = (String)paramNames.nextElement();--%>
<%--        out.print("<tr><td>" + paramName + "</td>\n");--%>
<%--        String paramValue = request.getParameter(paramName);--%>
<%--        out.println("<td> " + paramValue + "</td></tr>\n");--%>
<%--    }--%>
<%--%>--%>


<ul>
    <li><a href="poultry.jsp" class="fi" >家禽</a></li>
    <li><a href ="aquatic.jsp" class="fi">水产</a></li>
    <li><a href ="vegetables.jsp" class="fi">蔬菜</a></li>
    <li><a href ="fruit.jsp" class="fi">水果</a></li>
    <%

        request.setCharacterEncoding("utf-8");
        String search_condition = request.getParameter("condition");

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


<h1 class = "text_big">蔬菜类</h1>

<div class = "div1">
    <div class = "text_middle">欢迎来到蔬菜类选购!</div><br>

    <form action="search.jsp" method="post">
        <img src="./img/search.png" alt="" style="height: 25px;height: 25px;">
        &nbsp;
        <tr>
            <td>
                <input type="text" name="condition" placeholder="请输入搜索条件" style="border-radius: 4px;border-color: transparent; height: 30px; width: 200px;">
            </td>
            <td>
                <input type="submit" value="搜索" style="border: transparent;border-radius: 5px;height: 30px;width: 50px;" >
            </td>
        <tr>
    </form>


</div>

<hr>


<%

    GoodServiceImpl goodService = new GoodServiceImpl();
    List<Good> GoodList = new ArrayList<Good>();
    GoodList = goodService.queryGoodsByKind("vegetable");
    System.out.println("Query for vagetables");
    for(int i=0;i<GoodList.size();i++){

%>


<div class = "box">
    <div class = "imgBox">
        <img src = "img/vegetables.jpg"></img>
    </div>
    <div class = "imgBox">
        <div class = "text_info">
            <b>名称:
                <% out.println(" "+ GoodList.get(i).getGoodName());%>
            </b></div><br>光速订货
    </div>
    <div class = "infoBox">
        <div class ="text_info">
            <b>价格:
                <% out.print(" "+ GoodList.get(i).getPrice());%>
                元/斤</b>
            <br>
            <b>库存:
                <% out.print(" "+ GoodList.get(i).getNumber());%>
            </b>
        </div>
        <br>
        <%
            if(GoodList.get(i).getNumber() == 0){
        %>
        <text> (恭喜！库存为0，不买立省100%哦 ！) </text>
        <%
            }
        %>
    </div>

    <div class = "buttomBox">
        <form action="vegetables.jsp">
            <tr>
                <td> <input type="hidden" name="good_ID" value="<%=GoodList.get(i).getGood_ID() %>" /></td>
                <td> <input type="hidden" name="good_price" value="<%=GoodList.get(i).getPrice() %>" /></td>
<%--                <td><%=book.getName() %></td>--%>
<%--                <td><%=book.getPrice() %></td><td><%=book.getPublishHouse() %></td>--%>
<%--                <td><input type="text" name="booknum" value="<%=book.getShoppingNum() %>" />本</td>--%>
<%--                <td><a href="/myshopping/ShoppingClServlet?type=del&id=<%=book.getId() %>">删除</a></td>--%>
            </tr>

            <input name = "buy" type="submit" value="加入购物车" id="<%=i%>" onclick="add('<%=i%>')"  style= "height: 50px; width: 120px;"/>
        </form>
    </div>


<div class = "buttomBox">

<form action="comment.jsp">
    <td> <input type="hidden" name="good_ID" value="<%=GoodList.get(i).getGood_ID() %>" /></td>
    <td> <input type="hidden" name="good_name" value="<%=GoodList.get(i).getGoodName() %>"/></td>

    <input name = "view" type="submit" value="查看评论" id="<%=i%>" onclick="view('<%=i%>')"  style= "height: 50px; width: 120px;"/>
</form>

</div>



<script>
function add (i){
    alert("添加成功！" + i);

}
function view() {

}
</script>
</div>

<%
//    request.setCharacterEncoding("utf-8");
//    String txtMsg = request.getParameter("test2");
//    out.println(txtMsg);
request.setCharacterEncoding("utf-8");
String content = request.getParameter("buy");
if(content!=null)
//        out.println("HERE "+content);
%>

<%--<%--%>
<%--    request.setCharacterEncoding("utf-8");--%>
<%--    String txtMsg = request.getParameter("test2");--%>
<%--    out.println(txtMsg);--%>
<%--    System.out.println("Click on " + txtMsg);--%>
<%--%>--%>

<%
    };
//不要把这个放在循环里噢


    request.setCharacterEncoding("utf-8");
    String cur_good_id=request.getParameter("good_ID");
    String cur_good_price_string = request.getParameter("good_price");
    String cur_kind="";
    double cur_good_price = 0.0;
    if(cur_good_price_string!=null) {
        cur_good_price = Double.parseDouble(cur_good_price_string);
    }
    if(cur_good_id!=null) {
        System.out.println(" You choose " + cur_good_id);
        if(cur_role.equals("1")){
            System.out.println("Saler cant buy things.");
        }
        else if(cur_userID!=null && cur_role!= null){
            int cur_number =1;
             cur_kind= "vegetable";
            try{
                ShoppingServiceImpl shoppingService= new ShoppingServiceImpl();
                shoppingService.addItem(cur_userID,cur_good_id,cur_number,cur_good_price,cur_kind);
                System.out.println("Add shopping List success!");
            }
            catch (Exception e){
                e.printStackTrace();
                System.out.println("Add shopping List Failed...");
            }
        }
    }

%>

</body>
</html>

