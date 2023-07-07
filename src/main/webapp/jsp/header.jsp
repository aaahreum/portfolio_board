<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css?after">
<style>
 .welcome{
  display: block;
  height: 40px;
  padding: 0 30px;
  line-height: 40px;
  font-size: 14px;
}

</style>
</head>
<body>
<header>
<%
	String checkName="";
	checkName=(String)session.getAttribute("s_Name");
	if(checkName==null){%>
	
	<div class="header">
	        <div class="container">
	          <div class="logo">B</div>
	          <ul class="gnb">
	            <li>
	              <a
	                href="./index.jsp
	              
	              "
	                >홈</a
	              >
	            </li>
	            <li>
	              <a href="#x">커뮤니티</a>
	              <ul>
	                <li><a href="noticeList.jsp">공지사항</a></li>
	                <li><a href="boardList.jsp">자유게시판</a></li>
	              </ul>
	            </li>
	          </ul>
	          <div class="login">
	            <a href="login.jsp">로그인</a>
	          </div>
	        </div>
	      </div>
      
      <%}else{
		session.setMaxInactiveInterval(1000);//세션 유지시간
		%>
		
			<div class="header">
	        <div class="container">
	          <div class="logo">B</div>
	          <ul class="gnb">
	            <li>
	              <a
	                href="./index.jsp
	              
	              "
	                >홈</a
	              >
	            </li>
	            <li>
	              <a href="#x">커뮤니티</a>
	              <ul>
	                <li><a href="noticeList.jsp">공지사항</a></li>
	                <li><a href="boardList.jsp">자유게시판</a></li>
	              </ul>
	            </li>
	            <li class="welcome"><%=checkName %>님 환영합니다.</li>
	          </ul>
	          <div class="login">
	            <a href="logout.jsp">로그아웃</a>
	          </div>
	        </div>
	      </div>
		
	<%}
%>
</header>
</body>
</html>