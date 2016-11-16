<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<!-- Always force latest IE rendering engine or request Chrome Frame -->
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0" name="viewport">
<title>风险计划</title>


<meta content="#ffffff" name="msapplication-TileColor">
<meta content="/images/favicon/ms-icon-144x144-46dbe12c.png" name="msapplication-TileImage">
<meta content="#ffffff" name="theme-color">
<link href="all-d951c374.css" rel="stylesheet" type="text/css">
<script async="" src="analytics.js"></script><script src="all-ecacc06a.js" type="text/javascript"></script>
<link href="slick.css" rel="stylesheet" type="text/css">
<link href="slick-theme.css" rel="stylesheet" type="text/css">
<link href="css" rel="stylesheet" type="text/css">
<link href="bootstrap.min.css" rel="stylesheet" type="text/css">

<style type="text/css"> 
    *{ margin:0; padding:0;    list-style:none;} 
    .nav a{ color:#06c; font-size:14px; line-height:24px;text-decoration:none;font-weight:bold;font-size:20px;color:black;font-family:Microsoft YaHei;text-align:center} 
	#nav{height:100px;line-height:100px;padding-top:10%;padding-left:20%;list-style-type:none}
	#nav a:hover{color:#009fcc}
    #nav strong{ color:#696;} 
    #nav.dyn li ul{ display:none;} 
    #nav.dyn li ul.show{ display:block;} 
    #nav.dyn li{ padding-left:20%;line-height:250%} 
	.avatar{border:2px solid #999;border-radius:50%;padding:.8em;}
	.username{display:inline-block;width:200px;padding:15% 20% 0 33%;font-size:1.2em;color:#999;border-bottom:1px solid #e6e6e6;font-weight:bold}
	.username a{text-decoration:none}
	.u_info{padding:20% 20% 20% 20%;}
		h1{font-weight:bold;font-family:Microsoft YaHei}
</style> 

</head>

<body class="index" data-view="index" style="">
<div class="content">
<nav>
<ul>
<li><a class="button" href="LoginOut" style="font-weight:bold;font-family:Microsoft YaHei">退出</a></li>
</ul>
</nav>
<div id='menu-toggle'>
<div class='menu-icon'><img src="menu-fe5f9c80.svg" /></div>
</div>

<div id='menu-overlay'>
<div class='menu-content'>
<ul>
<li><a href="health.php" style="font-weight:bold;font-family:Microsoft YaHei">1</a></li>
<li><a href="activity.php" style="font-weight:bold;font-family:Microsoft YaHei">2</a></li>
<li><a href="account.php" style="font-weight:bold;font-family:Microsoft YaHei">3</a></li>
<li><a href="authority.php" style="font-weight:bold;font-family:Microsoft YaHei">4</a></li>
<li><a href="suggestion.php" style="font-weight:bold;font-family:Microsoft YaHei">5</a></li>
<li><a href="presentation.php" style="font-weight:bold;font-family:Microsoft YaHei">6</a></li>
</ul>
</div>
</div>

<div id="header">
<TABLE borderColor=#00ff99 height="100%" width="100%" border=0 style="table-layout:fixed;font-weight:bold;font-family:Microsoft YaHei">
    <TR height="100%">
		<TD width="15%" style="vertical-align:top;background-size:cover;background:#8C8C00">
	 
	 	<div style="margin-top:80px;margin-bottom:80px">
            <span class="username"><font color="#000000">欢迎:</font></br><a class="adm" style="font-size:20px">${user}</a>
             </br>
            <a style="font-size:10px">权限：${auth}</a>
            </br></br>
            </span>
        </div>
	

	</TD>
    <TD width="80%" bgColor=#FFFFFF style="vertical-align:top;padding-left:80px;padding-right:80px;padding-top:50px;padding-bottom:50px;word-wrap:break-word;background-size:cover" background="bg8.jpg">
			<div class="page-header">
  <h1>风险计划</h1>
</div>
			<a href="addriskplan.jsp" class="btn btn-lg btn-primary btn-shadow">添加风险计划</a>
			</br></br>
			<div class="container tabBodyContainer">
			
	 <div class="jumbotron tabBodyItem tabBodyCurrent">
	<%  
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	request.setCharacterEncoding("UTF-8");
	String riskID = request.getParameter("riskID");
	
        //驱动程序名   
        String driverName = "com.mysql.jdbc.Driver";  
        //数据库用户名   
        String userName = "root";  
        //密码   
        String userPasswd = "123456";
        //数据库名   
        String dbName = "RMS";  
        //表名   
        String tableName = "riskplan";  
        //联结字符串   
        String url = "jdbc:mysql://192.167.43.27:3306/" + dbName + "?serverTimezone=UTC&user="
                + userName + "&password=" + userPasswd;  
        Class.forName("com.mysql.jdbc.Driver").newInstance();  
        Connection connection = DriverManager.getConnection(url);  
        Statement statement = connection.createStatement();  
        String sql = "SELECT * FROM " + tableName;  
        ResultSet rs = statement.executeQuery(sql);
    %>  
    <br>  
    <br>  
	 <form action="modify.jsp" method="post">
        <table class="table" style="text-align:center">
        <tbody>
          <tr>
            <th scope="row"></th>
            <td>风险计划ID</td>
            <td>风险计划名称</td>
            <td>包含风险</td>
            <td></td>
          </tr>
          <%while(rs.next()){ %>
          <input type="hidden" name="planID" value="<% out.print(rs.getString(1)); %>"></input>
          <tr>
          <td></td>
          <td><% out.print(rs.getString(1)); %></td>
          <td><% out.print(rs.getString(2)); %></td>
          
          <%
          Statement statement2 = connection.createStatement();
          String sql2 = "SELECT riskID FROM risk WHERE belongplan= '"+rs.getString(1)+"'";  
          ResultSet rs2 = statement2.executeQuery(sql2);
          String include="";
          while(rs2.next()){
        	  include=include+rs2.getString(1)+";";
          }
          %>
          <td><% out.print(include); %></td>
          <td><a href="addriskintoplan.jsp?planID=<%out.print(rs.getString(1)); %>" class="btn">添加风险</td>
          <td><a href="deleteriskfromplan.jsp?planID=<%out.print(rs.getString(1)); %>" class="btn">删除风险</td>
          </tr>
			<%}%>
		  	  
		  <tr>
		  <th scope="row"></th>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td> 
            <input type="button" class="btn btn-info" onclick="window.location.href='ProjectRiskManagement.jsp'" value="返回">
            </td>
		  </tr>
        </tbody>
      </table>
</form>
      </div>
	</div>
	</TD>
    </TR>
</TABLE>
</div>


</div>


</body></html>