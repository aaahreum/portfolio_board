<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>portfolio</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" />
    <link rel="stylesheet" href="../css/login.css" />
  </head>
  <body>	
    <div class="wrap">
	<%@ include file="header.jsp" %>
      <div class="section">
      <form name="form" method="post" action="loginProcess.jsp">
        <div class="container">
          <div class="content">
            <h2>로그인</h2>
            <input type="text" name="id" placeholder="아이디를 입력하세요." id="login_id" autofocus />
            <input type="password" name="password" placeholder="비밀번호를 입력하세요." id="login_pass" />
            <button id="login_btn">로그인</button>
            <p>
              아직 회원이 아니세요? <span><a href="join.jsp">회원가입</a></span>
            </p>
          </div>
        </div>
      </form>
      </div>
      <%@ include file="footer.jsp" %>
    </div>
    

  </body>
</html>