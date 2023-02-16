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
			border-spacing:0px;
			width:1000px;
		}
		table td
		{
			height:33px;
			border-top:1px solid dimgray;
			box-sizing:border-box;
		}
		#title
		{
			height:45px;
			text-indent:8px;
			font-size:35px;
			font-weight:600;
		}
		#name
		{
			text-indent:15px;
			font-size:14px;
		}
		#readnum
		{
			width:80px;
			text-align:center;
		}
		#writeday
		{
			width:120px;
			text-align:center;
		}
		#content
		{
			padding-top:15px;
			padding-left:10px;
			height:600px;
			vertical-align:top;
		}
		#button
		{
			background:#fff;
			border:1px solid dimgray;
			width:70px;
			height:33px;
			
		}
		#delform
		{
			display:none;
		}
		#pwd
		{
			width:56px;
			height:32px;
			outline:none;
		}
	</style>
	<script>
		function view_del()
		{
			document.getElementsByClassName("delbtn")[0].style.display="none";
			document.getElementById("delform").style.display="inline";
		}
		function hide_del()
		{
			document.getElementById("delform").style.display="none";
			document.getElementsByClassName("delbtn")[0].style.display="inline";
		}
	</script>
</head>
<body>
	<table>
		<tr>
			<td colspan="3" id="title">${bdto.title}</td>
		</tr>
		<tr>
			<td id="name">${bdto.name}</td>
			<td id="writeday">${bdto.writeday}</td>
			<td id="readnum">조회${bdto.readnum}</td>
		</tr>
		<tr>
			<td colspan="3" id="content">${bdto.content}</td>
		</tr>
		<tr>
			<td colspan="3" align="right">
				<div>
					<input type="button" value="목록" onclick="location='list?page=${bdto.page}&rnum=${bdto.rnum}&field=${bdto.field}&keyword=${bdto.keyword}'" id="button">
					<input type="button" value="수정" onclick="location='update?id=${bdto.id}&page=${bdto.page}&rnum=${bdto.rnum}&field=${bdto.field}&keyword=${bdto.keyword}'" id="button">
					<form id="delform" method="post" action="delete">
						<input type="hidden" name="keyword" value="${bdto.keyword}">
						<input type="hidden" name="field" value="${bdto.field}">
						<input type="hidden" name="rnum" value="${bdto.rnum}">
						<input type="hidden" name="page" value="${bdto.page}">
						<input type="hidden" name="id" value="${bdto.id}">
						<input type="password" name="pwd" placeholder="비밀번호" id="pwd">
						<input type="submit" value="확인" id="button">
						<input type="button" value="취소" onclick="hide_del()" id="button">
					</form>
					<input type="button" value="삭제" onclick="view_del()" id="button" class="delbtn">
				</div>
			</td>
		</tr>
	</table>
</body>
</html>