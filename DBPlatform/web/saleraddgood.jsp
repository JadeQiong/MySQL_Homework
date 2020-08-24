<%--
  Created by IntelliJ IDEA.
  User: 87179
  Date: 2020/7/1
  Time: 17:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.IMPL.gooddaoImpl" language="java" %>
<%@ page import="domain.Saler" %>
<%@ page import="Service.SalerService" %>
<%@ page import="Service.IMPL.SalerServiceImpl" %>
<%@ page import="domain.Good" %>
<%@ page import="java.util.Date" %>
<%@ page import="javax.xml.crypto.Data" %>
<%@ page import="Service.IMPL.GoodServiceImpl" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.sun.jmx.snmp.SnmpUnknownSubSystemException" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
</head>
<body>
</body>
</html>

<html>

<head>
    <meta charset='utf-8'>
    <title>农民网（nongmin.com）</title>
</head>

<script language="JavaScript">
    function change_to_edit() {
        document.getElementById("edit_good").style.display="block";
        document.getElementById("display_good").style.display="none";

    }
    function change_to_display(){

        document.getElementById("edit_good").style.display="none";
        document.getElementById("display_good").style.display="block";
    }
    function del() {
        alert("下架商品成功！");
    }
    function add() {
        alert("添加商品成功！");
    }
</script>


<link rel="stylesheet" href="Allsaleraddgood.css"  type="text/css">

<%
    out.print("Attention plz...");
    String cur_userID = "";
    String cur_role="";
    if(request.getSession().getAttribute("userID")!=null && request.getSession().getAttribute("cur_role")!=null){
        cur_userID = request.getSession().getAttribute("userID").toString();
        cur_role= request.getSession().getAttribute("cur_role").toString();
        System.out.println(cur_userID);
        System.out.println(cur_role);
    }

%>

<body background="./img/index.jpg"
      style="background-repeat:no-repeat; background-size:100% 100%;background-attachment: fixed">
<ul>
    <li><a href="" class="fi" >家禽</a></li>
    <li><a href ="" class="fi">水产</a></li>
    <li><a href ="" class="fi">蔬菜</a></li>
    <li><a href ="" class="fi">水果</a></li>
    <li><a href ="" class="fi">卖家服务</a></li>
    <li><a href ="" class="fi">我的</a></li>
</ul>

<h1 class = "text_big">添加您的商品</h1>

<div class = "div1">
    <div class = "text_middle">记得完善商品信息噢 </div>
    <br>
</div>

<hr>

