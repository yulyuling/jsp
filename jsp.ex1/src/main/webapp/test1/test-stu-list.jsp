<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, th, tr, td {
		border: 1px solid black;
		border-collapse: collapse;
		padding: 10px;
		text-align: center;
	}
</style>
</head>
<body>
	<%@include file="../db.jsp"%>
	
	<table>
		<tr>
			<th>학번</th>
			<th>이름</th>
			<th>학과</th>
			<th>평균점수</th>
		</tr>
		
		<%
			String query = 
					"SELECT S.STU_ID, S.STU_NAME, S.STU_DEPT, GRADE "
					+ "FROM TBL_STULIST S "
					+ "INNER JOIN ( "
					+   "SELECT STU_ID, AVG(GRADE) AS GRADE "
					+   "FROM TBL_GRADE "
					+   "GROUP BY STU_ID "
					+ ") T ON S.STU_ID = T.STU_ID "
					+ "ORDER BY GRADE DESC";
		
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()){	
		%>
			<tr>
				<td><%=rs.getString("STU_ID")%></td>
				<td><%=rs.getString("STU_NAME")%></td>
				<td><%=rs.getString("STU_DEPT")%></td>
				<td><%=rs.getString("GRADE")%></td>
			</tr>
		
		<%
			}		
		%>
	</table>
	<div>
		<button>학생추가</button>
	</div>
</body>
</html>