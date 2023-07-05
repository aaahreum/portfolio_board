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
    <link rel="stylesheet" href="../css/join.css" />
    <script>
    	function check(){
    		if(document.form.id.value==""){
    			alert("아이디를 입력하세요.");
    			document.form.id.focus();
    			return false;
    		}
    		if(document.form.pass.value==""){
    			alert("비밀번호를 입력하세요.");
    			document.form.pass.focus();
    			return false;
    		}
    		if(document.form.repass.value==""){
    			alert("확인비밀번호를 입력하세요.");
    			document.form.repass.focus();
    			return false;
    		}
    		if(document.form.pass.value!=document.form.repass.value){
    			alert("비밀번호와 확인비밀번호가 일치하지않습니다.");
    			document.form.repass.focus();
    			return false;
    		}
    		
    		if(document.form.name.value==""){
    			alert("이름을 입력하세요.");
    			document.form.name.focus();
    			return false;
    		}
    		
    		var check= /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
    		if(!check.test(document.form.name.value)){
    			alert("이름은 한글만 입력 가능합니다.");
    			document.form.name.focus();
    			return false;
    		}
    		document.form.submit();
    	}
    </script>
  </head>
  <body>
    <div class="wrap">
    
	<%@ include file="header.jsp" %>

      <div class="section">
          <form name="form" id="form" method="post" action="joinProcess.jsp">
        	<div class="container">
          		<div class="content">
            		<h2>회원가입</h2>
            		<input type="text" name="id" placeholder="아이디를 입력하세요." id="join_id" autofocus />
            		<input type="password" name="pass" placeholder="비밀번호를 입력하세요." id="join_pass" />
            		<input type="password" name="repass" placeholder="확인 비밀번호를 입력하세요." id="join_repass" />
            		<input type="text" name="name" placeholder="이름을 입력하세요." id="join_name" />
            		<button type="button" class="join_btn" onclick="check()">가입하기</button>
          		</div>
        	</div>
          </form>
      </div>

      <%@ include file="footer.jsp" %>
      
    </div>
  </body>
</html>