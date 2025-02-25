<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../db.jsp"%>
	<form action="stu-update-result.jsp">
		
	<%
		String stuId = request.getParameter("stuId");
		String stuName = request.getParameter("stuName");
		String stuDept = request.getParameter("stuDept");
		String stuSubject = request.getParameter("stuSubject");
		String stuGrade = request.getParameter("stuGrade");
		
		String query = "INSERT INTO TBL_STULIST (STU_ID, STU_NAME, STU_DEPT)"
						+ "VALUES ("
						+ "'" + stuId + "',"
						+ "'" + stuName + "',"
						+ "'" + stuDept + "')";
						
		String query2 = "INSERT INTO TBL_GRADE (STU_ID, SUBJECT, GRADE)"
						+ "VALUES("
						+ "'" + stuId + "',"
						+ "'" + stuSubject + "',"
						+ "'" + stuGrade + "')";			
		
		int result1 = stmt.executeUpdate(query);		   		   
		int result2 = stmt.executeUpdate(query2);
	%>
		<div>
		 아이디 : <input name="stuId" value="<%=stuId%>">
		</div>
		<div>
		 이름 : <input name="stuName" value="<%=stuName%>">
		</div>
		<div>
		 학과 : <input name="stuDept" value="<%=stuDept%>">
		</div>
		<div>
		 과목 : <input name="stuSubject" value="<%=stuSubject%>">
		</div>
		<div>
		 점수 : <input name="stuGrade" value="<%=stuGrade%>">
		</div>
	
		<input type="submit" value="추가">
	</form>
</body>
</html>

<script>

</script>