<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<header id="header">
		<ul>
		<li><a href="/">홈</a></li>
		<%
		Object userId = session.getAttribute("userId");
		%>
		<%
		if(userId==null){
		%>
		<li><a href="./login.jsp">로그인</a></li>
		<li><a href="./form.jsp">회원가입</a></li>
		<%
		} else {
		%>
		<li><a href="./logoutAction.jsp">로그아웃</a></li>
		<li><a href="">개인정보수정</a></li>
		<%
		}
		%>
		</ul>
		</header>
		<div id="contents">
		
		</div>
		<footer id="footer">
		
		</footer>
	</div>
</body>
</html>