<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%@include file="../db.jsp" %>
	<form action="stu-update-result.jsp">

	
	<%
	//1. db연결 
	//2. try-catch()
	//3. statement executeQuery(); 함수로 쿼리 호출
	//4. 이름, 학과 input에 db에서 조회한 결과를 넣기
	
		String stuNo = request.getParameter("stuNo");
			try{
				ResultSet rs = stmt.executeQuery(
					"SELECT * FROM STUDENT WHERE STU_NO = '" + stuNo +"'");
				if(rs.next()){
					String stuName = rs.getString("STU_NAME");
					String stuDept = rs.getString("STU_DEPT");
				} else {
					 out.println("해당 학번의 학생 정보가 존재하지 않습니다.");
				}			
				
			} catch(SQLException e) {
				out.println("오류 발생!");
			}	
	%>
		<input name="stuNo" value="<%= stuNo %>" hidden>
		<div>
			이름 : <input name="stuName" value="<%=stuName%>">
		</div>
		<div>
			학과 : <input name="stuDept" value="<%=stuDept%>">
		</div>
		<input type="submit" value="저장">
	</form>
</body>
</html>