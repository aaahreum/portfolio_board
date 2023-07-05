<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>portfolio</title>
<link rel="stylesheet" href="../css/index.css?after">
<style>

.content_1 .container{
	display: flex;
  	flex-direction: column;
}

.content_2 .container{
	display: flex;
  	flex-direction: column;
}

.table {
  	width: 1020px;
  	margin: 0 auto;
}
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	  <div class="main">
        <div class="container">
          <!--  -->
        </div>
      </div>

      <div class="content_1">
        <div class="container">
          <p>NOTICE</p>
          
          <div class="table">
          
		  	<table>
		  		<%@ include file="dbconn.jsp"%>
		    <%
		    	PreparedStatement pstmt=null;
		    	ResultSet rs=null;

		    	
		    	String sql=" select num,title,name,to_char(time,'yyyy.MM.dd') from notice_temp  where rownum <=5 order by rowno asc";

		      	try{
		      		
		      		pstmt=conn.prepareStatement(sql);
		      		rs=pstmt.executeQuery();
		      		while(rs.next()){
		      			
		      			int num=rs.getInt("num");
		      			String title=rs.getString("title");
		      			String name=rs.getString("name");
		      			String time=rs.getString(4);
		  	%>
		  	

		  		<tr>
		  			<td height=50px width=850px align="left"><a href="noticePage.jsp?num=<%=num %>"> <%=title %></a></td>		  	
		  			<td width=50px align="center"><%=name %></td>	
		  			<td width=100px align="right"><%=time %></td>
		  		</tr>
		  	
		  	<%
		      		}
				}catch(Exception e){
				     e.printStackTrace();
				}
		      %> 
		  	</table>
          </div>
          
        </div>
      </div>

      <div class="content_2">
        <div class="container">
          <p>최신글</p>
          
          <div class="table">
          
		  	<table>
		    <%
		    	pstmt=null;
		    	rs=null;

		    	
		    	sql=" select num,title,name,to_char(time,'yyyy.MM.dd') from board_temp  where rownum <=5 order by rowno asc";

		      	try{
		      		
		      		pstmt=conn.prepareStatement(sql);
		      		rs=pstmt.executeQuery();
		      		while(rs.next()){
		      			
		      			int num=rs.getInt("num");
		      			String title=rs.getString("title");
		      			String name=rs.getString("name");
		      			String time=rs.getString(4);
		  	%>
		  	

		  		<tr>
		  			<td height=50px width=850px align="left"><a href="boardPage.jsp?num=<%=num %>"> <%=title %></a></td>		  	
		  			<td width=50px align="center"><%=name %></td>	
		  			<td width=100px align="right"><%=time %></td>
		  		</tr>
		  	
		  	<%
		      		}
				}catch(Exception e){
				     e.printStackTrace();
				}
		      %> 
		  	</table>
          </div>
          
          
        </div>
      </div>
<%@ include file="footer.jsp" %>
</body>
</html>