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
<%@ page import="domain.*" %>
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

<body background="img/index.jpg"
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


<h1 class = "text_big">搜索结果</h1>

<div class = "div1">

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
    request.setCharacterEncoding("utf-8");
    String search_condition = request.getParameter("condition");
    if(search_condition!= null)
        System.out.println("Searching "+ search_condition);
    else
        System.out.println("Search Failed");

    if(request.getSession().getAttribute("userID")!=null && request.getSession().getAttribute("cur_role")!=null){
        cur_userID = request.getSession().getAttribute("userID").toString();
        cur_role= request.getSession().getAttribute("cur_role").toString();
        out.print(cur_userID);
        out.print(cur_role);
    }

    GoodServiceImpl goodService = new GoodServiceImpl();
    List<Good> QueryByKind =goodService.queryGoodsByKind(search_condition);
    List<Good> QueryByName = goodService.queryGoodsBySomeInformation(search_condition);

    List<Good> GoodList = new ArrayList<Good>();
    System.out.println("Query By Kind");
    if(QueryByKind != null || QueryByKind.isEmpty() == false){
        for(int i=0;i<QueryByKind.size();i++){
            if(QueryByKind.get(i)!=null)
         //   System.out.println(QueryByKind.get(i).getGoodName());
            GoodList.add(QueryByKind.get(i));
        }
    }

    System.out.println("Query By info");
    if(QueryByName != null || QueryByName.isEmpty() == false){
        for(int i=0;i<QueryByName.size();i++){
            if(QueryByName.get(i)!=null)
          //  System.out.println(QueryByName.get(i).getGoodName());
            GoodList.add(QueryByName.get(i));
        }
    }

    if(search_condition!=null){

    System.out.println("Query for "+ search_condition);
    System.out.println("Res ");

    if(GoodList.isEmpty() == true) { %>
<center>
    <text style="color: #F5F5F5">暂时没有查到您要的商品噢！ </text>
</center>
        <%
    }
    else{
        for(int i=0;i<GoodList.size();i++){
           System.out.println(GoodList.get(i).getGoodName());
%>

<div class = "box">
    <div class = "imgBox">
        <%
            String cur_good_kind = GoodList.get(i).getKind();
            if(cur_good_kind==null){
        %>
        <img src = "img/index.jpg"></img>
        <%
        }
        else if(cur_good_kind.equals("vegetable"))
        {
        %>
        <img src = "img/vegetables.jpg"></img>
        <%
        }
        else if(cur_good_kind.equals("poultry")){
        %>
        <img src = "img/poultry.jpg"></img>
        <%
        }
        else if(cur_good_kind.equals("aquatic")){
        %>
        <img src = "img/aquatic2.jpeg"></img>
        <%
        }
        else if(cur_good_kind.equals("fruit")){
        %>
        <img src = "img/fruit2.jpeg"></img>
        <%
            }
        %>

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
            if(1 == 0){
        %>
        <text> (恭喜！库存为0，不买立省100%哦 ！) </text>
        <%
            }
        %>
    </div>

    <div class = "buttomBox">
        <form action="search.jsp" method="post">
            <tr>
                <td> <input type="hidden" name="good_ID" value="<%=GoodList.get(i).getGood_ID() %>" /></td>
                <td> <input type="hidden" name="good_price" value="<%=GoodList.get(i).getPrice() %>" /></td>
                <td> <input type="hidden" name="good_kind" value="<%=GoodList.get(i).getKind()%>" /></td>
                <%--                <td><%=book.getName() %></td>--%>
                <%--                <td><%=book.getPrice() %></td><td><%=book.getPublishHouse() %></td>--%>
                <%--                <td><input type="text" name="booknum" value="<%=book.getShoppingNum() %>" />本</td>--%>
                <%--                <td><a href="/myshopping/ShoppingClServlet?type=del&id=<%=book.getId() %>">删除</a></td>--%>
            </tr>

            <input  type="submit" value="加入购物车" id="<%=i%>" onclick="add('<%=i%>')"  style= "height: 50px; width: 120px;"/>
        </form>
    </div>


    <div class = "buttomBox">
        <form action="comment.jsp">
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

<script type="text/javascript">
    var test1 = '111'; //定义js变量
    document.form.test2.value = test1;
    //将js变量的值放到form中的一个隐藏域中
    var formObj = document.getElementById('passForm');
    formObj.submit();
</script>

<form method="post" action="vegetables.jsp" id ="passForm">
    <input id = 'test2' type = 'hidden' name="test2">
</form>

<%
    //    request.setCharacterEncoding("utf-8");
//    String txtMsg = request.getParameter("test2");
//    out.println(txtMsg);
    request.setCharacterEncoding("utf-8");

//        out.println("HERE "+content);
%>

<%--<%--%>
<%--    request.setCharacterEncoding("utf-8");--%>
<%--    String txtMsg = request.getParameter("test2");--%>
<%--    out.println(txtMsg);--%>
<%--    System.out.println("Click on " + txtMsg);--%>
<%--%>--%>

<%
            }
        };
    };
//不要把这个放在循环里噢

    request.setCharacterEncoding("utf-8");
    String cur_good_id=request.getParameter("good_ID");
    String cur_good_price_string = request.getParameter("good_price");
    String cur_kind = request.getParameter("good_kind");

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

