

import java.io.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.Date;
import java.text.SimpleDateFormat;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.sun.media.jfxmedia.logging.Logger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/PostServlet")
public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoginServlet ls=new LoginServlet();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		String pname = request.getParameter("pname");
		String type = request.getParameter("type");
		String pos=request.getParameter("pos");
		String influencedegree = request.getParameter("influencedegree");
		String forward=request.getParameter("forward");
		String poster=request.getParameter("poster");
		String follower=request.getParameter("follower");
		String status="风险";
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		String creattime=df.format(new Date());// new Date()为获取当前系统时间
		int riskID=0;


		
		//驱动程序名   
        String driverName = "com.mysql.jdbc.Driver";  
        //数据库用户名   
        String userName = "root";  
        //密码   
        String userPasswd = ls.userPasswd;
        //数据库名   
        String dbName = "rms";  
        //表名   
        String tableName = "risk";  
        //联结字符串   
        String url = ls.address + dbName + "?serverTimezone=UTC&user="  
                + userName + "&password=" + userPasswd;  

        try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();  
        Connection connection;
        connection = DriverManager.getConnection(url);
        Statement statement = connection.createStatement();  
        Statement statement2 = connection.createStatement();  
        
        String sql2="SELECT max(riskID) FROM risk";
        PreparedStatement stmt2 = connection.prepareStatement(sql2);
        ResultSet rs2 = stmt2.executeQuery();
        if(rs2.next()){
        	riskID=rs2.getInt(1)+1;
        }else{
        	riskID=1;
        }
        
        
        System.out.println(pname);
        
        String sql = "INSERT INTO "+ tableName +" VALUES('"+riskID+"' ,'"+type+"' , '"+pname+"' , '"+ pos +"','"+influencedegree+"','"+forward+"','"+poster+"','"+follower+"','"+status+"','"+creattime+"','"+creattime+"',' ')";  
        statement.execute(sql);
        
        String sql3="INSERT INTO followrisk VALUES('"+riskID+"','第一次提交','"+status+"','"+creattime+"')";
        statement2.execute(sql3);
        connection.close();
        statement.close();
        statement2.close();
        stmt2.close();
        } catch (SQLException e) {
			// TODO Auto-generated catch block
        	Logger.logMsg(1,"异常");
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			Logger.logMsg(1,"异常");
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			Logger.logMsg(1,"异常");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			Logger.logMsg(1,"异常");
		}  
        request.getSession().setAttribute("projectname", pname);
		response.sendRedirect("ProjectRiskManagement.jsp");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

	