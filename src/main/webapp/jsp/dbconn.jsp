<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	Connection conn = null;
	try {
		String url="jdbc:oracle:thin:@//localhost:1521/xe";
		String user="system";
		String pwd="1234";
		Class.forName("oracle.jdbc.OracleDriver");
		
		conn=DriverManager.getConnection(url,user,pwd);
		System.out.println("db 연결 완료");
	}catch (Exception e) {
		System.out.println("db 연결 실패");
		e.printStackTrace();
	}
%>
</body>
</html>