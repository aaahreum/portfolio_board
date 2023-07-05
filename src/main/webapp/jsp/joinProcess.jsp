<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");

	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String repass=request.getParameter("repass");
	String name=request.getParameter("name");
	
	ResultSet rs=null;
	PreparedStatement pstmt=null;
	
	
	try{
		String sql="insert into p_member values(?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pass);
		pstmt.setString(3, repass);
		pstmt.setString(4, name);
		pstmt.executeUpdate();
%>
	<script>
		alert("회원가입이 완료되었습니다.");
		location.href="login.jsp";
	</script>
<%
	}catch(Exception e){
		out.println("등록 실패");
		e.printStackTrace();
	}
%>
</body>
</html>