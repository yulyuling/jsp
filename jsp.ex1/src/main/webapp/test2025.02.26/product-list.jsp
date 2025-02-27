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
			<th>번호</th>
			<th>제품명</th>
			<th>가격</th>
			<th>평점</th>
		</tr>
		
		<%
			String query = 
					"SELECT DISTINCT P.ITEM_NO, P.ITEM_NAME, P.PRICE, SCORE "
					+ "FROM TBL_PRODUCT P "
					+ "LEFT JOIN ( "
					+    "SELECT DISTINCT ITEM_NO, AVG(SCORE) AS SCORE "
					+    "FROM TBL_REVIEW "
					+    "GROUP BY ITEM_NO, SCORE "
					+ ") T ON P.ITEM_NO = T.ITEM_NO";

			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()){
		%>
			<tr>
				<td><%= rs.getString("ITEM_NO") %></td>
				<td><a href="product-view.jsp?itemNo=<%=rs.getString("ITEM_NO")%>"><%= rs.getString("ITEM_NAME")%></a></td>
				<td><%= rs.getString("PRICE") %></td>
				<td><%= rs.getString("SCORE") %></td>
			</tr>
		<%
			}
		%>
	</table>
	<div>
		<input type="button" value="제품추가" onclick="fnAdd()">
	</div>
	

</body>
</html>
<script>
	function fnAdd(){
		location.href="product-add.jsp?itemNo=" + itemNo;
	}
</script>