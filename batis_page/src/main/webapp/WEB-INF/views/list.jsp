<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		body
		{
			marign:0px;
			padding:0px;
		}
		table
		{
			margin:auto;
			margin-top:70px;
			border-spacing:0px;
			text-align:center;
			width:1000px;
		}
		table td
		{
			height:28px;
			border-bottom:1px solid dimgray;
		}
		table tr:nth-last-child(-n+3) td
		{
			border-bottom:none;
		}
		a
		{
			text-decoration:none;
			color:black;
		}
		a:hover
		{
			color:lightgrey;
		}
		#caption
		{
			font-size:16px;
			font-weight:600;
		}
		#title
		{
			width:700px;
		}
		#title2
		{
			text-align:left;
			text-indent:10px;
			cursor:pointer;
		}
		#content
		{
			font-size:14px;
		}
		#name
		{
			width:100px;
		}
		#writeday
		{
			width:100px;
		}
		#readnum
		{
			width:100px;
		}
		#button
		{
			background:#fff;
			border:1px solid dimgray;
			width:70px;
			height:33px;
		}
		#rnum
		{
			float:right;
		}
		#page
		{
			font-size:15px;
		}
		#button
		{
			background:#fff;
			border:1px solid dimgray;
			width:70px;
			height:33px;
			float:right;
		}
		#button2
		{
			background:#fff;
			border:1px solid dimgray;
			width:70px;
			height:33px;
		}
		#pwd
		{
			width:150px;
			height:28px;
			outline:none;
			text-indent:5px;
		}
		#bimil
		{
			left:0px;
			top:0px;
			position:absolute;
			width:100%;
			height:100%;
			background:black;
			opacity:0.7;
			display:none
		}
		#bimilform
		{
			display:none;
			position:absolute;
			left:50%;
			top:40%;
			transform:translate(-50%);
		}
	</style>
	<script>
		function rnum(rnum)
		{
			location="list?rnum="+rnum+"&field="+"${field}"+"&keyword="+"${keyword}";
		}
		function init()
		{
			document.getElementById("rnum").value=${rnum};
			document.getElementById("field").value="${field}";
		}
		function bimil_view(id)
		{
			document.getElementById("bimilform").id.value=id;
			document.getElementById("bimil").style.display="block";
			document.getElementById("bimilform").style.display="block";
		}
		function bimil_hide()
		{
			document.getElementById("bimil").style.display="none";
			document.getElementById("bimilform").style.display="none";
			document.getElementById("bimilform").pwd.value="";
		}
	</script>
</head>
<body onload="init()">
	<div id="bimil"></div>
	<form id="bimilform" method="post" action="readnum">
		<input type="hidden" name="keyword" value="${keyword}">
		<input type="hidden" name="field" value="${field}">
		<input type="hidden" name="rnum" value="${rnum}">
		<input type="hidden" name="page" value="${page}">
		<input type="hidden" name="id">
		<input type="password" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요">
		<input type="submit" value="확인" id="button2">
		<input type="button" value="취소" onclick="bimil_hide()" id="button2">
	</form>
	<table>
		<tr>
			<td colspan="4">
				<select id="rnum" onchange="rnum(this.value)">
					<option value="20">20개씩</option>
					<option value="35">35개씩</option>
					<option value="50">50개씩</option>
				</select>
			</td>
		</tr>
		<tr id="caption">
			<td id="title">제목</td>
			<td id="name">작성자</td>
			<td id="writeday">작성일</td>
			<td id="readnum">조회</td>
		</tr>
		<c:forEach var="bdto" items="${list}">
		<tr id="content">
			<c:if test="${bdto.bimil==1}">
				<td id="title2" onclick="bimil_view(${bdto.id})">
					<a>${bdto.title}</a><span style="font-size:11px;">&nbsp;[비공개]</span>
				</td>
			</c:if>
			<c:if test="${bdto.bimil==0}">
				<td id="title2">
					<a href="readnum?id=${bdto.id}&page=${page}&rnum=${rnum}&field=${field}&keyword=${keyword}">${bdto.title}</a>
				</td>
			</c:if>
			<td>${bdto.name}</td>
			<td>${bdto.writeday}</td>
			<td>${bdto.readnum}</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="4" align="right"><input type="button" value="글쓰기" onclick="location='write'" id="button"></td>
		</tr>
		<tr>
			<td colspan="4" id="page">
				
					<c:if test="${page!=1}">
             <a href="list?page=${page-1}">&nbsp;＜&nbsp;</a>
          </c:if>
          <c:if test="${page==1}">
            <a href="" style="color:white">&nbsp;＜&nbsp;</a>
          </c:if>
          
          <c:if test="${page>5 && page+5<chong}">
            <a href="list?page=1">1</a>&nbsp;...&nbsp;
              <c:forEach var="i" begin="${page-4}" end="${page+4}">
                <c:if test="${page==i}">
                  <a href="list?page=${i}" style="border:1px solid black;">&nbsp;${i}&nbsp;</a>
                </c:if>
                <c:if test="${page!=i}">
                  <a href="list?page=${i}">&nbsp;${i}&nbsp;</a>
                </c:if>
              </c:forEach>
              &nbsp;...&nbsp;<a href="list?page=${chong}">${chong}</a> 
          </c:if>
          
          <c:if test="${page<=5}">
            <c:forEach var="i" begin="${pstart}" end="${pend}">
              <c:if test="${page==i}">
                <a href="list?page=${i}" style="border:1px solid black;">&nbsp;${i}&nbsp;</a>
              </c:if>
              <c:if test="${page!=i}">
                <a href="list?page=${i}">&nbsp;${i}&nbsp;</a>
              </c:if>
            </c:forEach>
            &nbsp;...&nbsp;<a href="list?page=${chong}">${chong}</a>
          </c:if>
          
          <c:if test="${page+5 >= chong}">
            <a href="list?page=1">1</a>&nbsp;...&nbsp;
            <c:forEach var="i" begin="${chong-9}" end="${chong}">
              <c:if test="${page==i}">
                <a href="list?page=${i}" style="border:1px solid black;">&nbsp;${i}&nbsp;</a>
              </c:if>
              <c:if test="${page!=i}">
                <a href="list?page=${i}">&nbsp;${i}&nbsp;</a>
              </c:if>
            </c:forEach>
          </c:if>
          
          <c:if test="${page!=chong}">
            <a href="list?page=${page+1}">&nbsp;＞&nbsp;</a>
          </c:if>
          <c:if test="${page==chong}">
            <a href="" style="color:white">&nbsp;＞&nbsp;</a>
          </c:if>
				
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<form mothod="post" action="list">
					<select name="field" id="field">
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="name">작성자</option>
					</select>
					<input type="text" name="keyword" value="${keyword}">
					<input type="submit" value="검색">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>