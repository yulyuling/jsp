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
	<form name="check">
	<%
		String stuNo = request.getParameter("stuNo");
		
		ResultSet rs = stmt.executeQuery(
				"SELECT * FROM STUDENT WHERE STU_NO = '" + stuNo + "'"
		);
		if(rs.next()){
			out.println("사용중인 학번입니다. 다른 거 쓰세요");
	%>
	
			<input name="flg" value='Y'>
	
	<%
		} else {
			out.println("에헤헤");
	%>
			<input name="flg" value='N'>	
	<%
		}
	%>
	<div>
		<input type="button" onclick="fnBack()" value="되돌아가기">
	</div>
	</form>
</body>
</html>
<script>
	function fnBack(){
		window.opener.getReturn(document.check.flg.value);
		window.close();
	}
	function getReturn(flg){
		if(flg == "N"){
			let obj = document.stu.stuNo;
			checkflg = true;
			obj.disabled = true;
		}
	}
</script>