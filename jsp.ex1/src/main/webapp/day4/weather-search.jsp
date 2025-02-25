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

	시 : <select id="si" onchange="fnSelectSi(this.value)">
	<option>선택</option>
	<%
		String paramSi = request.getParameter("paramSi");
		String query = "SELECT DISTINCT SI FROM AREA";
		ResultSet rs = stmt.executeQuery(query);
		
		while(rs.next()){
			String si = rs.getString("SI");
			String selected = si.equals(paramSi) ? "selected" : "";
	%>
		<option value="<%= si %>" <%= selected %>><%= si %></option>
	<%
		}		
	%>
	</select>
	
	
		구 : <select onchange="fnSelectGu(this.value, '<%= paramSi %>')">
	<option>선택</option>
	<%
		String paramGu = request.getParameter("paramGu");
		query = "SELECT DISTINCT GU FROM AREA WHERE SI='" + paramSi + "' AND GU IS NOT NULL";
		rs = stmt.executeQuery(query);
		
		while(rs.next()){
			String gu = rs.getString("GU");
			String selected = gu.equals(paramGu) ? "selected" : "";
	%>
		<option value="<%= gu %>" <%= selected %>><%= gu %></option>
	<%
		}		
	%>
	</select>

	
	동 : <select>
	<option>선택</option>
	<%
		query = "SELECT DISTINCT DONG, NX, NY FROM AREA WHERE SI='" + paramSi + "' AND DONG IS NOT NULL";
		rs = stmt.executeQuery(query);
		
		while(rs.next()){
			String dong = rs.getString("DONG");
			String nx = rs.getString("NX");
			String ny = rs.getStrng("NY");
	%>
		<option value="<%= dong %>" data-nx="<%=nx%>" data-ny="<%= ny%>"><%= dong %></option>
	<%
		}		
	%>
	</select>
</body>
</html>

<script>

	function fnSelectSi(value){
		location.href = "?paramSi=" + value;
	}

	function fnSelectGu(value, paramSi){
		location.href = "?paramGu=" + value + "&paramSi=" + paramSi;
	}

	function fnApiCall(){
		var xhr = new XMLHttpRequest();
		var url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst';
		var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'rnbVy1tyUQlQXFdP30L6uBhaGhIhEPDRFPFF70E1xuX9SJmL0LzOfKqAxUMroQIgHH8VRxEI9Ye6oKigW37P%2Bg%3D%3D';
		queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1');
		queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('1000');
		queryParams += '&' + encodeURIComponent('dataType') + '=' + encodeURIComponent('JSON');
		queryParams += '&' + encodeURIComponent('base_date') + '=' + encodeURIComponent('20250225');
		queryParams += '&' + encodeURIComponent('base_time') + '=' + encodeURIComponent('1000');
		queryParams += '&' + encodeURIComponent('nx') + '=' + encodeURIComponent('55');
		queryParams += '&' + encodeURIComponent('ny') + '=' + encodeURIComponent('125');
		xhr.open('GET', url + queryParams);
		xhr.onreadystatechange = function () {
		    if (this.readyState == 4) {
		        console.log('Status: '+this.status+'\nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'\nBody: '+this.responseText);
		    }
		};
		xhr.send();
	};
</script>
