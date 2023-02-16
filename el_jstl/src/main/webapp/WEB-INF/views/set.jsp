<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--
			set: 내장객체 영역에 값을 저장하는 태그
	-->
<%
		int k=90;
		int e=80;
				request.setAttribute("k", k);
%>
	<c:set value="<%=e%>" var="e"/>
	<c:set value="홍길동" var="name"/>
	<div>국어: ${k}</div>
	<div>영어: ${e}</div>
	<div>이름: ${name}</div>
	<hr>
	<c:set value="${a+1}" var="a"/>
	변수 a: ${a}
	<hr>
	<!-- set : 변수 생성 -->
	<!-- out : 내장객체 변수 출력 -->
	<div>국어: <c:out value="${k}"/></div>
	<div>영어: ${e}</div>
	<div>과학: <c:out value="${s}"/></div>
	<div>과학: <c:out value="${s}" default="존재하지 않음"/></div>
	
</body>
</html>