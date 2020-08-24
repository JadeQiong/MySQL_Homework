<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.shoppingdao" %>
<%@ page import="dao.IMPL.shoppingdaoImpl" %>
<%@ page import="dao.gooddao" %>
<%@ page import="dao.IMPL.gooddaoImpl" %>
<%@ page import="Service.IMPL.DealServiceImpl" %>
<%@ page import="dao.IMPL.dealdaoImpl" %>
<%@ page import="dao.IMPL.itemdaoImpl" %>
<%@ page import="domain.*" %><%--
  Created by IntelliJ IDEA.
  User: 87179
  Date: 2020/6/24
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<script>
    function del (i){
        alert("删除成功！" + i);
        <%--
        这一段如果保留不选那些操作也会把购物车页面清掉
        <%
        shoppingdao.deleteshopping(User.getUserID(),GoodList.get(i));
        %>
        --%>


        location.reload();
    }

    function add (i){
        alert("增加成功！");

        location.reload();
    }

    function sub (i){
        if(i-1<=0){
            alert("不能减少到0噢");
            return;
        }
        alert("减少成功！");
        <%--            <%--%>
        <%--//            GoodNumList.add(i,-1);--%>
        <%--//            shoppingdao.updateShoppingnum(User.getUserID(),GoodList.get(i),GoodNumList.get(i));--%>
        <%--            %>--%>
        location.reload();
    }
    function change_to_item() {
        document.getElementById("show_item").style.display="block";
        document.getElementById("show_good").style.display="none";

    }
    function change_to_good(){

        document.getElementById("show_item").style.display="none";
        document.getElementById("show_good").style.display="block";
    }
    function del() {
        alert("下架商品成功！");
    }
    function add() {
        alert("添加商品成功！");
    }
</script>


<head>
    <meta charset='utf-8'>
    <title>农民网（nongmin.com）</title>
</head>

<%--<link rel="stylesheet" href="AllShoppingCart.css"  type="text/css">--%>

<style>

    ul{
        list-style-type: none;
        margin:0px;
        /*padding:auto;*/
        overflow: hidden;
        background-color: rgba(0,0,0,0.5);
    }
    li{
        height: 45px;
        text-align: center;
        font-size: 138%;
        float: left;
    }
    a:link,a:visited{
        display: block;
        height: 50px;
        width: 260px;
        font-weight: bold;
        color: #FFFFFF;
        text-align: center;
        padding: 4px;
        text-decoration: none;
        text-transform: uppercase;
    }
    a:hover,a:active{
        text-align: center;
        background-color: #005500;
    }
    container{
        display: flex;
        flex-direction: column;
        text-align: center;
        justify-content: center;
    }
    .search{
        background-color: aliceblue;
    }
    .div1{
        width: 600px;
        margin: auto;
        text-align: center;
    }
    .div2{
        height: 500px;
        width: 300px;
        display: flex;
        direction: initial;
        background-color: whitesmoke;
    }
    .text_big{
        text-align: center;
        color: black;
        font-family: "Adobe 楷体 Std R";
        font-size: 300%;
    }
    .text_middle{
        color:black;
        font-size:150%;
    }
    .text_info{
        color:black;
        font-size:120%;
    }
    .box{
        display: flex;
        flex-direction: row;
        background-color: whitesmoke;
        color:  #666;
        width: 1050px;
        height: 180px;
        margin:20px auto;
        margin-top: 30px;
        margin-bottom: 30px;
        padding: 20px 20px 20px 35px;
    }
    .infoBox{
        width: 545px;
        height: 145px;
        margin: 8px;
    }
    .buttomBox{
        width:245px;
        height:145px;
        margin: 8px;
    }
    .imgBox{
        width: 145px;
        height: 145px;
        margin: 8px;
    }
    .imgBox img{
        width: 100%;
        height: 100%;
        margin: 0 auto;
    }

</style>

<body background="img/timg-sc.jpeg"
      style="background-repeat:no-repeat; background-size:100% 100%;background-attachment: fixed">
