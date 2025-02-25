<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	table,td,th,tr{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 10px;
		text-align: center;
	}
</style>
<body>
	<%@include file="../db.jsp"%>
	<div class="border">
		<table>
			<tr>
				<th>아이디</th>				
				<th>이름</th>				
				<th>과목</th>				
				<th>평균점수</th>				
			</tr>	
	
	<%
		ResultSet rs = null;
		
		rs = stmt.executeQuery("SELECT S.STU_ID AS ID, S.STU_NAME AS NAME, S.STU_DEPT AS DEPT, GRADE "
								+ "FROM TBL_STULIST S "
								+ "INNER JOIN( "
								+ "SELECT STU_ID, AVG(GRADE) AS GRADE "
								+ "FROM TBL_GRADE "
								+ "GROUP BY STU_ID, GRADE "
								+ ") T ON S.STU_ID = T.STU_ID "  
								+ "ORDER BY GRADE DESC"
				);
		while(rs.next()){
	%>
		<tr>
			<td><%= rs.getString("ID")%></td>
			<td><%= rs.getString("NAME")%></td>
			<td><%= rs.getString("DEPT")%></td>
			<td><%= rs.getString("GRADE")%></td>
		</tr>
	
	<%
		}
	%>
		</table>
		<button onclick="fnUpdate()">학생추가</button>
	</div>
</body>
</html>
<script>
	function fnUpdate(){
		location.href="stu-update.jsp"
		
	}
</script>