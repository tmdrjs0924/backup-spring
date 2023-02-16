<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="write_ok" enctype="multipart/form-data">
		<table align="center">
			<tr>
				<td><input type="text" name="title" placeholder="제목" size="68"></td>
			</tr>
			<tr>
				<td><textarea cols="70" rows="7" name="content" placeholder="내용"></textarea></td>
			</tr>
			<tr>
			<tr>
				<td><input type="file" name="fname"></td>
			</tr>
			<tr>
				<td><input type="submit" value="글쓰기"></td>
			</tr>
		</table>
	</form>
</body>
</html>