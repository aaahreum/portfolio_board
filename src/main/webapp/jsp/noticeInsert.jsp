<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>portfolio</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" />
    <link rel="stylesheet" href="../css/noticeInsert.css" />
    <style>
	    input[type='file'] {
	    display: none;
	}
	.btn_file {
		display: inline-block;
		width: 110px;
		height: 38px;
		background-color: #041e42;
		color: #fff;
		text-align:center;
		line-height:38px;
	}
    </style>
    <script>
		function check(){
			form.submit();
		}
	</script>
	
  </head>
  <body>
		
	
    <div class="wrap">
    
	<%@ include file="header.jsp" %>

      <div class="section">
        <div class="container">
          <h3>공지사항 작성</h3>
          <div class="content">
          <form name="form" method="post"  enctype="multipart/form-data" action="noticeInsertProcess.jsp">
          
          <%
          	Date date= new Date();
          	SimpleDateFormat simpleDate=new SimpleDateFormat("yyyy-MM-dd");
          	String strdate=simpleDate.format(date);
          	%>

          	
            <table>
              <tr id="tr1">
                <td id="td2">제목</td>
                <td><input type="text" name="title" /></td>
              </tr>
              <tr id="tr1">
                <td id="td2">작성자</td>
                <td><input type="text" name="name" value="<%=checkName %>" readonly></td>
              </tr>
              <tr id="tr1">
                <td id="td2">작성일</td>
                <td><input type="text" name="time" value="<%=strdate %>" readonly /></td>
              </tr>
              <tr id="tr1">
                <td id="td4">내용</td>
                <td><textarea name="memo" id="" cols="110" rows="20"></textarea></td>
              </tr>
              <tr>
                <td id="td2">첨부파일</td>
				<td>
                	<span id="fileName"></span>&nbsp;&nbsp;<label class="btn_file" for="btn_file">파일선택</label>
                	<input type="file" name="filename" accept="image/gif, image/jpeg, image/png" id="btn_file" onchange="loadFile(this)"/>
                </td>
              </tr>
            </table>
          </form>
          </div>
          <div class="btn">
            <button type="button" id=btn2 onclick="check()">등록</button>
			<button type="reset" id=btn2 onclick="location.href='noticeList.jsp'">취소</button>
          </div>
        </div>
      </div>

      <%@ include file="footer.jsp" %>
      	
    </div>
  </body>
  <script>
  	function loadFile(input){
  		var file = input.files[0];
  		
  		var name = document.getElementById('fileName');
  	    name.textContent = file.name;
  	};
  </script>
</html>