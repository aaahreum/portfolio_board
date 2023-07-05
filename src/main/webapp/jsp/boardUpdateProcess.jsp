<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>  
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

	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	/* String realFolder="C:\\portfolio\\portfolio_1\\src\\main\\webapp\\upload"; */
	String realFolder="C:\\Users\\yj-603-15\\git\\portfolio_board\\portfolio_1\\src\\main\\webapp\\upload";
	String encType="utf-8";
	int maxSize=5*1024*1024;
	
	MultipartRequest multi=new MultipartRequest(request,realFolder,maxSize,encType,
			new DefaultFileRenamePolicy());
	
	String num = multi.getParameter("num");
	String title=multi.getParameter("title");
	String name=multi.getParameter("name");
	String memo=multi.getParameter("memo");
	String filename=multi.getFilesystemName("filename");
	String sql="update p_board set name=?,title=?,memo=?, filename=? where num=?";
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
			location.href="boardList.jsp";
		</script>
		<%
	}catch(Exception e){
		System.out.println("수정 실패");
		e.printStackTrace();
	}
%>
</body>
</html>