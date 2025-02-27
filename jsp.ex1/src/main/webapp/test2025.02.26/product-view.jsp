<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../db.jsp"%>

	<%
		String itemNo = request.getParameter("itemNo");
		String query = 
				"SELECT * FROM TBL_PRODUCT P "
				+ "INNER JOIN TBL_REVIEW R ON P.ITEM_NO = R.ITEM_NO "
				+ "WHERE P.ITEM_NO = '" + itemNo + "'";					
		ResultSet rs = stmt.executeQuery(query);
		rs.next();
		out.println("제품번호 : ");
		out.println(rs.getSting("ITEM_NO"));
		out.println("<br>");
		out.println("제품명 : ");
		out.println(rs.getSting("ITEM_NAME"));
		out.println("<br>");
		out.println("가격 : ");
		out.println(rs.getSting("PRICE"));
		out.println("<br>");
		out.println("평점 : ");
		out.println(rs.getSting("SCORE"));
		out.println("<br>");
		
	%>
	<div>
		<button onclick="fnRemove()">삭제</button>
		<button onclick="fnUpdate()">수정</button>
	</div>
</body>
</html>
<script>
	function fnRemove(){
		let itemNo = <%=itemNo%>
		location.href = "product-delete.jsp?itemNo=" + itemNo;		
	}
	function fnUpdate(){
		alert("현재 수정은 불가능 합니다.");
		location.href = "product-list.jsp";		
	}
</script>