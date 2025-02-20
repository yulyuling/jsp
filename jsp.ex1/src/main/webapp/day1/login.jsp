<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- form은 정말 중요한 태그다 / 새로운 페이지로 넘어가면서 인풋에 있는 것들을 쉽게 넘겨준다. -->
	<form action="login-result.jsp" method="get"> <!-- get을 생략하면 get으로 자동 -->
		<div>
			아이디 : <input name="id">
		</div>
		<div>
			패스워드 : <input type="password" name="pwd">
		</div>
		<input type="submit" value="로그인">
	</form>
</body>
</html>