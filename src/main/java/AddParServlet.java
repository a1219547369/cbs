

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

@WebServlet("/AddParServlet")
public class AddParServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoginServlet ls=new LoginServlet();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String pname = request.getParameter("projectname");
		String participant = request.getParameter("participant");

		
        //数据库用户名   
        String userName = "root";  
        //密码   
        String userPasswd = ls.userPasswd;
        //数据库名   
        String dbName = "rms";  
        //表名   
        String tableName = "participant";  
        //联结字符串   
        String url = ls.address + dbName + "?serverTimezone=UTC&user="  
                + userName + "&password=" + userPasswd;  

        try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();  
        Connection connection;
        connection = DriverManager.getConnection(url);
        Statement statement = connection.createStatement();  
        String sql2="SELECT * FROM user WHERE userID=?";
     
        PreparedStatement statement2 = connection.prepareStatement(sql2);
        statement2.setString(1, participant);
        ResultSet rs = statement2.executeQuery();
        if(!rs.next()){
        	response.sendRedirect("wronguser.jsp");
        }else{
        	String sql = "INSERT INTO "+ tableName +" VALUES('"+pname+"' , '"+ participant +"')";  
            statement.execute(sql);
        	 request.getSession().setAttribute("projectname", pname);
     		response.sendRedirect("ProjectRiskManagement.jsp");
        }
        connection.close();
        statement.close();
        statement2.close();
        rs.close();
        
                } catch (SQLException | InstantiationException | IllegalAccessException | ClassNotFoundException e) {
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

	
