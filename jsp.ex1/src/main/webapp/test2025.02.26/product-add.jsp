<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../db.jsp"%>

	<form name="product" action="product-insert.jsp">
		제품명: <input name="itemName"><br>
		가격:<input name="price">
		<input type="button" value="추가" onclick="fnInsert()">	
	</form>
</body>
</html>
<script>
	function fnInsert(){
		let product = document.product;
		if(product.price.value < 0){
			alert("0보다 큰 값을 입력해주세요");
			return;
		}
		if(product.price.value.length == ""){
			alert("입력되지 않았습니다.");
			return;
		}
		product.submit();
	}
</script>