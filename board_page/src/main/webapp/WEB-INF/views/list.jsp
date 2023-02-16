<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			text-align:center;
			border-spacing:0px;
		}
		table tr:nth-child(n+2) td
		{
			border-top:1px solid black;
			height:25px;
			font-size:14px;
		}
		table tr:last-child td
		{
			border-top:none; 
			padding-top:10px;
		}
		a
		{
			text-decoration:none;
			color:black;
			opacity:0.8;
		}
		#caption td
		{
			text-align:center;
			font-weight:700;
			font-size:15px;
		}
		#title
		{
			text-align:left;
			text-indent:15px;
			cursor:pointer;
		}
		#button
		{
			text-align:right;
		}
		#noneline
		{
			border-top:none;
		} 
		#button input
		{
			background:white;
			color:#111;
			border:1px solid black;
			width:70px;
			height:28px;
		}
		#rnum
		{
			float:right;
		}
	</style>
	<script>
		function search(){
			if(document.ksg.keyword.value.trim()==""){
				alert("검색어를 입력하세요");
				return false;
			}
			else
				return true;
		}
		function rnum(rnum){
			location="list?rnum="+rnum;
		}
		function init(){
			document.getElementById("field").value="${field}";
			document.getElementById("rnum").value=${rnum};
		}
	</script>
</head>
<body onload="init()">
	<table>
		<tr>
			<td colspan="4">
				<select id="rnum" onchange="rnum(this.value)">
					<option value="20">20개씩</option>
					<option value="50">50개씩</option>
					<option value="100">100개씩</option>
				</select>
			</td>
		</tr>
		<tr id="caption">
			<td width="600">제목</td>
			<td width="100">작성자</td>
			<td width="100">등록일</td>
			<td width="100">조회수</td>
		</tr>
		<c:forEach var="bdto" items="${blist}">
		<tr>
			<td id="title" onclick="location='readnum?id=${bdto.id}'">${bdto.title}</td>
			<td>${bdto.name}</td>
			<td>${bdto.writeday}</td>
			<td>${bdto.readnum }</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="4" id="button">
				<input type="button" value="글쓰기" onclick="location='write'">
			</td>
		</tr>
		<tr>
			<td colspan="4" id="noneline">
				<a href="list?page=1&rnum=${rnum}&field=${field}&keyword=${keyword}">&nbsp;맨앞&nbsp;</a>
				<c:choose>
					<c:when test="${pstart==1}">
						&nbsp;≪&nbsp;
					</c:when>
					<c:when test="${pstart!=1}">
						<a href="list?page=${pstart-1}&rnum=${rnum}&field=${field}&keyword=${keyword}">&nbsp;≪&nbsp;</a>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${page==1}">
						&nbsp;＜&nbsp;
					</c:when>
					<c:when test="${page!=1}">
						<a href="list?page=${page-1}&rnum=${rnum}&field=${field}&keyword=${keyword}">&nbsp;＜&nbsp;</a>
					</c:when>
				</c:choose>
				<c:forEach var="i" begin="${pstart}" end="${pend}">
					<c:choose>
						<c:when test="${page==i}">
							<a href="list?page=${i}&rnum=${rnum}&field=${field}&keyword=${keyword}" style="color:red">&nbsp;${i}&nbsp;</a>
						</c:when>
						<c:when test="${page!=i}">
							<a href="list?page=${i}&rnum=${rnum}&field=${field}&keyword=${keyword}">&nbsp;${i}&nbsp;</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${page==chong}">
						&nbsp;＞&nbsp;
					</c:when>
					<c:when test="${page!=chong}">
						<a href="list?page=${page+1}&rnum=${rnum}&field=${field}&keyword=${keyword}">&nbsp;＞&nbsp;</a>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${pend==chong}">
						&nbsp;≫&nbsp;
					</c:when>
					<c:when test="${pend!=chong}">
						<a href="list?page=${pend+1}&rnum=${rnum}&field=${field}&keyword=${keyword}">&nbsp;≫&nbsp;</a>
					</c:when>
				</c:choose>
				<a href="list?page=${chong}&rnum=${rnum}&field=${field}&keyword=${keyword}">&nbsp;맨뒤&nbsp;</a>
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<form method="post" action="list" onsubmit="search()">
					<select id="field">
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="name">작성자</option>
					</select>
					<input type="text" name="keyword" value="${keyword}" size="15">
					<input type="submit" value="검색">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>