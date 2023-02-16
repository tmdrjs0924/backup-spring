<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
		<style>
			*
			{
				font-size:30px;
			}
			a
			{
				text-decoration:none;
				padding:10px;
			}
		</style>
</head>
<body>
	<div>
		Home<br>
		<a href="pkc">pkc</a>
		<a href="test">test</a>
		<p>
	</div>
	<div>
		Board<br>
		<a href="board/write">board/write</a>
		<a href="board/list">board/list</a>
		<a href="board/content">board/content</a>
		<p>
	</div>
	<div>
		Gongji<br>
		<a href="gongji/write">gongji/write</a>
		<a href="gongji/list">gongji/list</a>
		<a href="gongji/content">gongji/content</a>
		<p>
	</div>
	<div>
		Tour<br>
		<a href="tour/write">tour/write</a>
		<a href="tour/list">tour/list</a>
		<a href="tour/content">tour/content</a>
		<p>
	</div>
</body>
</html>
