<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%!private Connection con = null;
	private Statement st = null;
	private ResultSet rs = null;

	int Num = 0;
	String Name = "";
	String Manager = "";

	String html_name = "";%>
	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/jsp_db_test?serverTimezone=UTC&useSSL=false", "root",
			"1234");
	st = con.createStatement();
	%>
	<%
	request.setCharacterEncoding("EUC-KR");

	String html_num = request.getParameter("num");
	String html_name = request.getParameter("name");
	%>
	<%
	PreparedStatement pstmt= null;
	
	String SQL ="update jsp_student set name=? where num=?";
	try{
		pstmt=con.prepareStatement(SQL);
		pstmt.setString(1,html_name);
		pstmt.setString(2,html_num);
		pstmt.executeUpdate();
	}catch(SQLException e){
		e.printStackTrace();
	}
	out.print("DB 데이터 수정 완료");
	%>
</body>
</html>