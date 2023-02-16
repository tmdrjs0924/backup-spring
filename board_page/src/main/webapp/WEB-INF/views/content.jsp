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
		table tr:last-child td
		{
			border-top:none;
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
			display:none;
			float:right;
		}
	</style>
	
	<script>
		function del_view(){
			if(document.getElementById("delform").style.display=="none")
				document.getElementById("delform").style.display="inline";
			else
				document.getElementById("delform").style.display="none";
		}
		window.onload=function(){
		const urlParams=new URL(location.href).searchParams;
		const chk=urlParams.get("chk");
		if(chk!=null){
			alert("비밀번호가 틀렸습니다");
			document.getElementById("delform").style.display="inline";
		}
	}
	</script>
</head>
<body>
	<table>
		<tr>
			<td colspan="3" id="title"><h3>${title}</h3></td>
		</tr>
		<tr>
			<td id="name">${name}</td>
			<td id="readnum">조회${readnum}</td>
			<td id="writeday">${writeday}</td>
		</tr>
		<tr>
			<td colspan="3" id="content">${content}</td>
		</tr>
		<tr>
			<td colspan="3" id="button">
				<input type="button" value="목록" onclick="location='list'">
				<input type="button" value="수정" onclick="location='update?id=${id}'">
				<input type="button" value="삭제" onclick="del_view()">
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<form method="post" action="delete" id="delform">
					<input type="hidden" name="id" value="${id}">
					<input type="password" name="pwd" placeholder="비밀번호" id="pwd">
					<input type="submit" value="확인" id="btn">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>