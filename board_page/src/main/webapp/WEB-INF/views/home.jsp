<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	<c:forEach items="${name}" var="nam">
	    ${nam} <br>
	</c:forEach>   
	<hr>
	
	<c:forEach items="${list1}" var="food">
	   ${food} <br>
	</c:forEach>
	<hr>
	
	<c:forEach items="${slist}" var="sdto">
		이름(${sdto.getName()}) 국(${sdto.getKor()}) 영(${sdto.eng}) 수 (${sdto.mat}) <br>
	</c:forEach>
	
	
</body>
</html>
