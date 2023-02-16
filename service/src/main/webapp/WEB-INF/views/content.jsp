<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		* {
			box-sizing:border-box;
		}
		table {
			border-spacing:0px;
			margin:auto;
			margin-top:50px;
		}
		table td {
			height:28px;
			border-top:1px solid black;
		}
		#title {
			width:900px;
			font-weight:600;
			font-size:35px;
			text-indent:5px;
		}
		#readnum {
			width:100px;
		}
		#writeday {
			width:100px;
		}
		#content {
			height:500px;
			vertical-align:top;
			padding:5px;
		}
		#btn {
			color:black;
			background:white;
			width:150px;
			height:30px;
			font-weight:600;
			border:1px solid black;
		}
		#delbtn {
			color:black;
			background:white;
			width:150px;
			height:30px;
			font-weight:600;
			border:1px solid black;
		}
		#delform {
			display:none;
		}
		#dbtn {
			color:black;
			background:white;
			width:50px;
			height:30px;
			font-weight:600;
			border:1px solid black;
		}
		#pwd {
			outline:none;
			width:50px;
			height:27px;
		}
	</style>
	<script>
		function view_del(){
			document.getElementById("delform").style.display="inline";
			document.getElementById("delbtn").style.display="none"
		}
		function hide_del(){
			document.getElementById("delform").style.display="none";
			document.getElementById("delbtn").style.display="inline"
		}
	</script>
</head>
<body>
	<table>
		<tr>
			<td colspan="3" id="title">${bvo.title}</td>
		</tr>
		<tr>
			<td id="name">${bvo.name}</td>
			<td id="readnum">${bvo.readnum}</td>
			<td id="writeday">${bvo.writeday}</td>
		</tr>
		<tr>
			<td colspan="3" id="content">${bvo.content}</td>
		</tr>
		<tr>
			<td colspan="3" align="right">
				<input type="button" value="목록" onclick="location='list'" id="btn">
				<input type="button" value="수정" onclick="location='update?id=${bvo.id}&page=${page}&rnum=${rnum}'" id="btn">
				<form method="post" action="delete" id="delform">
					<input type="hidden" name="id" value="${bvo.id}">
					<input type="hidden" name="page" value="${page}">
					<input type="hidden" name="rnum" value="${rnum}">
					<input type="password" name="pwd" id="pwd">
					<input type="submit" value="확인" id="dbtn">
					<input type="button" value="취소" onclick="hide_del()" id="dbtn">
				</form>
				<input type="button" value="삭제" onclick="view_del()" id="delbtn">
			</td>
		</tr>
	</table>
</body>
</html>