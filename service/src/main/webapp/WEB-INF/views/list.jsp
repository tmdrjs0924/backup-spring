<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		a {
			text-decoration:none;
			color:black;
		}
		a:hover {
			color:dimgrey;
		}
		table {
			border-spacing:0px;
			margin:auto;
			margin-top:50px;
			text-align:center;
		}
		table td {
			height:25px;
			border-top:1px solid black;
		}
		#title {
			width:600px;
		}
		#title2 {
			text-align:left;
			text-indent:5px;
		}
		#name {
			width:100px;
		}
		#readnum {
			width:100px;
		}
		#writeday {
			width:100px;
		}
		#btn {
			color:black;
			background:white;
			width:150px;
			height:30px;
			font-weight:600;
			border:1px solid black;
			float:right;
		}
	</style>
</head>
<body>
	<table>
		<tr>
			<th id="title">제목</th>
			<th id="name">작성자</th>
			<th id="readnum">조회</th>
			<th id="writeday">작성일</th>
		</tr>
		<c:forEach items="${list}" var="bvo">
		<tr>
			<td id="title2"><a href="readnum?id=${bvo.id}&page=${page}&rnum=${rnum}">${bvo.title}</a></td>
			<td>${bvo.name}</td>
			<td>${bvo.readnum}</td>
			<td>${bvo.writeday}</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="4">
				<input type="button" value="글쓰기" onclick="location='write'" id="btn">
			</td>
		</tr>
	</table>
</body>
</html>