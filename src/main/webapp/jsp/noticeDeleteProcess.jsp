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
	String num=request.getParameter("num");
	String sql="delete from p_notice where num=?";
	try{
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, num);
		pstmt.executeUpdate();
		%>
		<script>
		alert("글이 삭제되었습니다.");
		location.href="noticeList.jsp";
		</script>
		<%
	}catch(Exception e){
		System.out.println("글 삭제 실패");
		e.printStackTrace();
	}
%>
%>
</body>
</html>