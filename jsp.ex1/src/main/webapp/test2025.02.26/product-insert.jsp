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
		String itemName = request.getParameter("itemName");
		String price = request.getParameter("price");
		String score = request.getParameter("score");
		
		String query =
				"INSERT INTO TBL_PRODUCT "
				+ "VALUES ("
			    + "itemNo_seq.nextval, "
				+ "'" + itemName + "', "
				+ "'" + price + "'"
				+ ")";
		
		stmt.executeUpdate(query);
		out.println("저장되었습니다.");
	%>

</body>
</html>