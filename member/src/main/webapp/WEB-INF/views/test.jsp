<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	ul{
		text-align:center;
		width:100px;
		margin:auto;
		padding:0;
		border:1px solid green;
		list-style:none;
	}
	li{
		margin:20px 0;
		border:1px solid hotpink;
	}
	#sub{
		visibility:hidden;
	}
</style>
<script>
	function mview(){
		document.querySelector("#sub").style.visibility="visible";
	}
</script>
</head>
<body>
		<ul onmouseover="mview()" class="main">정보
			<li id="sub">AAAA</li>
			<li id="sub">BBBB</li>
			<li id="sub">CCCC</li>
		</ul>
</body>
</html>