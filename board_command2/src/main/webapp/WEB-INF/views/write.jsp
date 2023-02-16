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
			margin-top:50px;
		}
	</style>
</head>
<body>
	<form method="post" action="write_ok">
		<table align="center">
			<tr>
				<td><input type="text" name="title" placeholder="제목" size=68></td>
			</tr>
			<tr>
				<td><textarea name="content" cols="70" rows="10" placeholder="내용"></textarea></td>
			</tr>
			<tr>
				<td><input type="text" name="name" size="12" placeholder="작성자"></td>
			</tr>
			<tr>
				<td><input type="password" name="pwd" size="12" placeholder="비밀번호"></td>
			</tr>
			<tr>
				<td><input type="checkbox" name="bimil" value="1"> 체크 시 비밀글</td>
			</tr>
			<tr>
				<td align="right"><input type="submit" value="글쓰기"></td>
			</tr>
		</table>
	</form>
</body>
</html>