package project.Dao;

//Data Access Object 
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import project.model.*;
import project.connection.*;

public class UserDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;

	public UserDao(Connection con) {
		this.con = con;
	}

	public boolean userSignup(User model) {
		boolean result = false;
		try {
			query = "insert into users (name, email, securityQuestion, answer,password) values(?,?,?,?,?)";
			pst = this.con.prepareStatement(query);
			pst.setString(1, model.getName());
			pst.setString(2, model.getEmail());
			pst.setString(3, model.getSecurityQuestion());
			pst.setString(4, model.getAnswer());
			pst.setString(5, model.getPassword());
			pst.executeUpdate();
			result = true;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	public List<User> getAllUser() {
		List<User> users = new ArrayList<User>();
		try {
			query = "select * from users";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();
			while (rs.next()) {
				User row = new User();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setEmail(rs.getString("email"));
				row.setSecurityQuestion(rs.getString("securityQuestion"));
				row.setAnswer(rs.getString("answer"));
				row.setPassword(rs.getString("password"));

				users.add(row);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}

	public User userLogin(String email, String password) {
		User user = null;
		try {
			query = "select * from users where email=? and password=?";
			pst = this.con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			rs = pst.executeQuery();
			if (rs.next()) {
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

	public boolean userForgotPassword(String email, String password) {
		boolean result=false;
		try {
			query = "select * from users where email=?";

			pst = this.con.prepareStatement(query);
			pst.setString(1, email);
			rs = pst.executeQuery();
			if (rs.next()) {
				query = "update users set password=? where email=?";

				pst = this.con.prepareStatement(query);
				pst.setString(1, password);
				pst.setString(2, email);
				 result=true;
			}
			
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	public void deleteUser(int id) {
		// boolean result = false;
		try {
			query = "delete from users where id=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			pst.execute();
			// result = true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		// return result;
	}

}