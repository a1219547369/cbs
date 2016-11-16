<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<!-- Always force latest IE rendering engine or request Chrome Frame -->
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0" name="viewport">
<title>查询结果</title>


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
	 
	 	<div style="margin-top:70px;margin-bottom:90px">
            <span class="username"><font color="#000000">欢迎:</font></br><a class="adm" style="font-size:20px">${user}</a>
            </br>
            <a style="font-size:10px">权限：${auth}</a>
            </br></br>
            </span>
        </div>
	

	</TD>
    <TD width="80%" bgColor=#FFFFFF style="vertical-align:top;padding-left:80px;padding-right:80px;padding-top:50px;padding-bottom:50px;word-wrap:break-word;background-size:cover" background="bg8.jpg">
			<div class="page-header">
  <h1>查询结果</h1>
</div>
			
			<div class="container tabBodyContainer">
	 <div class="jumbotron tabBodyItem tabBodyCurrent">
	<%  
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	request.setCharacterEncoding("UTF-8");
	String starttime = request.getParameter("starttime");
	String endtime = request.getParameter("endtime");
	
        //驱动程序名   
        String driverName = "com.mysql.jdbc.Driver";  
        //数据库用户名   
        String userName = "root";  
        //密码   
        String userPasswd = "123456";
        //数据库名   
        String dbName = "rms";  
        //表名   
        String tableName = "risk";  
        //联结字符串   
        String url = "jdbc:mysql://192.168.43.27:3306/" + dbName + "?serverTimezone=UTC&user="  
                + userName + "&password=" + userPasswd;  
        Class.forName("com.mysql.jdbc.Driver").newInstance();  
        Connection connection = DriverManager.getConnection(url);  
        Statement statement = connection.createStatement();  
        String sql = "select a.riskID,a.type,a.pname,a.belongplan from risk  as a left join (select riskID, type, count(riskID) as c from risk group by type) as b on a.type=b.type where lastmodtime between '"+starttime+"' and '"+endtime+"' order by c DESC";  
        ResultSet rs = statement.executeQuery(sql);
    %>  
    <br>  
    <br>  
    <form method="post" action="multinsert.jsp" onsubmit="check_input()">
        <table class="table" style="text-align:center" id="tb1	">
        <tbody>
        <tr>
        
       <td colspan="2"> 识别最多的风险：</td>
        <td></td>
		  	  <td></td>
		  		<td></td>
        </tr>
          <thead>
            <td scope="row" style="width:50px"></td>
            <td>风险ID</td>
            <td>类型</td>
           	<td>所属项目</td>
           	<td>所属风险计划</td>
           	<td></td>
          </thead>
          <tbody>
          <%
          int n1=0;
    	  int n2=0;
    	  int n3=0;
    	  int n4=0;
    	  int n5=0;
    	  int n6=0;
    	  int n7=0;
          while(rs.next()){
        	  if(rs.getString(2).equals("产品规模")){
        		  n1++;
        	  }else if(rs.getString(2).equals("商业影响")){
        		  n2++;
        	  }else if(rs.getString(2).equals("客户特性")){
        		  n3++;
        	  }else if(rs.getString(2).equals("过程定义")){
        		  n4++;
        	  }else if(rs.getString(2).equals("开发环境")){
        		  n5++;
        	  }else if(rs.getString(2).equals("建造的技术")){
        		  n6++;
        	  }else if(rs.getString(2).equals("人员数目及经验")){
        		  n7++;
        	  }
        	  
        	  %>
          <tr>
          <td></td>
          <td><% out.print(rs.getString(1)); %></td>
          <td><% out.print(rs.getString(2)); %></td>
          <td><% out.print(rs.getString(3)); %></td>
          <td><% out.print(rs.getString(4)); %></td>
          <td><input type="checkbox" name="multinsert" value="<% out.print(rs.getString(1)); %>" /></td>
          </tr>
			<%}%>
			</tbody>
		  	  <tr>
		  	  <td></td>
		  	  <td></td>
		  	  <td></td>
		  	  <td></td>
		  	  <td><input type="submit" style="font-weight:bold" class="btn btn-lg btn-info btn-block btn-shadow" value="导入计划"></input></td>
		  	  </tr>
        </tbody>
      </table>
      </form>
      
      <canvas id="a_canvas" width="800" height="400">

    </canvas>
      </br>
      </br>
      </br>
      <form method="post" action="multinsert.jsp">
      <table class="table" style="text-align:center">
        <tbody>
        <tr>
        <td colspan="2">演变成问题最多的风险：</td>
        <td></td>
		  	  <td></td>
		  		<td></td>
        </tr>
          <tr>
            <td scope="row" style="width:50px"></td>
            <td>风险ID</td>
            <td>类型</td>
            <td>所属项目</td>
            <td>所属风险计划</td>
          </tr>
          <%
          Statement statement2 = connection.createStatement();  
          String sql2 = "select a.riskID,a.type,a.pname,belongplan from risk  as a left join (select riskID, type, count(riskID) as c from risk group by type) as b on a.type=b.type where lastmodtime between '"+starttime+"' and '"+endtime+"' and status='问题' order by c DESC";  
          ResultSet rs2 = statement2.executeQuery(sql2);
          int m1=0;
    	  int m2=0;
    	  int m3=0;
    	  int m4=0;
    	  int m5=0;
    	  int m6=0;
    	  int m7=0;
    	  int sum=0;
          while(rs2.next()){
        	  if(rs2.getString(2).equals("产品规模")){
        		  m1++;
        	  }else if(rs2.getString(2).equals("商业影响")){
        		  m2++;
        	  }else if(rs2.getString(2).equals("客户特性")){
        		  m3++;
        	  }else if(rs2.getString(2).equals("过程定义")){
        		  m4++;
        	  }else if(rs2.getString(2).equals("开发环境")){
        		  m5++;
        	  }else if(rs2.getString(2).equals("建造的技术")){
        		  m6++;
        	  }else if(rs2.getString(2).equals("人员数目及经验")){
        		  m7++;
        	  }
        	  sum=m1+m2+m3+m4+m5+m6+m7;
        	  %>
          <tr>
          <td></td>
          <td><% out.print(rs2.getString(1)); %></td>
          <td><% out.print(rs2.getString(2)); %></td>
          <td><% out.print(rs2.getString(3)); %></td>
          <td><% out.print(rs2.getString(4)); %></td>
          <td><input type="checkbox" name="multinsert" value="<% out.print(rs2.getString(1)); %>" /></td>
          </tr>
			<%}%>
		  	  <tr>
		  	  <td></td>
		  	  <td></td>
		  	  <td></td>
		  	  <td></td>
		  	  <td><input type="submit" style="font-weight:bold" class="btn btn-lg btn-info btn-block btn-shadow" value="导入计划"></input></td>
		      </tr>
		      
		      <tr>
		      <td></td>
		  	  <td></td>
		  	  <td></td>
		  	  <td></td>
		  	  <td><input type="button" class="btn btn-info" onclick="window.location.href='ProjectRiskManagement.jsp'" value="返回"></td>
		  	  </tr>
        </tbody>
      </table>
      
      </form>
      
       <canvas id="canvas_circle" width="500" height="300" style="border:2px solid #0026ff;" >  
                浏览器不支持canvas  
       </canvas> 
       
      </div>
	</div>
	</TD>
    </TR>
