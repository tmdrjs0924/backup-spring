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
<%
		String[] name={"배트맨","슈퍼맨","뽀로로","홍길동","헐크","원더우먼"};
		
		// 기본 for문
		for(int i=0;i<name.length;i++){
			out.print(name[i]+"<br>");
		}
		
		out.print("<hr>");
		
		// 향상된 for문
		for(String n : name){
			out.print(n+"<br>");
		}
		request.setAttribute("name", name);
%>
	<hr>
	
	<c:forEach var="i" begin="0" end="5">
		${name[i]}<br>
	</c:forEach>
	<hr>
	
	<c:forEach var="nam" items="${name}">
		${nam}<br>
	</c:forEach>
	
</body>
</html>