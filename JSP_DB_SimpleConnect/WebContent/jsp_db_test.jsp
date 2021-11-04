<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%!
	private Connection con=null;
	private Statement st =null;
	private ResultSet rs= null;
	
	int Num=0;
	String Name="";
	String Manager="";
	%>
	
	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection(
			"jdbc:mysql://127.0.0.1:3306/jsp_db_test?serverTimezone=UTC&useSSL=false","root","1234");
	st=con.createStatement();
	%>
	
	<%
	String SQL ="SELECT * FROM jsp_student";
	try{
		ResultSet rs=st.executeQuery(SQL);
		
		while(rs.next()) {
			Num = rs.getInt("num");
			out.print(Num+"번"+"<br>");
			
			Name = rs.getString("name");
			out.print("이름:"+Name+"<br>");
			
			Manager = rs.getString("manager");
			out.print("담당자:"+Manager+"<br><br>");
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	%>
</body>
</html>