<%@page import="kr.co.board_old.BoardDto"%>
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
		#button > input
		{
			background:white;
			color:#111;
			border:1px solid black;
			width:250px;
			height:28px;
		}
		#btn
		{
			background:white;
			color:#111;
			border:1px solid black;
			width:65px;
			height:28px;
		}
		#pwd
		{
			width:100px;
			height:20px;
			outline:none;
		}
		#delform
		{
			display:none;
		}
	</style>
	
	<script>
	/* 
		const urlParams=new URL(location.href).searchParams;
		const chk=urlParams.get("chk");
	*/
		function del_view(){
			document.getElementById("delform").style.display="inline";
			document.getElementById("delbtn").style.display="none";
		}
		function del_hide(){
			document.getElementById("delform").style.display="none";
			document.getElementById("delbtn").style.display="inline";
		}
	</script>
</head>
<body>
<%
		BoardDto bdto=(BoardDto)request.getAttribute("bdto");
%>
	<table>
		<tr>
			<td colspan="3" id="title"><h3><%=bdto.getTitle()%></h3></td>
		</tr>
		<tr>
			<td id="name"><%=bdto.getName()%></td>
			<td id="readnum">조회<%=bdto.getReadnum()%></td>
			<td id="writeday"><%=bdto.getWriteday()%></td>
		</tr>
		<tr>
			<td colspan="3" id="content"><%=bdto.getContent()%></td>
		</tr>
		<tr>
			<td colspan="3" id="button">
				<input type="button" value="목록" onclick="location='list'">
				<input type="button" value="수정" onclick="location='update?id=<%=bdto.getId()%>'">
				<form method="post" action="delete" placeholder="비밀번호" id="delform">
					<input type="hidden" name="id" value="<%=bdto.getId()%>">
					<input type="password" name="pwd" id="pwd">
					<input type="submit" value="확인" id="btn">
					<input type="button" value="취소" id="btn" onclick="del_hide()">
				</form>
				<input type="button" value="삭제" onclick="del_view()" id="delbtn">
			</td>
		</tr>
	</table>
</body>
</html>