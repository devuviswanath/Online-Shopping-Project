package project.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.Dao.*;
import project.connection.ConnectionProvider;
import project.model.*;

/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/payment-now")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PaymentServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html:charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			Payment paymentModel = new Payment();
			paymentModel.setName(request.getParameter("name"));
			paymentModel.setAddress(request.getParameter("address"));
			paymentModel.setPhone(request.getParameter("phone"));
			paymentModel.setPaymentMethod(request.getParameter("paymentMethod"));
			PaymentDao paymentDao = new PaymentDao(ConnectionProvider.getConnection());
			boolean result = paymentDao.insertPayment(paymentModel);
			System.out.println(result);
			if (result==true) {
				response.sendRedirect("orders.jsp");
			} else {
				out.println("Payment failed");
			}

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
