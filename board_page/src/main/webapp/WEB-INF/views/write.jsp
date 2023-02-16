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
	</style>
</head>
<body>
	<form method="post" action="write_ok">
		<table>
			<tr>
				<td><input type="text" name="title" id="title" placeholder="제목을 입력하세요"></td>
			</tr>
			<tr>
				<td><textarea name="content" id="content" placeholder="내용을 입력하세요"></textarea>
			</tr>
			<tr>
				<td><input type="text" name="name" id="name" placeholder="작성자"></td>
			</tr>
			<tr>
				<td><input type="password" name="pwd" id="pwd" placeholder="비밀번호"></td>
			</tr>
			<tr>
				<td id="button">
					<input type="submit" value="글쓰기">
					<input type="button" value="취소" onclick="location='list'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>