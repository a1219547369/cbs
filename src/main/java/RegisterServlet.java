

import java.io.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import java.sql.Connection;import java.sql.Connection;
import java.sql.PreparedStatement;import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		String userID = request.getParameter("userID");
		String password = request.getParameter("password");
		/*String starthour = request.getParameter("starthour");
		String startmin = request.getParameter("startmin");
		String endhour = request.getParameter("endhour");
		String endmin = request.getParameter("endmin");*/
		//System.out.println(content);
		//String date=starthour+"-"+startmin+"";

		
		//驱动程序名   
        String driverName = "com.mysql.jdbc.Driver";  
        //数据库用户名   
        String userName = "root";  
        //密码   
        String userPasswd = "123456";
        //数据库名   
        String dbName = "RMS";  
        //表名   
        String tableName = "user";  
        //联结字符串   
        String url = "jdbc:mysql://192.168.43.27:3306/" + dbName + "?user="  
                + userName + "&password=" + userPasswd;  

        try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();  
        Connection connection;
        connection = DriverManager.getConnection(url);
        Statement statement = connection.createStatement();  
        
        
        String sql = "INSERT INTO "+ tableName +" VALUES('"+userID+"' , '"+ password +"')";  
        statement.execute(sql);
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		response.sendRedirect("index.jsp");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

	