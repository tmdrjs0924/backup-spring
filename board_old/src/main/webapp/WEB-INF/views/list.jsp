<%@page import="kr.co.board_old.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		table tr:nth-child(n+1) td
		{
			border-top:1px solid black;
			height:25px;
			font-size:14px;
		}
		a
		{
			text-decoration:none;
			color:black;
			opacity:0.8;
		}
		#caption
		{
			text-align:center;
		}
		#title
		{
			text-align:left;
			text-indent:15px;
		}
		#button input
		{
			background:white;
			color:#111;
			border:1px solid black;
			width:250px;
			height:28px;
		}
	</style>
</head>
<body>
	<table>
		<tr id="caption">
			<th width="600">제목</th>
			<th width="100">작성자</th>
			<th width="100">등록일</th>
			<th width="100">조회수</th>
		</tr>
<%
		ArrayList<BoardDto> blist=(ArrayList<BoardDto>)request.getAttribute("blist");
		for(int i=0;i<blist.size();i++){
%>
		<tr>
			<td id="title"><a href="readnum?id=<%=blist.get(i).getId()%>"><%=blist.get(i).getTitle()%></a></td>
			<td><%=blist.get(i).getName()%></td>
			<td><%=blist.get(i).getWriteday()%></td>
			<td><%=blist.get(i).getReadnum()%></td>
		</tr>
<%
		}
%>
		<tr>
			<td colspan="4" id="button">
				<input type="button" value="글쓰기" onclick="location='write'">
			</td>
		</tr>
	</table>
</body>
</html>