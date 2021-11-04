package com.jsp.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import com.jsp.dto.MemberDTO;

public class MemberDAO {
	private String url="jdbc:mysql://127.0.0.1:3306/jsp_db_test?serverTimezone=UTC&useSSL=false";
	private String dbID="root";
	private String dbPW="1234";
	
	Connection con=null;
	
	public MemberDAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection(url,dbID,dbPW);
		} catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public boolean memberSelect(String input_id,String input_pw){
		
		//ArrayList<MemberDTO> dtoList=new ArrayList<MemberDTO>(); 
		PreparedStatement pstmt=null;
		//Statement stmt=null;
		ResultSet rs=null;
		String SQL="SELECT pw FROM Member where id=?";
		
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, input_id);
			//stmt = con.createStatement();
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				String pw = rs.getString("pw");
				if(pw.equals(input_pw)==true) {
					return true;
				}
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		
		return false;
	}
	
}
