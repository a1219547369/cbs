

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

@WebServlet("/MultInsertServlet")
public class MultInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoginServlet ls=new LoginServlet();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
	
		request.setCharacterEncoding("UTF-8");
		String planID = request.getParameter("planID");
		String[] riskID = request.getParameterValues("multinsert");

		
		//驱动程序名   
       
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
        
        for(int i=0;i<riskID.length;i++){
        String sql = "UPDATE "+ tableName +" SET belongplan= '"+planID+"' WHERE riskID='"+riskID[i]+"'";  
        statement.execute(sql);
        }
        connection.close();
        statement.close();
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
		response.sendRedirect("ProjectRiskManagement.jsp");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

	