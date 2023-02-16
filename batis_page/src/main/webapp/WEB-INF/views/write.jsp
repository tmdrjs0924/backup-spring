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
			margin-top:70px;
			width:1000px;
		}
		#title
		{
			width:1000px;
			height:22px;
			outline:none;
		}
		#content
		{
			width:1000px;
			height:250px;
			outline:none;
		}
		#name
		{
			width:100px;
			height:22px;
			outline:none;
		}
		#pwd
		{
			width:100px;
			height:22px;
			outline:none;
		}
		#button
		{
			background:#fff;
			border:1px solid dimgray;
			width:70px;
			height:33px;
		}
	</style>
	<script>
		function check()
		{
			var wf=document.getElementById("writeform");
			if(wf.title.value.trim()=="")
			{
				alert("제목을 입력하세요.");
				return false;
			}
			else if(wf.name.value.trim()=="")
			{
				alert("작성자를 입력하세요.");
				return false;
			}
			else if(wf.pwd.value.trim()=="")
			{
				alert("비밀번호를 입력하세요.");
				return false;
			}
			else
				return true;
		}
	</script>
</head>
<body>
	<form id="writeform" method="post" action="write_ok" onsubmit="return check()">
		<table>
			<tr>
				<td><input type="text" name="title" placeholder="제목을 입력하세요" id="title"></td>
			</tr>
			<tr>
				<td><textarea name="content" id="content"></textarea></td>
			</tr>
			<tr>
				<td><input type="text" name="name" placeholder="작성자" id="name"></td>
			</tr>
			<tr>
				<td><input type="password" name="pwd" placeholder="비밀번호" id="pwd"></td>
			</tr>
			<tr>
				<td><input type="radio" name="bimil" value="0" checked> 공개 <input type="radio" name="bimil" value="1"> 비공개</td>
			</tr>
			<tr>
				<td align="right">
					<input type="submit" value="글쓰기" id="button">
					<input type="button" value="취소" onclick="location='list'" id="button">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>