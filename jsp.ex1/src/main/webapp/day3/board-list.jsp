<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	.text{
		font-align : center;
		align-item : center;
		justify-content: center;
		padding : 2px;
		margin right : 50px;
		text-decoration: none;
	}
	.text .active{
		background-color: #ddd;
		padding : 2px;
/* 		font-weight : bold; */
	}
	a {
		font-align : center;
		align-item : center;
		justify-content: center;
		padding : 2px;
		margin right : 50px;
		text-decoration: none;
		color : black;
	}
</style>
</head>
<body>
<%@include file="../db.jsp" %>

	<select id="number" onchange="fnNumber(this.value)">
	<%
		int arr[] = {3,5,10,15,20};
		for(int i=0; i<arr.length; i++){		
	
	%>
	</select>
	<%
		int pageSize = 5; //한 페이지에 몇개씩 보여줄지 정하는 변수
		int currentPage = 1;
		int offset = (currentPage-1) * pageSize;
		
		if(request.getParameter("page") != null){
			currentPage = Integer.parseInt(request.getParameter("page"));
		};
/* 		if(request.getParameter("size") != null){
			currentPage = Integer.parseInt(request.getParameter("size"));
		}; */
		
		
		ResultSet rs = null;
	

			
			ResultSet rsCnt = stmt.executeQuery("SELECT COUNT(*) AS TOTAL FROM BOARD");
			rsCnt.next();
			int total = rsCnt.getInt("TOTAL");
			//total : 21, pageSize : 5
			int pageList = (int) Math.ceil((double)total / pageSize); //4.xxxx 이걸 올림하면 된다.
			//ceil(올림), round(반올림), floor(내림)
			
			rs = stmt.executeQuery("SELECT * FROM BOARD "
									+ "OFFSET " + offset + " ROWS FETCH NEXT " + pageSize + " ROWS ONLY"
									
									);
			
				out.println("<table border=1>");
				out.println("<tr>");
				out.println("<th>번호</th>");
				out.println("<th>제목</th>");
				out.println("<th>작성자</th>");
				out.println("<th>조회수</th>");
				out.println("<th>작성일</th>");
				out.println("</tr>");
									
								
				while(rs.next()){									
										
					out.println("<tr>");
					out.println("<td>" + rs.getString("BOARDNO") + "</td>");
					out.println("<td>" + rs.getString("TITLE") + "</td>");
					out.println("<td>" + rs.getString("USERID") + "</td>");
					out.println("<td>" + rs.getString("CNT") + "</td>");
					out.println("<td>" + rs.getString("CDATETIME") + "</td>");
					out.println("</tr>");
									
				}
				out.println("</table>");
								
	%>	
	<%
		if(currentPage != 1){
			out.println("<a href='?page=" + (currentPage-1) + "'>◀</a>");
		}
		for(int i=1; i<=pageList; i++){
			if(currentPage == i){
				out.println("<a href='?page=" + i + "' class='active'>" + i + "</a>");
			} else {
				out.println("<a href='?page=" + i + "'>" + i + "</a>");
			}
		}
		if(currentPage != pageList){
			out.println("<a href='?page=" + (currentPage+1) + "'>▶</a>");
		}
	%>
		<div class="text">

		</div>
		<input hiddent id="pageSize" value="<%= pageSize %>">

</body>
</html>

<script>
	
	let pageSize = document.querySelector("#pageSize").value;
	let number = document.querySelector("#number");
	for(let i=0; i<number.length; i++){
		if(number[i].value == pageSize){
			number[i].selected = true;
		}
	}
	
	
	function fnNumber(num){
		location.href="?size="+num;
	}

</script>