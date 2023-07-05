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
    <link rel="stylesheet" href="../css/noticePage.css" />
    <style>
    	#pre{
    		line-height:1.5;
    		font-family: "Noto Sans KR",  sans-serif;
    	}
    	#td5{
    		min-height:574px;
			height:auto;
    		width:100%;
    	}
    	#td5 img{
    		display:block;
    		max-width:100%;
    		max-height:80%;
    		height: auto;
    		margin-bottom:30px;
    	}
    </style>
  </head>
  <body>
    <div class="wrap">
	<%@ include file="header.jsp" %>
      <div class="section">
        <div class="container">
          <h3>공지사항</h3>
          <div class="content">
          <%@ include file="dbconn.jsp" %>
			<%
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				String num = request.getParameter("num");
				String sql="select name,title,memo,to_char(time,'yyyy-MM-dd'), hit, filename from p_notice where num=?";
				try{
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, num);
					rs=pstmt.executeQuery();
					if(rs.next()){					
						String name=rs.getString("name");
						String title=rs.getString("title");
						String memo=rs.getString("memo");
						String time=rs.getString(4);
						int hit=rs.getInt("hit");
						hit++;
						String filename=rs.getString("filename");
				
			%>
            <table>
              <tr id="tr1">
                <td id="td1"><%= title %></td>
              </tr>
              <tr id="tr2">
                <td id="td2"><%=name %></td>
                <td id="td3">│</td>
                <td id="td4"><%=time %></td>
              </tr>
              <tr id="tr3">
                <td id="td5" >
               		<pre id="pre"><%=memo %></pre>
                	<br>
	                  <%
	                	if(filename!=null){%>
	                	
		                <img src="<%=request.getContextPath() %>/upload/<%=rs.getString("filename") %>" >
		                
	                	<%} %>
                </td>
                
              </tr>
              <tr id="tr4">
                <td id="td6">첨부파일</td>
                <td id="td7">
                <% 
                	if(filename!=null){%>
                		<%=filename %>
                	<%}else{%>
                		첨부된 파일이 없습니다.
                	<%}%>
                </td>
              </tr>
              <%	sql="update p_notice set hit=hit+1 where num=?";

				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, num);
				pstmt.executeUpdate();
				
					}
					
				}catch(Exception e){
					e.printStackTrace();
				}	
			 %>
            </table>
          </div>
          <%
			String checkId="";
			checkId=(String)session.getAttribute("s_Id");
			if("manager".equals(checkId)){
				%>
						
          <div class="btn">        			
				<button><a href="noticeUpdate.jsp?num=<%=num%>">수정</a></button>
            	<button><a href="noticeList.jsp">목록</a></button>
            	<button><a href="noticeDeleteProcess.jsp?num=<%=num%>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false;">삭제</a></button>
          </div>
          <%}else{%>
          <div class="btn">        			
            	<button><a href="noticeList.jsp">목록</a></button>
          </div>
          <%}%>
        </div>
      </div>


      <%@ include file="footer.jsp" %>
</div>
  </body>
</html>