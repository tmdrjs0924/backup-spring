<%@page import="java.util.Scanner"%>
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
	<!-- 여러 조건 중에 한 가지를 선택하여 실행 -->
<%
		// 0:짜장 1:짬뽕 2:우동 3:볶음밥 4:탕수육
		request.setAttribute("food", 0);
%>
	<c:choose>
		<c:when test="${food==0}">
			자장면을 주문했습니다
		</c:when>
		<c:when test="${food==1}">
			짬뽕을 주문했습니다
		</c:when>
		<c:when test="${food==2}">
			우동을 주문했습니다
		</c:when>
		<c:when test="${food==3}">
			볶음밥을 주문했습니다
		</c:when>
		<c:when test="${food==4}">
			탕수육을 주문했습니다
		</c:when>
		<c:otherwise>
			주문을 잘못했습니다
		</c:otherwise>
	</c:choose>
</body>
</html>