<ul>
    <li><a href="poultry.jsp" class="fi" >家禽</a></li>
    <li><a href ="aquatic.jsp" class="fi">水产</a></li>
    <li><a href ="vegetables.jsp" class="fi">蔬菜</a></li>
    <li><a href ="fruit.jsp" class="fi">水果</a></li>
    <li><a href ="shopping.jsp" class="fi">购物车</a></li>
    <li><a href ="setting.jsp" class="fi">我的</a></li>
</ul>

<h1 class = "text_big">购物车</h1>

<div class = "div1">
    <div class = "text_middle">欢迎来到你的购物车🛒!</div><br>
</div>

<hr>


<%
    String cur_userID = "";
    String cur_role="";

    //在index（好像中设置了全局的user参数，可以在任意界面获取到当前登录的用户信息，如下
    if(request.getSession().getAttribute("userID")!=null && request.getSession().getAttribute("cur_role")!=null){
        cur_userID = request.getSession().getAttribute("userID").toString();
        cur_role= request.getSession().getAttribute("cur_role").toString();
        System.out.println("User: " + cur_userID);
        System.out.println("Role: " + cur_role);
    }
    //只是比较方便的获取信息而已，上面一段，可以注释

    List<String> GoodList = new ArrayList<String>();
    List<Integer> GoodNumList = new ArrayList<Integer>();
    List<Double> GoodPriceList = new ArrayList<Double>();
    List<String> GoodKindList = new ArrayList<String>();

    shoppingdao shoppingdao=new shoppingdaoImpl();
    Shopping shopping=shoppingdao.printUsershopping(User.getUserID());
    System.out.println();
    GoodList = shopping.getGood_ID();
    GoodNumList = shopping.getNumber();
    GoodPriceList = shopping.getPrice();
    GoodKindList = shopping.getKind();
    gooddao gooddao=new gooddaoImpl();
    Good good=new Good();
    for(int i=0;i<GoodList.size();i++) {
        good= gooddao.QueryByOne(GoodList.get(i));

%>

<div class = "box">
    <div class = "imgBox">
        <img src = "img/index.jpg"></img>
    </div>

    <div class = "imgBox">
        <div class = "text_info">
            <b>名称: <%=good.getGoodName()%></b>
        </div>
        <br>光速订货
    </div>

    <div class = "infoBox">
        <div class ="text_info">
            <b>价格:<%=good.getPrice()%> 元/斤</b>
            </br> </br>
            <b>库存:<%=good.getNumber()%></b>
        </div>
        <br>
    </div>


    <div class = "buttomBox">
        <b>数量:
            <form action="shopping.jsp" method="post">
                 <input type="hidden" name="add_num" value="<%=GoodNumList.get(i)%>" />
                <input type="hidden" name="add_good_id" value="<%=GoodList.get(i)%>" />
                <input type="submit" value="+"  onclick="add('<%=GoodNumList.get(i)%>')"/>
            </form>
            <% out.print(" "+ GoodNumList.get(i));%>
            <form action="shopping.jsp" method="post">
                 <input type="hidden" name="sub_num" value="<%=GoodNumList.get(i)%>" />
                 <input type="hidden" name="sub_good_id" value="<%=GoodList.get(i)%>" />
                <input type="submit" value="-"  onclick="sub('<%=GoodNumList.get(i)%>')"/>
            </form>

        </b>

        <form action="shopping.jsp" method="post">
            <td> <input type="hidden" name="del_flag" value="1" /></td>
            <td> <input type="hidden" name="del_good_id" value="<%=GoodList.get(i)%>" /></td>
           </br>
            <input name = "delete" type="submit" value="删除" id="<%=i%>" onclick="del('<%=i%>')"  style= "height: 50px; width: 120px;"/>
        </form>
    </div>



</div>


<%
    };

    //SUB
    request.setCharacterEncoding("utf-8");
    String cur_num_sub_string = request.getParameter("sub_num");
    String cur_sub_good_id = request.getParameter("sub_good_id");
    if(cur_num_sub_string!=null && cur_sub_good_id!=null){
        Integer cur_num_sub = Integer.parseInt(cur_num_sub_string);
        cur_num_sub--;
        System.out.println("The number is changed to "+ cur_num_sub);
        shoppingdao.updateShoppingnum(User.getUserID(),cur_sub_good_id,cur_num_sub);
    }
    else{
        System.out.println("Sub is null.");
    };

    //ADD
    String cur_num_add_string = request.getParameter("add_num");
    String cur_add_good_id = request.getParameter("add_good_id");
    if(cur_num_add_string!=null && cur_add_good_id!=null){
        System.out.println(cur_add_good_id);
        Integer cur_num_add = Integer.parseInt(cur_num_add_string);
        cur_num_add++;
        System.out.println("The number is changed to "+ cur_num_add);
        shoppingdao.updateShoppingnum(User.getUserID(),cur_add_good_id,cur_num_add);
    }
    else{
        System.out.println("Add is null");
    }

    //DEl
    String delete_flag = request.getParameter("del_flag");
    String cur_good_id = request.getParameter("del_good_id");
    if(cur_good_id!= null && delete_flag.equals("1")){
        shoppingdao.deleteshopping(User.getUserID(),cur_good_id);
    }
    else{
        System.out.println("Not deleting...");
    }

    itemdaoImpl itemdao = new itemdaoImpl();
    //itemdao.printItem();


