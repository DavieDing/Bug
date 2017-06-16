package com.heyi.cloudfarm.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.heyi.cloudfarm.bean.Bug;

public class DBDao {

	private static final String DBDRIVER = "com.mysql.jdbc.Driver";
	private static final String DBURL = "jdbc:mysql://localhost:3306/mysql?useUnicode=true&characterEncoding=utf8";
	private static final String DBUSER = "root";
	private static final String DBPASS = "root";
	private static Connection con;
	private static PreparedStatement pst;
	
	private static void getNewConnection(){
		try {
			Class.forName(DBDRIVER);
			con = DriverManager.getConnection(DBURL,DBUSER,DBPASS);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	
	/**
	 * there should be a query way and query in parts....later do it
	 */
		public static Map<String,Bug> query(String modu){
			getNewConnection();
			String sql = "select * from bug where modu=? limit 0,50";
			Map<String,Bug> map = null;
			try {
				pst = con.prepareStatement(sql);
				pst.setString(1, modu);
				ResultSet rs = pst.executeQuery();
				if(null != rs){
					map = new HashMap<String,Bug>();
					while(rs.next()){
						Bug bug = new Bug();							
						bug.setId(rs.getString("id"));
						bug.setOper(rs.getString("oper"));
						bug.setDesc(rs.getString("descp"));
						bug.setGrade(rs.getString("grade"));
						bug.setFixed(rs.getBoolean("fixed"));
						map.put(rs.getString("id"), bug);
					}
					rs.close();
				}
				return map;
			} catch (SQLException e) {
				close();
				e.printStackTrace();
			}
			return null;
		}
		
		/**
		 * this func could update in batch,yet also later...
		 */
		public static boolean update(String oper,String descp,String grade,boolean fixed,String modu){
			try {
				getNewConnection();
				con.setAutoCommit(false);
				con.setSavepoint();
				pst = con.prepareStatement("insert into bug(oper,descp,grade,fixed,modu)values(?,?,?,?,?)");
				pst.setString(1, oper);
				pst.setString(2, descp);
				pst.setString(3, grade);
				pst.setBoolean(4, fixed);
				pst.setString(5, modu);
				int result = pst.executeUpdate();
				con.commit();
				if(result != 0){
					return true;
				}
			} catch (SQLException e) {
				try {
					con.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
				close();
				e.printStackTrace();
			}
			return false;
		}
		
		
	    public static void close() {  
	        try {  
	        	if(null != pst){
	        		pst.close(); 
	        	}
	        	if(null != con){
	        		con.close();  
	        	}
	        } catch (SQLException e) {
	        	pst = null;
	        	con = null;
	            e.printStackTrace();  
	        }
	    } 
}
