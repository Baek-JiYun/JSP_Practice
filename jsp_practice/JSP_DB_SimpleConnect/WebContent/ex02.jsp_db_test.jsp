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

	String html_name = request.getParameter("name");
	%>

	<%
	String SQL = "select * from jsp_student where manager='" + html_name + "'";
	try {
		ResultSet rs = st.executeQuery(SQL);

		while (rs.next()) {
			Num = rs.getInt("num");
			out.print(Num + "��" + "<br>");

			Name = rs.getString("name");
			out.print("�̸�:" + Name + "<br>");

			Manager = rs.getString("manager");
			out.print("�����:" + Manager + "<br><br>");
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	%>



</body>
</html>