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
<%
	Connection conn;
	Statement stmt = null;
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String db_url = "jdbc:oracle:thin:@localhost:1521:db";
		String db_id = "system";
		String db_pw = "test1234";
		conn = DriverManager.getConnection(db_url, db_id, db_pw);
		stmt = conn.createStatement();
		out.println("연결됨");
		
		
		} catch (ClassNotFoundException e){
			out.println("JDBC 드라이버 로드오류");
		} catch(SQLException e) {
			out.println("DB 연결 오류");
		}
	
%>

</body>
</html>