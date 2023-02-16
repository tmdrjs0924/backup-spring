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
			float:right;
		}
	</style>
	<script>
		function init()
		{
			document.getElementsByName("bimil")[${bdto.bimil}].checked=true;
		}
		function check()
		{
			var uf=document.getElementById("updateform");
			if(uf.title.value.trim()=="")
			{
				alert("제목을 입력하세요.");
				return false;
			}
			else if(uf.name.value.trim()=="")
			{
				alert("작성자를 입력하세요.");
				return false;
			}
			else if(uf.pwd.value.trim()=="")
			{
				alert("비밀번호를 입력하세요.");
				return false;
			}
			else
				return true;
		}
	</script>
</head>
<body onload="init()">
	<form id="updateform" method="post" action="update_ok" onsubmit="return check()">
		<input type="hidden" name="keyword" value="${bdto.keyword}">
		<input type="hidden" name="field" value="${bdto.field}">
		<input type="hidden" name="rnum" value="${bdto.rnum}">
		<input type="hidden" name="page" value="${bdto.page}">
		<input type="hidden" name="id" value="${bdto.id}">
		<table>
			<tr>
				<td><input type="text" name="title" id="title" value="${bdto.title}"></td>
			</tr>
			<tr>
				<td><textarea name="content" id="content">${bdto.content}</textarea></td>
			</tr>
			<tr>
				<td><input type="text" name="name" id="name" value="${bdto.name}"></td>
			</tr>
			<tr>
				<td><input type="password" name="pwd" id="pwd" placeholder="비밀번호확인"></td>
			</tr>
			<tr>
				<td>공개 <input type="radio" name="bimil" value="0"> 비공개 <input type="radio" name="bimil" value="1"></td>
			</tr>
			<tr>
				<td>
					<input type="button" value="취소" onclick="location='content?id=${bdto.id}&page=${bdto.page}&rnum=${bdto.rnum}&field=${bdto.field}&keyword=${bdto.keyword}'" id="button">
					<input type="submit" value="수정" id="button">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>