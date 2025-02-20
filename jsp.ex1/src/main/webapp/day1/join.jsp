<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<form name="join" action="join-result.jsp" method="get">
		<div>
			아이디 : <input name="id">
		</div>
		<div>
			비밀번호 : <input name="pwd" type="password">
		</div>
		<div>
			비밀번호 확인 : <input name="pwd2" type="password">
		</div>
		<div>
			이름 : <input name ="userName">
		</div>
		<div>
			핸드폰번호 : 
			<select name="phone1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="017">017</option>
				<option value="018">018</option>
				<option value="019">019</option>
			</select>
		</div>
		<div>
			성별 :
			<input type="radio" name="gender" value="M">남
			<input type="radio" name="gender" value="F">여
			<!-- 네임이 같아야 중복체크가 안 된다 -->
		</div>
		<div>
			취미 :
			<input type="checkbox" name="hobby" value="운동">운동
			<input type="checkbox" name="hobby" value="독서">독서
			<input type="checkbox" name="hobby" value="영화">영화
			<input type="checkbox" name="hobby" value="코딩">코딩
			<input type="checkbox" name="hobby" value="게임">게임
			
		</div>
		<div>		
			<input type="button" value="로그인" onclick="fnJoin()">
		</div>
	</form>
	
</body>
</html>

<script>
	function fnJoin(){
		let join = document.join;
		const regEx2 = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g;
		
		if(join.id.value == ""){
			alert("아이디는 6글자 이상, 빈값을 사용하지 않아야합니다.");
			join.id.focus();
			return;
		} else {
			login.submit();
		}
		if(!regEx2.join.pwd || join.pwd.value =="" 
				|| join.pwd.value == join.pwd.lenght <= 6
				|| (pwd).equals == (pwd2).equals){
			alert("비밀번호는 특수문자가 1개 이상 포함되어야하고 pwd,pwd2가 같아야하고 빈값은 넣으면 안됨");
			return;
		}
		login.submit();
	}
</script>