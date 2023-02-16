<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		table {
			margin:auto;
		}
	</style>
	<script>
		function check() {
			var mf=document.getElementById("mform");
			if(mf.userid.value.trim()=="") {
				alert("아이디를 입력하세요");
				return false;
			}
			if(mf.name.value.trim()=="") {
				alert("닉네임을 입력하세요");
				return false;
			}
			if(mf.pwd1.value.trim()=="" || mf.pwd.value.trim()="") {
				alert("비밀번호를 입력하세요");
				return false;
			}
			else
				return true;
		}
	</script>
</head>
<body>
	<form id="mform" method="post" action="member_input_ok" onsubmit="return check()">
		<table>
			<tr>
				<td> <input type="text" name="userid" placeholder="아이디 또는 이메일"> </td>
			</tr>
			<tr>
				<td> <input type="text" name="name" placeholder="닉네임"> </td>
			</tr>
			<tr>
				<td> <input type="password" name="pwd1" placeholder="비밀번호"> </td>
			</tr>
			<tr>
				<td> <input type="password" name="pwd" placeholder="비밀번호확인"> </td>
			</tr>
			<tr>
				<td> <input type="submit" value="가입"> </td>
			</tr>
		</table>
	</form>
</body>
</html>