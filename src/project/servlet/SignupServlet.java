package project.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.Dao.*;
import project.connection.ConnectionProvider;
import project.model.*;
import java.sql.*;

/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/sign-up")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
	{
		
		response.setContentType("text/html:charset=UTF-8");
		try(PrintWriter out = response.getWriter()){
			
			User userModel = new User();
			userModel.setName(request.getParameter("name"));
			userModel.setEmail(request.getParameter("email"));
			userModel.setSecurityQuestion(request.getParameter("securityQuestion"));
			userModel.setAnswer(request.getParameter("answer"));
			userModel.setPassword(request.getParameter("password"));
            UserDao userDao = new UserDao(ConnectionProvider.getConnection());
            boolean result = userDao.userSignup(userModel); 
            if (result) {
                response.sendRedirect("login.jsp");
            } else{
                out.println("signup failed");
            }

    } catch (ClassNotFoundException|SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} 
}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
