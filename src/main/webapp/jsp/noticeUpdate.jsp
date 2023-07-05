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
    <link rel="stylesheet" href="../css/noticeUpdate.css" />
    <style>
	    input[type='file'] {
	    display: none;
	}
	.btn_file {
		margin-left:10px;
		display: inline-block;
		width: 110px;
		height: 38px;
		background-color: #041e42;
		color: #fff;
		text-align:center;
		line-height:38px;
	}
    </style>
  </head>
  <body>
    <div class="wrap">
    
	<%@ include file="header.jsp" %>

      <div class="section">
        <div class="container">
          <h3>공지사항 수정</h3>
          
          <%@ include file="dbconn.jsp" %>
			<%
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				String num =request.getParameter("num");
				String sql="select title, name, to_char(time,'yyyy-MM-dd'), memo, filename from p_notice where num=?";
				try{
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, num);
					rs=pstmt.executeQuery();
					while(rs.next()){
						String title=rs.getString("title");
						String name=rs.getString("name");
						String date=rs.getString(3);
						String memo=rs.getString("memo");
						String filename=rs.getString("filename");
			%>
          
          <form name="form" method="post" action="noticeUpdateProcess.jsp?num=<%=num%>">
          <div class="content">
            <table>
              <tr id="tr1">
                <td id="td2">제목</td>
                <td><input type="text" name="title" value="<%=title %>"/></td>
              </tr>
              <tr id="tr1">
                <td id="td2">작성자</td>
                <td><input type="text" name="name" value="<%=name%>"/></td>
              </tr>
              <tr id="tr1">
                <td id="td2">작성일</td>
                <td><input type="text" readonly id="in1" name="date" value="<%=date%>" /></td>
              </tr>
              <tr id="tr1">
                <td id="td4">내용</td>
                <td><textarea name="memo" id="" cols="110" rows="20"><%=memo%></textarea></td>
              </tr>
              <tr>
                <td id="td2">첨부파일</td>
				<td>
				<%
					if(filename!=null){%>
						<%=filename %> 
					<%}
				%>
                	<label class="btn_file" for="btn_file">파일선택</label>
                	<input type="file" name="filename" id="btn_file"/>
                </td>
              </tr>
              
              <%
						}
					}catch(Exception e){
						e.printStackTrace();
					}	
				 %>
            </table>
          </div>
          <div class="btn">
            <button onclick="check()">수정</button>
            <button><a href="noticePage.jsp?num=<%=num%>">취소</a></button>
          </div>
          </form>
        </div>
      </div>

      <%@ include file="footer.jsp" %>
      
    </div>
  </body>
</html>