

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.sun.media.jfxmedia.logging.Logger;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	public static final String address="jdbc:mysql://192.168.43.27:3306/";//192.168.43.27
	String userPasswd = "123456";//数据库密码
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("userID");
		String pwd = request.getParameter("password");
		
		
		//驱动程序名   
        String driverName = "com.mysql.jdbc.Driver";  
        //数据库用户名   
        String userName = "root";
     	//数据库名   
        String dbName = "rms";
        //表名   
        String tableName = "user"; 
        
        //联结字符串   
        String url = address + dbName + "?serverTimezone=UTC&user="  
                + userName + "&password=" + userPasswd;  

        try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();  
        Connection connection;
        connection = DriverManager.getConnection(url);
        Statement statement = connection.createStatement();  
        String sql = "SELECT * FROM user WHERE userID='"+username+"' AND password='"+pwd+"'";  
        PreparedStatement stmt = connection.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
        
        if(rs.next()){
			request.getSession().setAttribute("user", rs.getString(1));
			request.getSession().setAttribute("auth", rs.getString(3));
			response.sendRedirect("ProjectRiskManagement.jsp");
		}else{
			response.sendRedirect("wrongpwd.jsp");
		}
        
        connection.close();
        statement.close();
        stmt.close();
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
		
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

	