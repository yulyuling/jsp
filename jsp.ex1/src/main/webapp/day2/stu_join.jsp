<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 학번, 이름, 학과, 성별 -->
	<!-- stu-join-result.jsp ㅇㅔ서 db코드 실행할거다 -->
	
	<form name="stu" action="stu-join-result.jsp">
		<div>
			학번 : <input name="stuNo">
				<input type="button" value="중복체크" onclick="fnCheck()">
			<!-- id-check.jsp 페이지로 이동 -->
			<!-- 입력한 학번 같이 넘기기 팝업으로 200x200 사이즈로 -->
		</div>
		<div>
			이름 : <input name="stuName">
		</div>
		<div>
			학과 : <input name="stuDept">
		</div>
		<div>
			성별 : 
			<input type="radio" name="gender" value="M" checked>남자
			<input type="radio" name="gender" value="F">여자
		</div>
		<div> 
			<input type="button" value="저장" onclick="fnStuInsert()">
		</div>
	</form>
	
</body>
</html>

<script>
	let checkFlg = false;
	function fnStuInsert(){
		let stu = document.stu;
		if(stu.stuNo.value.length != 8){
			alert("학번은 8글자 해야 됨");
			return;			
		}
		if(stu.stuName.value == "" || stu.stuDept.value == ""){
			alert("모든 값을 채워주세요.");
			return;
		}
		if(checkFlg = false){
			alert("중복 체크 후 다시 시도해주세요.");
			return;
		} else {
			alert("등록되었습니다.");
			return;
		}
		stu.submit();
			
	}
	function fnCheck(){
		let stu = document.stu;
		if(stu.stuNo.value.length != 8){
			alert("학번은 8글자 해야 됨");
			return;			
		}
		window.open(
			"id-check.jsp?stuNo=" + stu.StuNo.value,
					"check",
					"width= 300, height=300"
		);
	}
			
		}
	}
	}
</script>