</TABLE>
</div>


</div>

<script>
(function (){
	 
    window.addEventListener("load", function(){

      var data = [<%=n1%>,<%=n2%>,<%=n3%>,<%=n4%>,<%=n5%>,<%=n6%>,<%=n7%>];
      var xinforma = ['产品规模','商业影响','客户特性','过程定义','开发环境','建造的技术','人员数目及经验'];

      // 获取上下文
      var a_canvas = document.getElementById('a_canvas');
      var context = a_canvas.getContext("2d");


      // 绘制背景
      var gradient = context.createLinearGradient(0,0,0,300);


     // gradient.addColorStop(0,"#e0e0e0");
      //gradient.addColorStop(1,"#ffffff");


      context.fillStyle = gradient;

      context.fillRect(0,0,a_canvas.width,a_canvas.height);

      var realheight = a_canvas.height-15;
      var realwidth = a_canvas.width-40;
      // 描绘边框
      var grid_cols = data.length + 1;
      var grid_rows = 4;
      var cell_height = realheight / grid_rows;
      var cell_width = realwidth / grid_cols;
      context.lineWidth = 1;
      context.strokeStyle = "#a0a0a0";

      // 结束边框描绘
      context.beginPath();
      // 准备画横线
      /*for(var row = 1; row <= grid_rows; row++){
        var y = row * cell_height;
        context.moveTo(0,y);
        context.lineTo(a_canvas.width, y);
      }*/
      
        //划横线
        context.moveTo(0,realheight);
        context.lineTo(realwidth,realheight);
            
         
        //画竖线
      context.moveTo(0,20);
       context.lineTo(0,realheight);
      context.lineWidth = 1;
      context.strokeStyle = "black";
      context.stroke();
          

      var max_v =0;
      
      for(var i = 0; i<data.length; i++){
        if (data[i] > max_v) { max_v =data[i]};
      }
      max_v = max_v * 1.1;
      
      // 将数据换算为坐标
      var points = [];
      for( var i=0; i < data.length; i++){
        var v= data[i];
        var px = cell_width *(i +1);
        var py = realheight - realheight*(v / max_v);
        //alert(py);
        points.push({"x":px,"y":py});
      }

      //绘制坐标图形
      for(var i in points){
        var p = points[i];
        context.beginPath();
        context.fillStyle="green";
        context.fillRect(p.x,p.y,15,realheight-p.y);
         
        context.fill();
      }
      //添加文字
      for(var i in points)
      {  var p = points[i];
        context.beginPath();
        context.fillStyle="black";
        context.fillText(data[i], p.x + 1, p.y - 15);
         context.fillText(xinforma[i],p.x + 1,realheight+12);
         context.fillText('类型',realwidth,realheight+12);
         context.fillText('次数',0,10);
          }
    },false);
  })();
