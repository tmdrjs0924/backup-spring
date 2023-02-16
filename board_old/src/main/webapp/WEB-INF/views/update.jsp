<%@page import="kr.co.board_old.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String chk=request.getParameter("chk"); %>
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
		}
		table tr:last-child td
		{
			text-align:center;
		}
		#title
		{
			width:500px;
			height:20px;
			outline:none;
		}
		#content
		{
			width:500px;
			height:250px;
			outline:none;
		}
		#name
		{
			width:120px;
			height:20px;
			outline:none;
		}
		#pwd
		{
			width:120px;
			height:20px;
			outline:none;
		}
		#button
		{
			background:white;
			color:#111;
			border:1px solid black;
			width:250px;
			height:28px;
		}
	</style>
	<script>
		window.onload=function(){
			if(<%=chk%>!=null){
				alert("비밀번호가 틀렸습니다");
			}
		}
	</script>
</head>
<body>
<%
		BoardDto bdto=(BoardDto)request.getAttribute("bdto");
%>
	<form method="post" action="update_ok">
		<table>
		<input type="hidden" name="id" value="<%=bdto.getId()%>">
			<tr>
				<td><input type="text" name="title" id="title" value="<%=bdto.getTitle()%>"></td>
			</tr>
			<tr>
				<td><textarea name="content" id="content"><%=bdto.getContent()%></textarea>
			</tr>
			<tr>
				<td><input type="text" name="name" id="name" value="<%=bdto.getName()%>"></td>
			</tr>
			<tr>
				<td><input type="password" name="pwd" id="pwd"></td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="수정" id="button">
					<input type="button" value="취소" onclick="location='content?id=<%=bdto.getId()%>'" id="button">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>