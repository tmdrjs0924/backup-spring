<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<style>
		a {
			text-decoration:none;
			color:black;
		}
	</style>
</head>
<body>
	<!-- 그림파일 보이기 -->
	<!-- resources/img/7.jpg -->
	<!-- views/img/5.jpg -->
	<img src="resources/img/7.jpg" width="200">
	<img src="img/5.jpg" width="200">
	<hr>
	<a href="write">write</a> <p>
	<a href="list">list</a>
</body>
</html>
