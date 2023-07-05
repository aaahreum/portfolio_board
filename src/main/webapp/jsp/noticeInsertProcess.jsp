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
	
	ResultSet rs=null;
	PreparedStatement pstmt=null;
	
	int num=0;
    String sql="select max(num) from p_notice";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		num=rs.getInt(1)+1;
	}else{
		num=1;
	}
	
	String realFolder="C:\\portfolio\\portfolio_1\\src\\main\\webapp\\upload";
	String encType="utf-8";
	int maxSize=5*1024*1024;
	
	MultipartRequest multi=new MultipartRequest(request,realFolder,maxSize,encType,
			new DefaultFileRenamePolicy());
	
	String name=multi.getParameter("name");
	String title=multi.getParameter("title");
	String memo=multi.getParameter("memo");
	String filename=multi.getFilesystemName("filename");
	
	try{
		sql="insert into p_notice(num,name,title,memo,time,filename) values(?,?,?,?,sysdate,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		pstmt.setString(2, name);
		pstmt.setString(3, title);
		pstmt.setString(4, memo);
		pstmt.setString(5, filename);
		pstmt.executeUpdate();
%>
	<script>
		alert("공지가 등록되었습니다.");
		location.href="noticeList.jsp";
	</script>
<%
	}catch(Exception e){
		out.println("공지 등록 실패");
		e.printStackTrace();
	}
%>
</body>
</html>