<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		table
		{
			margin:auto;
			margin-top:100px;
			text-align:center;
			border-spacing:0px;
		}
		table tr:nth-child(n+2) td
		{
			border-top:1px solid black;
			height:25px;
			font-size:14px;
		}
		table tr:last-child td
		{
			border-top:none; 
			padding-top:10px;
		}
		a
		{
			text-decoration:none;
			color:black;
			opacity:0.8;
		}
		#caption td
		{
			text-align:center;
			font-weight:700;
			font-size:15px;
		}
		#title
		{
			text-align:left;
			text-indent:15px;
			cursor:pointer;
		}
		#button
		{
			text-align:right;
		}
		#noneline
		{
			border-top:none;
		} 
		#button input
		{
			background:white;
			color:#111;
			border:1px solid black;
			width:70px;
			height:28px;
		}
	</style>
</head>
<body>
	<table>
		<tr id="caption">
			<td width="700">제목</td>
			<td width="100">작성자</td>
			<td width="100">등록일</td>
			<td width="100">조회수</td>
		</tr>
		<c:forEach var="bdto" items="${list}">
		<tr>
			<td id="title">${bdto.title}</td>
			<td>${bdto.name}</td>
			<td>${bdto.writeday}</td>
			<td>${bdto.readnum }</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="4" id="button">
				<input type="button" value="글쓰기" onclick="location='write'">
			</td>
		</tr>
	</table>
</body>
</html>