

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String username = request.getParameter("userID");
		String pwd = request.getParameter("password");
		
		
		if(username.equals("123") && pwd.equals("123")){
			request.getSession().setAttribute("user", username);
			response.sendRedirect("ProjectRiskManagement.jsp");
		}else{
			response.setContentType("text ml; charset=GB2312");
			PrintWriter out2 = response.getWriter();
			out2.print("<script>window.alert('wrong password or ID!'),location.href('src/main/webapp/index.jsp');</script>");
			out2.close();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

	