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
    <link rel="stylesheet" href="../css/boardList.css" />
	 <style>
		.page_num{
			display:inline;
			margin: 0 auto;
		}
		.page_num ul{
			width: 300px;
			margin: 0 auto;
		}
		
		.page_num ul li{
			float:left;
			width:30px;
			height:30px;
			line-height:30px;
			
			margin-left:10px;
			margin-top:30px;
			text-align:center;			
		}		
		#hide{
			display:none;
		}
  	</style>
  </head>
 
  <body>
    <div class="wrap">  
	<%@ include file="header.jsp" %>

      <div class="section">
        <div class="container">
          <h3>BOARD</h3>
    <%@ include file="dbconn.jsp"%>
    <%
    	PreparedStatement pstmt=null;
    	ResultSet rs=null;
    	int total=0;
    	
		int i=0;
    	int PAGE_LIMIT=5;
    	int BOARD_LIMIT=10;
    	int maxPage=0;
    	int startPage=0;
    	int endPage=0;
    	int startRow=0;
    	int currentPage=0;
    	if(request.getParameter("currentPage")==null){
    		 currentPage=1;
    	}else{
    	 currentPage=Integer.parseInt(request.getParameter("currentPage"));
    	}
    	
    	
    	try{
	    	String sql="select count(*) from p_board";
	    	
	    	pstmt=conn.prepareStatement(sql);
    		rs=pstmt.executeQuery();
    		if(rs.next()){
    			total=rs.getInt(1);
    		}
    		rs.close();
	    	
	    	maxPage=(int)Math.ceil(total / (double)BOARD_LIMIT);
	    	startPage=(int)((currentPage - 1) / PAGE_LIMIT) * PAGE_LIMIT + 1 ;
	    	endPage=startPage +PAGE_LIMIT -1;
	    	if(maxPage<endPage){
	    		endPage=maxPage;
	    	}
	    	startRow=(currentPage-1)*BOARD_LIMIT+1;
	    
    %>
          
          <p>총 <span><%= total %></span>개</p>
          <div class="content">
            <table>
              <tr>
                <th id="th1" width="80px">번호</th>
                <th id="th1" width="830px">제목</th>
                <th id="th1" width="40px">작성자</th>
                <th id="th1" width="70px">작성일</th>
                <th id="th1" width="40px">조회수</th>
              </tr>
		    <%
		    	pstmt=null;
		    	rs=null;

		    	
		    	sql=" select num, title, name, to_char(time,'yyyy-MM-dd'), hit, filename from notice_temp  where rownum <=2 order by rowno asc";

		      	try{
		      		
		      		pstmt=conn.prepareStatement(sql);
		      		rs=pstmt.executeQuery();
		      		while(rs.next()){
		      			
		      			int n_num=rs.getInt(1);
						String n_title=rs.getString(2);
						String n_name=rs.getString(3);
						String n_time=rs.getString(4);
						int n_hit =rs.getInt(5);
						String n_filename=rs.getString(6);
		  	%>
               <tr>
              	<td id="td3">공지</td>
              	
              	<%
                	if(n_filename!=null){%>
                <td id="td1" style="font-weight:700;"><a href="noticePage.jsp?num=<%=n_num %>"><%=n_title %>&nbsp;&nbsp;<i class="xi-image-o"></i></a></td>
                	<%}else{ %>
                <td id="td1" style="font-weight:700;"><a href="noticePage.jsp?num=<%=n_num %>"><%=n_title %></a></td>
                	<%}%>
                	
              	<td id="td3"><%=n_name %></td>
              	<td id="td3"><%=n_time %></td>
              	<td id="td3"><%=n_hit %></td>
              </tr>
              <%
		      		}
				}catch(Exception e){
				     e.printStackTrace();
				}
		      %> 
              
      <%
      
			if(total==0){
				
	  %>
	  
			<tr>
				<td colspan=6 height="50px" align="center">등록된 글이 없습니다.
			</tr>   
      <%
      
		}else{
			
			sql="delete from board_temp";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			
			sql="insert into board_temp(select rownum,x.* from (select * from p_board x order by num desc) x)";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			
			int start_no=(currentPage-1)*BOARD_LIMIT+1;
			int end_no=currentPage*BOARD_LIMIT;
			System.out.println("start_no:"+start_no+" "+end_no+" "+currentPage);
			
			sql="select num, title, name, to_char(time,'yyyy-MM-dd'), hit, filename from board_temp where rowno>=? and rowno<=?";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, start_no);
			pstmt.setInt(2, end_no);
			rs=pstmt.executeQuery();
			
			for(int p=1;p<=BOARD_LIMIT;p++){
				if(rs.next()){
					int num=rs.getInt(1);
					String title=rs.getString(2);
					String name=rs.getString(3);
					String time=rs.getString(4);
					int hit =rs.getInt(5);
					String filename=rs.getString(6);
					System.out.println("startPage:"+startPage+" "+endPage+" "+filename);
      			%>
      	     
             
              <tr>
                <td id="td1" width="60px"><%=num %></td>
                <%
                	if(filename!=null){%>
                <td id="td1" width="570px"><a href="boardPage.jsp?num=<%=num %>"><%=title %>&nbsp;&nbsp;<i class="xi-image-o"></i></a></td>
                	<%}else{ %>
                <td id="td1" width="570px"><a href="boardPage.jsp?num=<%=num %>"><%=title %></a></td>
                	<%}%>
                <td id="td1" width="100px"><%=name %></td>
                <td id="td1" width="130px"><%=time %></td>
                <td id="td1" width="80px"><%=hit %></td>             		         	
              </tr>
              <%} }%>
             

          	 <%   }
					
			
		      	}catch(Exception e){
		      		e.printStackTrace();
		      	}
    	

		      %>   
            </table>
            <div class="page_num">
              <ul><% if(startPage>PAGE_LIMIT){%> 
              	<li><a href="boardList.jsp?currentPage=<%=startPage - PAGE_LIMIT %>">이전</a></li>
              	<%}%>
              	<% if(startPage !=1){%>
              	<li id="hide"><a href="boardList.jsp?currentPage=<%=startPage - 1 %>"></a></li>
              	<%}%>
              	<%for(i=startPage; i<=endPage; i++){%>
              		<%if(i== currentPage){%>
              		<li id="p_num"><span style="font-weight:700; text-decoration: underline "><%=i %></li>
              		<%}else{%>
              		<li id="p_num"><a href="boardList.jsp?currentPage=<%=i %>"><%=i %></a></li>
              		<%}%>
              	<%}%>
              	<%if(endPage !=maxPage){%>
              		<li id="hide"><a href="boardList.jsp?currentPage=<%=endPage +1 %>"></a></li>
              	<%}%>
              	<%if(i>PAGE_LIMIT && i<= maxPage){%>
              		<li><a href="boardList.jsp?currentPage=<%=i %>">다음</a></li>
              	<%}%>
              </ul></div>
          </div>
          <div class="btn">
            <button onclick="check()"><a href="boardInsert.jsp">글쓰기</a></button>
          </div>
        </div>
      </div>

      <%@ include file="footer.jsp" %>
      
    </div>

  </body>
</html>