<container>
    <div class = "box" id = "edit_good" style="display:block;">
        <h2>
            上传商品
        </h2>
        <button type="button" style="color:slateblue; float: right;height: 50px; margin-right: 150px; background:transparent;border-width: 0px;outline: #F5F5F5; font-size: 16px;"onclick="change_to_display()">查看我的商品</button>
        <div class="div3">
            </br></br></br>
            <center>
                <form action="saleraddgood.jsp" method="post">
                    <div>
                        类别 &nbsp;&nbsp;&nbsp;&nbsp;
                        蔬菜<label><input type="radio" name="kind" value="vegetable"></label>&nbsp;&nbsp;&nbsp;
                        家禽<label><input type="radio" name="kind" value="poultry"></label>&nbsp;&nbsp;&nbsp;
                        水果<label><input type="radio" name="kind" value="fruit"></label>&nbsp;&nbsp;&nbsp;
                        水产<label><input type="radio" name="kind" value="aquatic"></label>&nbsp;&nbsp;&nbsp;
                    </div>
                    </br>	</br>
                    名称 :&nbsp;&nbsp;<input type="text" name="good_name" size="60"style=" height: 25px;"/>
                    </br>	</br>
                    价格 :&nbsp;&nbsp;<input type="text" name="good_price" size="60"style=" height: 25px;"/>
                    </br>	</br>
                    库存 :&nbsp;&nbsp;<input type="text" name="good_number" size="60"style=" height: 25px;"/>
                    </br>	</br>
                    地区 :&nbsp;&nbsp;<input type="text" name="good_area" size="60"style=" height: 25px;"/>
                    </br>	</br>
                    备注 :&nbsp;&nbsp; <input type="text" name="others" size="60"style=" height: 105px;"/>
                    </br>	</br>
                    日期: &nbsp;&nbsp;<%
                    Date cur_date = new Date();
                    SimpleDateFormat sim_good_date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSSS");
                    out.print(cur_date.toString());
                     %>
                    </br></br>	</br>

                    <input type="submit" style="width: 100px; height: 50px;" value="提交"  onclick="add()"/>

                </form>
                <!-- <button type="button" style="height: 50px; border-width: 0px; outline: #F5F5F5; font-size: 16px;" onclick="change_to_display()">保存</button> -->

            </center>
        </div>

    </div>


    <div class = "box" id = "display_good" style="display:none;">
        <h2>
            查看商品
        </h2>
        <button type="button" style="color:slateblue; float: right;height: 50px; margin-right: 150px; background:transparent;border-width: 0px;outline: #F5F5F5; font-size: 16px;"onclick="change_to_edit()">返回</button>
        </br></br>	</br></br>

        <%
            gooddaoImpl gooddao = new gooddaoImpl();
            if(cur_userID!= null) {
                List<Good> goodList_of_saler = gooddao.queryBySalerID(cur_userID);
                if(goodList_of_saler!=null){
                    for(int i=0;i<goodList_of_saler.size();i++){

        %>

        <div class = "box2">
            <div class = "imgBox">
                <%
                    String cur_good_kind = goodList_of_saler.get(i).getKind();
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
                    <b>类别:
                        <%

//                        System.out.print(cur_good_kind);
//                        System.out.print(goodList_of_saler.get(i).getGood_ID());
//                        System.out.print(goodList_of_saler.get(i).getGood_ID());

                        if(cur_good_kind==null){
//                            System.out.print(goodList_of_saler.get(i).getGoodName());
//                            //System.out.println(cur_good_kind);
                            out.print("未知");
                        }
                        else if(cur_good_kind.equals("vegetable")){
                            out.print("蔬菜");
                        }
                        else if(cur_good_kind.equals("poultry")){
                            out.print("家禽");
                        }
                        else if(cur_good_kind.equals("fruit")) {
                            out.print("水果");
                        }
                        else if(cur_good_kind.equals("aquatic")){
                            out.print("水产");
                        }
                    %>
                    </b></br></br>
                    <b>名称: <%if(goodList_of_saler.get(i).getGoodName()!=null){
                        out.print(goodList_of_saler.get(i).getGoodName());
                    }
                    else{
                        out.print("null");
                    }%>
                    </b></br></br>
                    <b>库存: <%
                        if(goodList_of_saler.get(i).getNumber()!=null){
                            Integer cur_number = goodList_of_saler.get(i).getNumber();
                            if(cur_number == 0){
                                out.print("库存为0，记得补货噢！");
                            }
                            else{
                                out.print(goodList_of_saler.get(i).getNumber());
                            }
                        }
                        else{
                            out.print("null");
                        }
                    %> </b>
                </div>


            </div>
            <form action="saleraddgood.jsp" method="post">
            <div class = "infoBox">
                </b></br></br>
                <td> <input type="hidden" name="del_good_id" value="<%=goodList_of_saler.get(i).getGood_ID()%>" /></td>
                <input name = "buy" type="submit" value="删除"  onclick="del()"  style= "height: 50px; width: 120px; margin-right: 50px;"/>
            </div>
            </form>
        </div>

        <%
                    }
                }
            }

            //Delete good
            String del_good_id = request.getParameter("del_good_id");
            if(del_good_id!=null){
                System.out.println("You are deleting "+ del_good_id);
                try {
                    gooddao.deletegood(del_good_id);
                }
                catch (Exception e){
                    e.printStackTrace();
                    System.out.println("Delete good failed.");
                }
            }

        %>


    </div>

</container>
<%
    request.setCharacterEncoding("utf-8");
    String good_kind = request.getParameter("kind");
    if(good_kind!=null){
        System.out.println(good_kind);
    }

    //生成5位随机数作为good_ID
    String good_ID = Integer.toString((int)((Math.random()*9+1)*10000));

    String good_name = request.getParameter("good_name");

    String good_price_string = request.getParameter("good_price");
    Double good_price = 0.0;
    if(good_price_string!=null)
        good_price = Double.parseDouble(good_price_string);

    String good_number_string = request.getParameter("good_number");

    Integer good_number =0;
    if(good_number_string!=null)
    good_number = Integer.parseInt(good_number_string);
    String good_area = request.getParameter("good_area");

    if(sim_good_date!=null) {
        Date good_date = sim_good_date.parse(sim_good_date.format(new Date()));


    if(cur_userID!=null && good_ID!=null && good_name!=null &&
            good_price!=null && good_number!=null && good_area!=null && good_date !=null)
    {
        System.out.println(good_name+" "+ good_date + " " +good_area);
        Good cur_good = new Good(good_ID,cur_userID,good_number,good_price,good_date,good_area,"tbc",good_name,good_kind);
        if(cur_good.getKind()!=null)
            System.out.println("Adding "+ cur_good.getKind());
        GoodServiceImpl goodService = new GoodServiceImpl();
        try{
            goodService.addGood(cur_good);
        }
      catch (Exception e){
            e.printStackTrace();
            System.out.println("Add good Failed");
        }
    }
    }

%>
</body>
</html>