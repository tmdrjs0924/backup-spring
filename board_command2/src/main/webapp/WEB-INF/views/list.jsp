<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		table{
			border-spacing:0px;
			margin-top:50px;
		}
		td{
			border-top:1px solid black;
			height:25px;
		}
		a {
			text-decoration:none;
			color:black;
		}
		a:hover {
			color:dimgrey;
		}
	</style>
<body>
	<table align="center">
		<tr>
			<th>제목</th>
			<th>작성자</th>
			<th>조회</th>
			<th>작성일</th>
		</tr>
		
		<c:forEach items="${list }" var="bdto">
		<tr>
			<td align="left" width="600" style="text-indent:5px;"><a href="readnum?id=${bdto.id}">${bdto.title }</a></td>
			<td align="center" width="100">${bdto.name }</td>
			<td align="center" width="100">${bdto.readnum }</td>
			<td align="center" width="100">${bdto.writeday }</td>
		</tr>
		</c:forEach>
		
		<tr>
			<td colspan="4" align="right"><input type="button" value="글쓰기" onclick="location='write'"></td>
		</tr>
	</table>
</body>
</html>