</script>

 <script type="text/javascript">  
var color = ["#00FF21", "#FFAA00", "#00AABB", "#FF4400","#FFF000","#B766AD","#7373B9"];  
var data = [<%=m1%>,<%=m2%>,<%=m3%>,<%=m4%>,<%=m5%>,<%=m6%>,<%=m7%>];  
var text_arr = ['产品规模','商业影响','客户特性','过程定义','开发环境','建造的技术','人员数目及经验']; 
  
function drawCircle(){  
    var canvas = document.getElementById("canvas_circle");  
    var ctx = canvas.getContext("2d");  
    var startPoint = 1.5 * Math.PI;  
    
    var radius = canvas.height / 2 - 20; //半径  
    var ox = radius + 20, oy = radius + 20; //圆心  

    var width = 30, height = 10; //图例宽和高  
    var posX = ox * 2 + 20, posY = 30;   //  
    var textX = posX + width + 5, textY = posY + 10;
    for(var i=0;i<data.length;i++){  
        ctx.fillStyle = color[i];  
        ctx.strokeStyle = color[i];  
        ctx.beginPath();  
        ctx.moveTo(200,150);  
        ctx.arc(200,150,150,startPoint,startPoint-Math.PI*2*(data[i]/<%=sum%>),true);  
        ctx.fill();  
        ctx.stroke();  
        startPoint -= Math.PI*2*(data[i]/<%=sum%>);
        
      //绘制比例图及文字  
        ctx.fillStyle = color[i]; //"#000000";  
        var percent = text_arr[i] + "：" +  data[i];  
        ctx.fillText(percent, textX, textY + 20 * i); 
    } 
     
}  
drawCircle();  
</script> 

<!-- <script language="JavaScript">
function check_input()
{
	
 if(document.getElementById("risk").innerHTML.length==0)/*document.表单名.文本域名.value==''"*/
 {
 alert("未选择风险！");
 return false;
 }
 
 /* if(document.form1.password.value.length<6){
   alert("您的密码长度小于6！");
   return false
 } */
}    -->

</body></html>