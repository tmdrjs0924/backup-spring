<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${name }. </P>
 ${age }
 <hr>
 <%=request.getAttribute("age") %>
 <hr>
 <a href="list"> list로 이동 </a>
 <hr>
 <a href="test"> test를 get으로 연결 </a> <p>
 <form method="post" action="test">
   <input type="submit" value="test를 post로 연결">
 </form>
 <p>
 <hr>
 <a href="aaa"> aaa를 get으로 </a> <p>
 <a href="bbb"> bbb를 get으로 </a> <p>
 <form method="post" action="aaa">
   <input type="submit" value="aaa를  post로 ">
 </form>
 <form method="post" action="bbb">
   <input type="submit" value="bbb를  post로 ">
 </form>
</body>
</html>
