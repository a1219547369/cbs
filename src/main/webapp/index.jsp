<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%> 
<html = lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Sign up</title>

    <link href="bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            padding-top: 100px;
        }
        .starter-template {
            padding: 40px 15px;
            text-align: center;
        }
        .form-signin {
            max-width: 330px;
            padding: 15px;
            margin: 0 auto;
        }
        .form-signin .form-signin-heading,
        .form-signin .checkbox {
            margin-bottom: 10px;
        }
        .form-signin .checkbox {
            font-weight: normal;
        }
        .form-signin .form-control {
            position: relative;
            height: auto;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            padding: 10px;
            font-size: 16px;
        }
        .form-signin .form-control:focus {
            z-index: 2;
        }
        .form-signin input[type="email"] {
            margin-bottom: -1px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }
        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }
    </style>
	

</head>

<body background="" style="background-repeat:round">
<div class="container">

    <form name="form1" method = "post" action="LoginServlet" class="form-signin" onSubmit="return check_login()">
		<!--  <img style="width:60px;height:60px;margin-left:40%" src="logo1.png" /> -->
        <h3 class="form-signin-heading" style="font-family:Cursive" align="center">RiskManagementSystem</h3>

        <input type="text" name="userID" id="username"  class="login form-control" placeholder="username" required autofocus>

        <input type="password"  name="password" id="password" class="form-control" placeholder="password" required>
        <div class="checkbox">
            <label>
                <input type="checkbox" value="remember-me"> Remember me
            </label>
        </div>
        <input class="btn btn-lg btn-primary btn-shadow" value="LOGIN" style="width:300px" type="submit" ></input>		
    </form>

</div>
</body>

<script language="JavaScript">
function check_login()
{
	String isright=request.getSession().getAttribute("isright");
	System.out.println(11);
 if(isright=="false")/*document.表单名.文本域名.value==''"*/
 {
 alert("用户名或密码错误！");
 return false;
 }
 
 /* if(document.form1.password.value.length<6){
   alert("您的密码长度小于6！");
   return false
 } */
}
</script>
</html>
