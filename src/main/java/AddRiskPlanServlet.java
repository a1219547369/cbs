

import java.io.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.sun.media.jfxmedia.logging.Logger;

import java.sql.Connection;
import java.sql.PreparedStatement;import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/AddRiskPlanServlet")
public class AddRiskPlanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoginServlet ls=new LoginServlet();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		request.setCharacterEncoding("UTF-8");
		String planname = request.getParameter("planname");


		
		
        //数据库用户名   
        String userName = "root";  
        //密码   
        String userPasswd = ls.userPasswd;
        //数据库名   
        String dbName = "rms";  
        //表名   
        String tableName = "riskplan";  
        //联结字符串   
        String url = ls.address + dbName + "?serverTimezone=UTC&user="  
                + userName + "&password=" + userPasswd;  
        

        try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();  
        Connection connection;
        connection = DriverManager.getConnection(url);
        Statement statement = connection.createStatement();  
        String sql2="SELECT max(planID) FROM riskplan";
        PreparedStatement stmt2 = connection.prepareStatement(sql2);
        ResultSet rs2 = stmt2.executeQuery();
        int planID=0;
        if(rs2.next()){
        	planID=rs2.getInt(1)+1;
        }else{
        	planID=1;
        }
        
        
        String sql = "INSERT INTO "+ tableName +" VALUES('"+planID+"' , '"+ planname +"')";  
        statement.execute(sql);
        connection.close();
        statement.close();
        stmt2.close();
        rs2.close();
              } catch (SQLException | InstantiationException | IllegalAccessException | ClassNotFoundException e) {
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

	
