<%--
  Created by IntelliJ IDEA.
  User: 87179
  Date: 2020/6/24
  Time: 15:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Service.CommentService"%>
<%@ page import="Service.IMPL.CommentServiceImpl" %>
<%@ page import="domain.Comment" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html>

<head>
    <meta charset='utf-8'>
    <title>农民网（nongmin.com）</title>
</head>

<link rel="stylesheet" href="AllComment.css"  type="text/css">

<script type="text/javascript">
    var t = 123;
    function add(val){
        alert("Hello" + val);
    }

</script>

<%
    out.print("Attention plz...");
    String cur_userID = "";
    String cur_role="";
    String cur_good_id = "";
    String cur_good_name="";

    request.setCharacterEncoding("utf-8");
    cur_good_id =request.getParameter("good_ID");
    cur_good_name = request.getParameter("good_name");

    if(request.getSession().getAttribute("userID")!=null && request.getSession().getAttribute("cur_role")!=null){
        cur_userID = request.getSession().getAttribute("userID").toString();
        cur_role= request.getSession().getAttribute("cur_role").toString();
        System.out.print(cur_userID);
        System.out.print(cur_role);
    }

%>

<body background="img/index.jpg"
      style="background-repeat:no-repeat; background-size:100% 100%;background-attachment: fixed">
<ul>
    <li><a href="poultry.jsp" class="fi" >家禽</a></li>
    <li><a href ="aquatic.jsp" class="fi">水产</a></li>
    <li><a href ="vegetables.jsp" class="fi">蔬菜</a></li>
    <li><a href ="fruit.jsp" class="fi">水果</a></li>
    <%

        request.setCharacterEncoding("utf-8");
        String search_condition = request.getParameter("condition");
        if(search_condition!= null)
            System.out.println("Searching "+ search_condition);
        else
            System.out.println("Search Failed");

        System.out.print("Attention plz...");

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

<h1 class = "text_big">商品评论: <%=cur_good_name%>的评论</h1>

<div class = "div1">
    <div class = "text_middle">看看大家的评价怎么样</div><br>
</div>

<hr>

<%
    List<Comment> CommentList = new ArrayList<Comment>();
    CommentServiceImpl commentService = new CommentServiceImpl();
    CommentList = commentService.queryBygoodID(cur_good_id);

    if(CommentList!=null && CommentList.isEmpty()==false){
        System.out.println("Collected comments: ");
        for(int i=0;i<CommentList.size();i++){
            System.out.println(CommentList.get(i).getComment());

%>
<container>
    <div class = "box">
       <div class = "imgBox">
            <div class = "text_info">
                <b>用户：</b>
            </div>
           <br>
           买家: <%out.print(CommentList.get(i).getCustomer_ID());%>
       </div>
        <div class = "infoBox">
            <%out.print(CommentList.get(i).getComment());%>
         </div>
        <%out.print(CommentList.get(i).getTime());%>
    </div>
</div>

</container>

<%
        }
    }
%>

</body>
</html>

