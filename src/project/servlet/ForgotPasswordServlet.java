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
 * Servlet implementation class ForgotPasswordServlet
 */
@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPasswordServlet() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html:charset=UTF-8");
		try(PrintWriter out = response.getWriter()){
			String email = request.getParameter("email");
			String password = request.getParameter("newpassword");
            UserDao userDao = new UserDao(ConnectionProvider.getConnection());
            boolean result = userDao.userForgotPassword(email, password); 
            if (result) {
                response.sendRedirect("login.jsp");
            } else{
            	response.setContentType("text/html; charset=UTF-8");
                PrintWriter let = response.getWriter();
                out.println("<script>");
                out.println("alert('Please enter a valid email');");
                out.println("window.location.replace('forgotPassword.jsp');");
                out.println("</script>");
            }

    } catch (ClassNotFoundException|SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
