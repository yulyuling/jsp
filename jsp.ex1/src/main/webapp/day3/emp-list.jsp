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
<%@include file="../db.jsp" %>
	

	<%
		ResultSet rs = null;
	
		try{
			rs = stmt.executeQuery("SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE, NVL(E1.ENAME, ' ' )AS MGRNAME, DNAME, E.DEPTNO "
									+ "FROM EMP E "
									+ "INNER JOIN SALGRADE S ON E.SAL BETWEEN LOSAL AND HISAL "
									+ "INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO "
									+ "LEFT JOIN EMP E1 ON E.MGR = E1.EMPNO "
									+ "ORDER BY GRADE DESC");
			
									out.println("<table border=1>");
									out.println("<tr>");
									out.println("<th>사번</th>");
									out.println("<th>이름</th>");
									out.println("<th>급여</th>");
									out.println("<th>급여등급</th>");
									out.println("<th>팀장(사수)</th>");
									out.println("<th>부서명</th>");
									out.println("<th>부서번호</th>");
									out.println("</tr>");
									
									while(rs.next()){							
										
										
									out.println("<tr>");
										out.println("<td>" + rs.getString("EMPNO") + "</td>");
										out.println("<td>" + rs.getString("ENAME") + "</td>");
										out.println("<td>" + rs.getString("SAL") + "</td>");
										out.println("<td>" + rs.getString("GRADE") + "</td>");
										
										out.println("<td> <a href='emp-t-chart.jsp?deptNo=" + rs.getString("DEPTNO")
													+"'>" + rs.getString("MGRNAME") + "</td>");
										
										out.println("<td><a href='emp-d-chart.jsp?deptNo=" + rs.getString("DEPTNO")
													+ "'>" + rs.getString("DNAME") + "</a></td>");
										out.println("<td>" + rs.getString("DEPTNO") + "</td>");
									out.println("</tr>");
									}
									out.println("</table>");
			
			
		}catch(SQLException e){
			out.println("오류 발생!");
		}	
	
	
	%>


</body>
</html>