<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%> 
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<!-- Always force latest IE rendering engine or request Chrome Frame -->
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0" name="viewport">
<!-- Use title if it's in the page YAML frontmatter -->
<title>HOME</title>


<meta content="#ffffff" name="msapplication-TileColor">
<meta content="/images/favicon/ms-icon-144x144-46dbe12c.png" name="msapplication-TileImage">
<meta content="#ffffff" name="theme-color">
<link href="all-d951c374.css" rel="stylesheet" type="text/css">
<script async="" src="analytics.js"></script>
<script src="all-ecacc06a.js" type="text/javascript"></script>
<link href="bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="slick.css" rel="stylesheet" type="text/css">
<link href="slick-theme.css" rel="stylesheet" type="text/css">
<link href="css" rel="stylesheet" type="text/css">

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
	h1{font-weight:bold;font-family:Microsoft YaHei}
	th{width: 100px;}
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
<TABLE borderColor=#00ff99 height="100%" width="100%" border=0 style="table-layout:fixed;" >
    <TR height="100%">
	<TD width="15%" style="vertical-align:top;background-size:cover;background:#8C8C00">
	 
	 	<div style="margin-top:80px;margin-bottom:80px">
            <span class="username">欢迎： &nbsp<a class="adm" style="font-size:40px">${user}</a></span>
        </div>
        
	<ul class="nav nav-pills nav-stacked nav-pills-stacked-example" >
      <li role="presentation"><a href="addproject.jsp">添加项目</a></li>
      <li role="presentation"><a href="">menu2</a></li>
      <li role="presentation"><a href="">menu3</a></li>
      <li role="presentation"><a href="">menu4</a></li>
      <li role="presentation"><a href="">menu5</a></li>
    </ul>


	</TD>
	
	
    <TD width="85%" bgColor=#FFFFFF style="vertical-align:top;padding-top:35px;padding-bottom:50px;word-wrap:break-word;background-size:cover" background="bg5.jpg">
	<div class="container">
	 <div class="page-header">
  <h1>所有项目</h1>
</div>
	

 <%  
        //驱动程序名   
        String driverName = "com.mysql.jdbc.Driver";  
        //数据库用户名   
        String userName = "root";  
        //密码   
        String userPasswd = "";
        //数据库名   
        String dbName = "RMS";  
        //表名   
        String tableName = "projectmanager";  
        //联结字符串   
        String url = "jdbc:mysql://localhost:3306/" + dbName + "?user="  
                + userName + "&password=" + userPasswd;  
        Class.forName("com.mysql.jdbc.Driver").newInstance();  
        Connection connection = DriverManager.getConnection(url);  
        Statement statement = connection.createStatement();  
        String sql = "SELECT * FROM " + tableName;  
        ResultSet rs = statement.executeQuery(sql);  
    %>  
    <br>  
    <br>  
  
        <%  
            while (rs.next()) { 
        %>  
       <div class="starter-template jumbotron">
			  <form name="form1" method = "post" action="ProjectDetail.jsp" class="form-signin">
			  
					<input type="hidden" name="projectname" value="<% out.print(rs.getString(1)); %>" />
					<span class="label label-warning" style="font-size:30px">项目名称:<% out.print(rs.getString(1)); %></span>
		
					<span class="label label-success">项目时间<% out.print(rs.getString(2));  %></span>
					<span class="label label-info">项目负责人:<% out.print(rs.getString(3)); %></span>
		
		 			
		 			
       				<input class="btn btn-lg btn-primary btn-shadow" type="submit" role="button" style="margin-left:90%" value="查看 &raquo;"></input></br>
           				<span class="label label-success">项目评估：<% out.print(rs.getString(4));  %></span>
    </form>
    </div>
        <%  
            }  
        %>  
    <div align="center">  
        <br> <br> <br>  
    </div>  
    <%  
        rs.close();  
        statement.close();  
        connection.close();  
    %>  



</div>
    <div class="pagination" style="padding-left:450px" >
        <a class="btn btn-default" href="#">&larr; 上一页</a>
		<span class="page-number">第 1 页/共 1 页</span>
        <a class="btn btn-default" href="#">下一页 &rarr;</a>
	</div>
	</TD>
    </TR>
</TABLE>
</div>


</div>


</body></html>