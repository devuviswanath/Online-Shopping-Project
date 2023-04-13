package project.Dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import project.model.*;

public class OrderDao {
	private Connection con;
	private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    
    

	public OrderDao(Connection con) {
		this.con = con;
	}

	public boolean insertOrder(Order model) {
        boolean result = false;
        try {
            query = "insert into orders (productId, userId, quantity, date) values(?,?,?,?)";
            pst = this.con.prepareStatement(query);
            pst.setInt(1,model.getId());
            pst.setInt(2, model.getUserId());
            pst.setInt(3, model.getQuantity());
            pst.setString(4, model.getDate());
            pst.executeUpdate();
            result = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }
	

    public List<Order> userOrders(int id) {
        List<Order> list = new ArrayList<>();
        try {
            query = "select * from orders where userId=? order by orders.orderId desc";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                ProductDao productDao = new ProductDao(this.con);
                int pId = rs.getInt("productId");
                Product product = productDao.getSingleProduct(pId);
                order.setOrderId(rs.getInt("orderId"));
                order.setId(pId);
                order.setName(product.getName());
                order.setCategory(product.getCategory());
                order.setPrice(product.getPrice()*rs.getInt("quantity"));
                order.setQuantity(rs.getInt("quantity"));
                order.setDate(rs.getString("date"));
                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return list;
    }
	public List<Order> getAllOrders(){
		List<Order> orders = new ArrayList<Order>();
		try {
			query = "select * from orders";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();
			while(rs.next()) {
				Order row = new Order();
				ProductDao productDao = new ProductDao(this.con);
                int pId = rs.getInt("productId");
                Product product = productDao.getSingleProduct(pId);
				row.setOrderId(rs.getInt("orderId"));
				row.setId(pId);
				row.setName(product.getName());
				row.setCategory(product.getCategory());
				row.setPrice(product.getPrice()*rs.getInt("quantity"));
				row.setQuantity(rs.getInt("quantity"));
				row.setDate(rs.getString("date"));
				
				orders.add(row);
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return orders;
	}

    public void cancelOrder(int id) {
        //boolean result = false;
        try {
            query = "delete from orders where orderId=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            pst.execute();
            //result = true;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
        //return result;
    }
}