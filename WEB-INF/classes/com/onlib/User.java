package com.onlib;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

public class User {

	public int login(String email, String password) {
		try {
			Connection sqlconn = DriverManager.getConnection("jdbc:mysql://localhost/onlib", "root", "Ownedu@11");
			String query = "select user_id from users where email = '" + email + "' and password = '" + password + "'";
			Statement stmt = sqlconn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			if(!rs.next()) {
				return 0;
			} else {
				return rs.getInt("user_id");
			}
		} catch (SQLException ex) {
			return -1;
		}
	}

	public boolean signup(String email, String password, String name) {
		try {
			Connection sqlconn = DriverManager.getConnection("jdbc:mysql://localhost/onlib", "root", "Ownedu@11");
			String query = "select user_id from users where email = '" + email + "'";
			Statement stmt = sqlconn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			if(!rs.next()) {
				query = "insert into users(email, password, name) values('" + email + "', '" + password + "', '" + name + "')";
				stmt.execute(query);
				return true;
			} else {
				return false;
			}
		} catch (SQLException ex) {
			return false;
		}
	}

	public boolean purchase(String book_id, String user_id) {
		try {
			Connection sqlconn = DriverManager.getConnection("jdbc:mysql://localhost/onlib", "root", "Ownedu@11");
			String query = "insert into users_purchase values(" + user_id + ", " + book_id + ")";
			Statement stmt = sqlconn.createStatement();
			stmt.execute(query);
			return true;
		} catch (SQLException ex) {
			return false;
		}
	}

}