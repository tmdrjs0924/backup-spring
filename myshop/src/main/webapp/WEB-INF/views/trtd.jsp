<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		#aa {
			margin:auto;
			text-align:center;
		}
	</style>
</head>
<body>
	<table width="500" height="400" align="center" border="1">
		<tr>
		<c:forEach items="${list}" var="str" varStatus="sts">
			<td>${str}</td>
		<c:if test="${sts.count%4==0}">
		</tr>
		<tr>	
		</c:if>
		</c:forEach>
		</tr>
	</table>
	<hr>
	
	<table width="500" height="400" align="center" border="1">
		<tr>
		<c:forEach begin="1" end="24" var="i">
			<td></td>
		<c:if test="${i%4==0}">
		</tr>
		<tr>
		</c:if>
		</c:forEach>
		</tr>
	</table>
	<hr>
	
	<!-- format관련 -->
	<div id="aa">
		100000 <br>
		<fmt:formatNumber value="100000" type="number"></fmt:formatNumber><br>
		<fmt:formatNumber value="100000" type="currency" currencySymbol="$"></fmt:formatNumber><br>
		<fmt:formatNumber value="0.11" type="percent"></fmt:formatNumber><br>
		<fmt:formatNumber value="123.491231298" pattern=".000"></fmt:formatNumber><br>
	</div>
</body>
</html>