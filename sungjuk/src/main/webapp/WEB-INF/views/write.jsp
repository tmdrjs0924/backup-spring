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
			margin-top:200px;
		}
	</style>
</head>
<body>
	<form method="post" action="write_ok">
		<table>
			<tr>
				<td><input type="text" name="hakbun" placeholder="학번"></td>
			</tr>
			<tr>
				<td><input type="text" name="name" placeholder="이름"></td>
			</tr>
			<tr>
				<td><input type="text" name="kor" placeholder="국어점수"></td>
			</tr>
			<tr>
				<td><input type="text" name="eng" placeholder="영어점수"></td>
			</tr>
			<tr>
				<td><input type="text" name="mat" placeholder="수학점수"></td>
			</tr>
			<tr>
				<td align="center"><input type="submit" value="등록"></td>
			</tr>
		</table>
	</form>
</body>
</html>