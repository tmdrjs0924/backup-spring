<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			border-spacing:0px;
		}
		table tr:nth-child(n+1) td
		{
			border-top:1px solid black;
			height:25px;
			font-size:14px;
		}
		#title
		{
			box-sizing:border-box;
			text-align:center;
			width:800px;
			font-size:30px;
			line-height:0px;
		}
		#name
		{
			text-indent:10px;
		}
		#readnum
		{
			width:100px;
			text-align:right;
		}
		#writeday
		{
			width:100px;
			text-align:right;
		}
		#content
		{
			box-sizing:border-box;
			padding:10px;
			height:350px;
			vertical-align:top;
		}
		#button
		{
			text-align:right;
		}
		#button input
		{
			background:white;
			color:#111;
			border:1px solid black;
			width:70px;
			height:28px;
		}
		#btn
		{
			background:white;
			color:#111;
			border:1px solid black;
			width:70px;
			height:28px;
		}
		#pwd
		{
			width:60px;
			height:20px;
			outline:none;
			text-align:center;
		}
		#delform
		{
			float:right;
		}
	</style>
</head>
<body>
	<table>
		<tr>
			<td colspan="3" id="title"><h3>${bdto.title}</h3></td>
		</tr>
		<tr>
			<td id="name">${bdto.name}</td>
			<td id="readnum">조회${bdto.readnum}</td>
			<td id="writeday">${bdto.writeday}</td>
		</tr>
		<tr>
			<td colspan="3" id="content">${bdto.content}</td>
		</tr>
		<tr>
			<td colspan="3" id="button">
				<input type="button" value="목록" onclick="location='list'">
				<input type="button" value="수정" onclick="location='update?id=${bdto.id}'">
				<input type="button" value="삭제" onclick="location='delete?id=${bdto.id}'">
			</td>
		</tr>
	</table>
</body>
</html>