

import java.io.*;
import java.sql.DriverManager;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.sun.media.jfxmedia.logging.Logger;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;

@WebServlet("/AddFollowRiskServlet")
public class AddFollowRiskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoginServlet ls=new LoginServlet();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String riskID = request.getParameter("riskID");
		String moddes = request.getParameter("moddes");
		String status = request.getParameter("status");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		String creattime=df.format(new Date());// new Date()为获取当前系统时间

		
  
        //数据库用户名   
        String userName = "root";  
        //密码   
        String userPasswd = ls.userPasswd;
        //数据库名   
        String dbName = "rms";  
        //表名   
        String tableName = "followrisk";  
        //联结字符串   
        String url = ls.address + dbName + "?serverTimezone=UTC&user="  
                + userName + "&password=" + userPasswd;  

        try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();  
        Connection connection;
        connection = DriverManager.getConnection(url);
        Statement statement = connection.createStatement();  
        Statement statement2 = connection.createStatement(); 
        
        
        String sql = "INSERT INTO "+ tableName +" VALUES('"+riskID+"' , '"+ moddes +"', '"+ status +"','"+ creattime +"')";  
        statement.execute(sql);
        
        String sql2="UPDATE risk SET status='"+status+"',lastmodtime='"+creattime+"' WHERE riskID='"+riskID+"'";
        statement2.execute(sql2);
        connection.close();
        statement.close();
        statement2.close();
        } catch (SQLException e) {
			Logger.logMsg(1,"异常");
		} catch (InstantiationException e) {
			Logger.logMsg(1,"异常");
		} catch (IllegalAccessException e) {
			Logger.logMsg(1,"异常");
		} catch (ClassNotFoundException e) {
			Logger.logMsg(1,"异常");
		}  
		response.sendRedirect("ProjectRiskManagement.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

	