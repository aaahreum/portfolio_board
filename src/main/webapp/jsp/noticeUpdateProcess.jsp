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
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String num = request.getParameter("num");
	String title=request.getParameter("title");
	String name=request.getParameter("name");
	String memo=request.getParameter("memo");
	String filename=request.getParameter("filename");
	String sql="update p_notice set name=?,title=?,memo=?, filename=? where num=?";
	try{
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(5, num);
		pstmt.setString(1, name);
		pstmt.setString(2, title);
		pstmt.setString(3, memo);
		pstmt.setString(4, filename);
		pstmt.executeUpdate();
		%>
		<script>
			alert("수정 완료");
			location.href="noticeList.jsp";
		</script>
		<%
	}catch(Exception e){
		System.out.println("수정 실패");
		e.printStackTrace();
	}
%>
</body>
</html>