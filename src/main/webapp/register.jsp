<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head = lang="zh-CN">
    <title>注册</title>
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
  <div class="container" align="center" style="background-color:#f0f0f0;border-radius:40px;opacity:0.6">
    <br>
	<br>
	<br>
	<br>
	
	
    <form method="post" name="form1" id="form1" action="RegisterServlet" onSubmit="return check_pwd()">
	<h1 class="form-signin-heading">注册</h1>
    <table border="0">
	<tr  style="height:80">
	<td align="center"><label>用户ID：</label></td>
	<td colspan="4">
    <input type="text" class="form-control" name="userID" autocomplete="off"></input>
	</td>
	</tr>
    <!-- <tr  style="height:80">
    <td align="center"><label>性别：</label></td>
    <td><strong>男：</strong><input type="radio" checked="checked" name="Sex" value="男" />&nbsp;&nbsp;&nbsp;<strong>女：</strong><input type="radio" name="Sex" value="女" /></td>
    </tr> -->
    <tr  style="height:80">
	<td align="center"><label>密码：</label></td>
	<td colspan="4">
    <input type="password" class="form-control" name="password" id="password" autocomplete="off"></input>
	</td>
    </tr>
    <tr style="height:80">
    <td align="center"><label>再次输入密码：</label></td>
	<td colspan="4">
  <input name="re_password" type="password" class="form-control" id="re_password" autocomplete="off"></input>
	</td>
    </tr>	
    <tr>
	<td colspan="5">
    <input type="submit" style="font-weight:bold" class="btn btn-lg btn-primary btn-block btn-shadow" value="完成"></input>
	    <a  class="btn btn-lg btn-block btn-default" href="index.jsp"><b>取消注册</b></a>
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
  
  <script language="JavaScript">
function check_pwd()
{ 
   if(document.form1.password.value!=document.form1.re_password.value){
   alert("两次输入不一致！");
   return false
 } 
}
</script>
  
</html>