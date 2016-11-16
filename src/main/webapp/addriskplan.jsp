<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%> 
<html>
  <head = lang="zh-CN">
    <title>添加风险计划</title>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">	
	<link rel="icon" href="../../favicon.ico">
	<link href="all-d951c374.css" rel="stylesheet" type="text/css">
<script async="" src="analytics.js"></script><script src="all-ecacc06a.js" type="text/javascript"></script>
<link href="slick.css" rel="stylesheet" type="text/css">
<link href="bootstrap.min.css" rel="stylesheet" type="text/css">
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
	.u_info{padding:20% 20% 20% 20%;}
	h1{font-weight:bold;font-family:Microsoft YaHei}
</style> 
  </head>
  
  
  <body style="background:url('bg6.jpg');background-size:cover">
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
<li><a href="" style="font-weight:bold;font-family:Microsoft YaHei">1</a></li>
<li><a href="" style="font-weight:bold;font-family:Microsoft YaHei">2</a></li>
<li><a href="" style="font-weight:bold;font-family:Microsoft YaHei">3</a></li>
<li><a href="" style="font-weight:bold;font-family:Microsoft YaHei">4</a></li>
<li><a href="" style="font-weight:bold;font-family:Microsoft YaHei">5</a></li>
<li><a href="" style="font-weight:bold;font-family:Microsoft YaHei">6</a></li>
</ul>
</div>
</div>


  <div class="container" align="center" style="background-color:#f0f0f0;border-radius:40px;opacity:0.6">
    <br>
	<br>
	<br>
	<br>
    <form method="post" action="AddRiskPlanServlet">
    <h1 class="form-signin-heading">添加风险计划</h1>
    </br>
    </br>
        <table border="0">
        <tr style="height:80">
			<td class="form-signin-heading">风险计划名称:</td>
			<td><input name="planname" style="width:100%" rows="1" class="form-control" required autofocus></td>
       <tr>
    <tr style="height:80">
		<td colspan="5">
    	<input type="submit" style="font-weight:bold" class="btn btn-lg btn-primary btn-block btn-shadow" value="创建"></input>
		<input type="button" class="btn btn-info btn-lg btn-block btn-shadow" onclick="window.location.href='ProjectRiskManagement.jsp'" value="返回">
		</td>
	<td></td>
	<td></td>
	<td></td>
	<td></td>
    </tr>
    </table>
    </form>
	</div>
  </body>
</html>