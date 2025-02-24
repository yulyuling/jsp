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
	
	<%
		//1. db연결 
		//2. try-catch()
		//3. statement executeUpdate();
		//4.리턴 값이 1 이상이면 삭제된거
			String stuNo = request.getParameter("stuNo");
		try{
			int result = stmt.executeUpdate(
				"DELETE FROM STUDENT WHERE STU_NO = '" + stuNo + "'"
			);
			if(result > 0){
				out.println("삭제되었습니다.");
			} else {
				out.println("없는 데이터입니다.")
			}
			
		}catch(SQLException e){
			out.println("오류 발생!");
		}	
	%>
</body>
</html>