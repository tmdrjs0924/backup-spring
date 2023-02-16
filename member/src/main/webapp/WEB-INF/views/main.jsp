<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<title>Insert title here</title>
	<style>
		body {
			margin:0; padding:0;
			font-family: 'Nanum Gothic', sans-serif;
		}
		#bar {
			opacity:0.3;
		}
		#first {
			width:800px;
			height:30px;
			background:black;
			opacity:0.8;
			margin:auto;
			line-height:30px;
			display:flex;
			justify-content:center;
			text-align:center;
		}
		#first #left {
			font-size:14px;
			color:white;
		}
		#first #right 
		{
			position:absolute;
			left:70%;
			color:white;
		}
		#second {
			width:800px;
			height:30px;
			margin:auto;
			display:flex;
			justify-content:flex-end;
			align-items:flex-end;
			font-size:15px;
		}
		#second > div {
			display:flex;
			margin-right:10px;
		}
		#second a {
			text-decoration:none;
			color:black;
		}
		#third {
			width:800px;
			height:55px;
			margin:auto;
			display:flex;
			justify-content: space-between;
			align-items:flex-end;
		}
		#third #logo {
			display:flex;
			font-size:35px;
		}
		#third #menu {
			width:480px;
			display:flex;
			justify-content:space-evenly;
			font-size:18px;
		}
	</style>
	<script>
		function banner_hide() {
			document.querySelector("#first").style.display="none";
		}
		function member_view() {
			
		}
	</script>
</head>
<body>

	<div id="first">

		<div id="left">*** 설날 특별 이벤트!! 한우 반 값 세일!! ***</div>
		<div id="right" onclick="banner_hide()">x</div>

	</div>

	<div id="second">

	<c:if test="${empty name}">
		<div>
			<div><a href="login">로그인</a></div>
			<div id="bar">&nbsp;│&nbsp;</div>
			<div><a href="member_input">회원가입</a></div>
		</div>
	</c:if>	
	
	<c:if test="${not empty name}">
		<div>
			<div><a href="member_info">${name}</a></div>
			<div id="bar">&nbsp;│&nbsp;</div>
			<div><a href="logout">로그아웃</a></div>
		</div>
	</c:if>

	</div>

	<div id="third">

		<div id="logo">Logo</div>

		<div id="menu">
			<div>남성의류</div>
			<div id="bar">│</div>
			<div>여성의류</div>
			<div id="bar">│</div>
			<div>신발 </div>
			<div id="bar">│</div>
			<div>악세사리</div>
		</div>		
		
	</div>
	
</body>
</html>