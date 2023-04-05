package project.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import project.model.*;

public class PaymentDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	
	
	public PaymentDao(Connection con) {
		this.con = con;
	}
	
	public boolean insertPayment(Payment model) {
        boolean result = false;
        try {
            query = "insert into payments (name,address,phone,paymentMethod) values(?,?,?,?)";
            pst = this.con.prepareStatement(query);
            pst.setString(1,model.getName());
            pst.setString(2, model.getAddress());
            pst.setString(3,model.getPhone());
            pst.setString(4, model.getPaymentMethod());
            pst.executeUpdate();
            result = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

}
