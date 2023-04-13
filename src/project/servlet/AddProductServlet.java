package project.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import project.Dao.*;
import project.connection.ConnectionProvider;
import project.model.*;

@MultipartConfig
/**
 * Servlet implementation class AddProductServlet
 */
@WebServlet("/add-product")
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddProductServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {
			Part part = request.getPart("file");
			String fileName = part.getSubmittedFileName();
			String path = "C:/Users/devuv/eclipse-workspace/Online Shopping Project/WebContent/product-image/" + fileName;
			System.out.println(path);
		InputStream is = part.getInputStream();
			boolean succs = uploadFile(is,path);
			if(succs) {
				System.out.println("--------");
				out.println("File Uploaded to the directory:"+path);
//				Database 
//				response.setContentType("text/html:charset=UTF-8");
				try(PrintWriter out1 = response.getWriter()){
					double price=Double.parseDouble(request.getParameter("price"));
					Product productModel = new Product();
					productModel.setName(request.getParameter("name"));
					productModel.setCategory(request.getParameter("category"));
					productModel.setPrice(price);
					productModel.setImage(fileName);
		            ProductDao productDao = new ProductDao(ConnectionProvider.getConnection());
		            boolean result = productDao.addProduct(productModel); 
		            if (result) {
		                response.sendRedirect("admin/admin.jsp");
		            } else{
		            	out.println("error");
		            }

		    } catch (ClassNotFoundException|SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
//				Database end
					
			}else {
				out.println("error");
			}
		}
	}

	public boolean uploadFile(InputStream is, String path) {

		boolean test = false;
		try{
			byte[] byt = new byte[is.available()];
			is.read(byt);
			FileOutputStream fops = new FileOutputStream(path);
			fops.write(byt);
			fops.close();
			
			test=true;
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return test;
	}

}
