package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bean.User;
import com.tools.ConnDB;

public class UserDAO {
	private ConnDB connDB = new ConnDB();
	private Connection conn=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	
	public UserDAO() {
		super();
	}
	
	public int isValid(User user) {
		boolean result = false;
		int id = 0;
		conn = connDB.getConnection();
		
		String sql = "select id, username, password from t_user where username=? and password=?";
		try {	         
			ps = conn.prepareStatement(sql);
			ps.setString(1,user.getUsername());
			ps.setString(2, user.getPassword());
			rs = ps.executeQuery();
			
			if(rs.next()) {
				result = true;
				id=rs.getInt(1);
				}
			close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return id;	
		
	}
	
	//注册用户
	public int saveUser(User user) throws SQLException {
		conn = connDB.getConnection();
		
		String sql = "insert into t_user(username, password) values(?,?)";
		ps = conn.prepareStatement(sql);
		ps.setString(1,user.getUsername());
		ps.setString(2,user.getPassword());
		int result = ps.executeUpdate();
		
		close();
		return result;	
			
	}
	public int modifyPwd(User user)throws SQLException {
		conn = connDB.getConnection();
		String sql = "UPDATE t_user SET password=? WHERE id=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1,user.getPassword());
		ps.setInt(2,user.getId());
		int result = ps.executeUpdate();
		
		close();
		return result;

	}
	public void close() throws SQLException{
		if(rs!=null)
			rs.close();
		if(ps!=null)
			ps.close();
		try {
			connDB.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
