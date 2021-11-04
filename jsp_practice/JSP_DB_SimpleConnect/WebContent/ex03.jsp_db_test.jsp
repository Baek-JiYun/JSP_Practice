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
	private PreparedStatement pstmt=null;

	String Num = "";
	String Name = "";
	String Manager = "";
	%>
	
	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/jsp_db_test?serverTimezone=UTC&useSSL=false", "root",
			"1234");
	st = con.createStatement();
	%>
	
	<%
	request.setCharacterEncoding("EUC-KR");
	
	String Num=request.getParameter("num");
	String Name=request.getParameter("name");
	String Manager=request.getParameter("manager");
	%>
	
	<%
	try{
		pstmt=con.prepareStatement("insert into jsp_student(num,name,manager) values(?,?,?)");
		
		pstmt.setString(1, Num);
		pstmt.setString(2, Name);
		pstmt.setString(3, Manager);
		
		pstmt.executeUpdate();
	}catch(SQLException e){
		e.printStackTrace();
	}
	out.print("DB에 데이터 추가 완료");
	%>

</body>
</html>