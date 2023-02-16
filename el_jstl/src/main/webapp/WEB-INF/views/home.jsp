<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Home</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%
		int k=90;
		int e=80;
		int tot=k+e;
%>
	<div>합: <%=tot%></div>
	<hr>

	<!--	EL 표현식: request, pageContext, session, application 저장된 값을 표현식을 통해 출력	-->
<%
		String name="원더우먼";
		pageContext.setAttribute("name", "홍길동");
		request.setAttribute("name", "배트맨");
		session.setAttribute("name", "슈퍼맨");
		application.setAttribute("name", "뽀로로");
%>
	<div><%=pageContext.getAttribute("name")%></div>
	<div><%=request.getAttribute("name")%></div>
	<div><%=session.getAttribute("name")%></div>
	<div><%=application.getAttribute("name")%></div>
	<hr>
	
	<!--	EL 표현식: 위의 4개 영역의 값을 출력할 때 간단히 출력할 수 있는 표현식	-->
	<div>이름1: ${pageScope.name}</div>
	<div>이름2: ${requestScope.name}</div>
	<div>이름3: ${sessionScope.name}</div>
	<div>이름4: ${applicationScope.name}</div>
	<hr>
	
	<!--
				EL 표현식은 Scope를 생략가능
				단, Scope를 생략할 경우 pageContext > request > session > application 순으로 출력
				작업 시 내장객체의 영역에 동일한 이름으로 속성을 만들지 못함
	-->
	<div>이름1: ${name}</div>
	<div>이름2: ${name}</div>
	<div>이름3: ${name}</div>
	<div>이름4: ${name}</div>
	<hr>
	
	<!-- 내장객체 영역이 아닌 스크립트에 존재하는 변수는 EL 표현식으로 출력불가 -->
<%
		String hakbun="p1234";
		int m=99;
		
		request.setAttribute("hakbun", hakbun);
		request.setAttribute("m", m);
%>
	<div>학번: ${hakbun}</div>
	<div>수학: ${m}</div>
	
</body>
</html>