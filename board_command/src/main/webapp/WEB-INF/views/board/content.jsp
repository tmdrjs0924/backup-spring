<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		table {
			margin-top:50px;
			border-spacing:0px;
		}
		td {
			border-top:1px solid black;
		}
	</style>
</head>
<body>
	<table align="center">
		<tr>
			<td colspan="3" width="800"><h3>${bdto.title }</h3></td>
		</tr>
		<tr height="30">
			<td>${bdto.name }</td>
			<td width="100" align="center">조회${bdto.readnum }</td>
			<td width="100" align="center">${bdto.writeday }</td>
		</tr>
		<tr>
			<td colspan="3" height="400" valign="top">${bdto.content }</td>
		</tr>
		<tr>
			<td colspan="3" align="right"><input type="button" value="목록" onclick="location='list'"></td>
		</tr>
	</table>
</body>
</html>