%>


<div class = "box" id = "show_item" style="display:none;">
<%--    <div class = "imgBox">--%>
<%--        <img src = "img/vegetables.jpg"></img>--%>
<%--    </div>--%>
<%--    <div class = "imgBox">--%>
<%--        <div class = "text_info">--%>
<%--            <b>名称:--%>
<%--                <% out.println(" "+ good.getGoodName());%>--%>
<%--            </b></div><br>--%>
<%--    </div>--%>
<%--    <div class = "infoBox">--%>
<%--        <div class ="text_info">--%>
<%--            <b>价格:--%>
<%--                <% out.print(" "+ GoodPriceList.get(i));%>--%>
<%--                元</b>--%>
<%--            <br>--%>
<%--            <b>数量:--%>

<%--                <form action="shopping.jsp" method="post">--%>
<%--                    <td> <input type="hidden" name="add_num" value="<%=GoodNumList.get(i)%>" /></td>--%>
<%--                    <td> <input type="hidden" name="add_good_id" value="<%=GoodList.get(i)%>" /></td>--%>
<%--                    <input type="submit" value="+"  onclick="add('<%=GoodNumList.get(i)%>')"/>--%>
<%--                </form>--%>
<%--                <% out.print(" "+ GoodNumList.get(i));%>--%>
<%--                <form action="shopping.jsp" method="post">--%>
<%--                    <td> <input type="hidden" name="sub_num" value="<%=GoodNumList.get(i)%>" /></td>--%>
<%--                    <td> <input type="hidden" name="sub_good_id" value="<%=GoodList.get(i)%>" /></td>--%>
<%--                    <input type="submit" value="-"  onclick="sub('<%=GoodNumList.get(i)%>')"/>--%>
<%--                </form>--%>


<%--            </b>--%>
<%--        </div>--%>
<%--        <br>--%>

<%--    </div>--%>

<%--    <div class = "buttomBox">--%>
<%--        <form action="shopping.jsp" method="post">--%>
<%--            <td> <input type="hidden" name="del_flag" value="1" /></td>--%>
<%--            <td> <input type="hidden" name="del_good_id" value="<%=GoodList.get(i)%>" /></td>--%>
<%--            <input name = "delete" type="submit" value="给爷爬" id="<%=i%>" onclick="del('<%=i%>')"  style= "height: 50px; width: 120px;"/>--%>
<%--        </form>--%>
<%--    </div>--%>



</div>



</body>
</html>