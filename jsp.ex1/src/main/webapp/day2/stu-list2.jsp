<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	
<body>
	<%@include file="../db.jsp" %>	
	
	<table>
		<tr>
			<th>학번</th>
			<th>이름</th>
			<th>학과</th>
			<th>성별</th>
		</tr>
	
	<%
		ResultSet rs = null;
		try{
			rs = stmt.executeQuery("SELECT * FROM STUDENT");
			//학생의 이름, 학번, 학과, 성별(남자,여자) 출력
						
			while(rs.next()){
				String stuNo = rs.getString("STU_NO");
	%>
			<tr>
				<td><input type="radio" name="student" value="<%= stuNo%>"></td>
				<td><%= stuNo %></td>
				<td>
				<a href="stu-view.jsp?stuNo=<%=stuNo%>"><%=rs.getString("STU_NAME") %></a>
				</td>
				<td><%=rs.getString("STU_DEPT") %></td>
				<td><%=rs.getString("STU_GENDER").equals("M") ? "남자" : "여자" %></td>
			</tr>
	
	<%												
			}		
		}catch(SQLException e){
			out.println("오류 발생!");
		}	
	%>
	</table>
	<div>
		<button onclick="fnStuRemove()">삭제</button>
	</div>
	
</body>
</html>
<script>
	function fnStuRemove(){
		let select = document.querySelector("input[name='student']:checked");
		console.log.(select.value);
		//stu-delete.jsp 페이지로 이동
		//학번을 넘겨서
		location.href="stu-delete.jsp?stuNo="+select.value;
	}
</script>