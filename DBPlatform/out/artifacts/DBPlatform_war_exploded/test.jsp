<%--
  Created by IntelliJ IDEA.
  User: 87179
  Date: 2020/6/24
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="Service.*"%>
<%@page import="domain.*" %>
<%@page import="com.alibaba.druid.*" %>
<%@page import="dao.IMPL.salerdaoImpl"%>
<%@page import="java.util.ServiceConfigurationError" %>
<%@page import="Service.IMPL.SalerServiceImpl" %>
<%@page import="java.io.FileInputStream" %>
<%@page import="java.util.Properties" %>
<%@page import="Util.Jdbcutil" %>
<%@ page import="dao.customerdao" %>
<%@ page import="dao.IMPL.customerdaoImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

ghj
<%
    customerdaoImpl customerdao = new customerdaoImpl();
    System.out.println(customerdao.culwallet("00001",89.0));

                    System.out.println("Read java file");
                FileInputStream fis = new FileInputStream("C:/Users/87179/Desktop/DBPlatform/web/resources/jdbc.properties");
                Properties pro = new Properties();
                pro.load(fis);
                Properties properties = new Properties();

                //  InputStream inputStream= JdbcUtils.class.getClassLoader().getResourceAsStream("resources/jdbc.properties");
                //  properties.load(fis); fis.close();
                // properties.load(inputStream);
                System.out.println("Username" + pro.getProperty("username"));
                System.out.println(pro.getProperty("url"));
                System.out.println(pro.getProperty("password"));
                System.out.println(pro.getProperty("driverClassName"));
                SalerService s=new SalerServiceImpl();
                Saler sn =new Saler("hhh","123999","123123");
                s.register(sn);
%>
</body>
</html>
