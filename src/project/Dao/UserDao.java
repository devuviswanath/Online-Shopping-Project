package project.Dao;

import java.sql.*;

import project.model.*;
import project.connection.*;

public class UserDao {
	private Connection con;
	private String query;
    private PreparedStatement pst;
    private ResultSet rs;

	public UserDao(Connection con) {
		this.con=con;
	}

	public boolean userSignup(User model) {
        boolean result = false;
        try {
            query = "insert into users (name, email, securityQuestion, answer,password) values(?,?,?,?,?)";
            pst = this.con.prepareStatement(query);
            pst.setString(1,model.getName());
            pst.setString(2, model.getEmail());
            pst.setString(3,model.getSecurityQuestion());
            pst.setString(4, model.getAnswer());
            pst.setString(5,model.getPassword());
            pst.executeUpdate();
            result = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }


	public User userLogin(String email, String password) {
		User user = null;
        try {
            query = "select * from users where email=? and password=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);
            rs = pst.executeQuery();
            if(rs.next()){
            	user = new User();
            	user.setId(rs.getInt("id"));
            	user.setName(rs.getString("name"));
            	user.setEmail(rs.getString("email"));
            }
        } catch (SQLException e) {
            System.out.print(e.getMessage());
        }
        return user;
    }
}