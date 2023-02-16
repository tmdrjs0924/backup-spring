<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
   이름 : ${student1.name} <br>
   국어 : ${student1.kor} <br>
   영어 : ${student1.eng} <br>
   수학 : ${student1.mat}
	<hr>
   이름 : ${student2.name} <br>
   국어 : ${student2.kor} <br>
   영어 : ${student2.eng} <br>
   수학 : ${student2.mat}
</body>
</html>
