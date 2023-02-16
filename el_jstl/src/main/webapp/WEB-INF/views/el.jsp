<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--	표현식에서는 자바의 연산이 가능하다	-->
<%
		request.setAttribute("k", 90);
		request.setAttribute("e", 88);
%>
	<div>${k+e}</div>
	<div>${k-e}</div>
	<div>${k*e}</div>
	<div>${k/e}</div>
	<div>${k%e}</div>
	<hr>
	<div>${k<e}</div>
	<div>${k lt e}</div>
	<div>${k>e}</div>
	<div>${k gt e}</div>
	<div>${k<=e}</div>
	<div>${k>=e}</div>
	<div>${k==e}</div>
	<div>${k eq e}</div>
	<div>${k!=e}</div>
	<div>${k ne e}</div>
	<hr>
	<div>${true && true}</div>
	<div>${true || true}</div>
	<div>${true and true}</div>
	<div>${true or true}</div>
	<div>${true && false}</div>
	<div>${true || false}</div>
	<div>${true and false}</div>
	<div>${true or false}</div>
	<div>${false && false}</div>
	<div>${false || false}</div>
	<div>${false and false}</div>
	<div>${false or false}</div>
	<hr>
<%
		request.setAttribute("m", "");
%>
	<div>${m==null}</div>
	<div>${s==null}</div>
	<div>${empty m}</div>
	<div>${empty s}</div>
	<div>${m==""}</div>
	
</body>
</html>