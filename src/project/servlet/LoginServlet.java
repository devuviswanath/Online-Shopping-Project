package project.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.Dao.UserDao;
import project.connection.ConnectionProvider;
import project.model.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html:charset=UTF-8");
		
		
		try(PrintWriter out = response.getWriter()){
			
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			UserDao ulogin = new UserDao(ConnectionProvider.getConnection());
			User user = ulogin.userLogin(email, password);
			if (user != null) {
				request.getSession().setAttribute("auth", user);
				if("admin@gmail.com".equals(email)) {
					System.out.println("------admin");
					response.sendRedirect("admin/admin.jsp");
					
					}else {
						
						response.sendRedirect("index.jsp");
						
					}
					
				
			} else {
				response.setContentType("text/html; charset=UTF-8");
                PrintWriter let = response.getWriter();
                out.println("<script>");
                out.println("alert('User not found please try again');");
                out.println("window.location.replace('login.jsp');");
                out.println("</script>");
			}
				} 
		catch (ClassNotFoundException | SQLException e) 
				{
					e.printStackTrace();
				}


		}
}
