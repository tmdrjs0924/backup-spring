<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		* {
			box-sizing:border-box;
		}
		a {
			text-decoration:none;
		}
		table {
			margin:auto;
			border-spacing:0px;
		}
		table th {
			width:100px;
		}
		table td {
			border-top:1px solid black;
		}
		#wform {
			text-align:center;
			margin-top:100px;
		}
	</style>
	<script>
		function up(id,hakbun,name,kor,eng,mat){
			document.wform.id.value=id;
			document.wform.hakbun.value=hakbun;
			document.wform.name.value=name;
			document.wform.kor.value=kor;
			document.wform.eng.value=eng;
			document.wform.mat.value=mat;
			document.wform.action="update_ok";
			document.wform.submit.value="확인";
		}
		function del(id) {
			if(confirm("정말 삭제하시겠습니까?")) {
				location="delete?id="+id;
			}	   
		}
	</script>
</head>
<body>
	<form name="wform" id="wform" method="post" action="write_ok">
		<input type="hidden" name="id">
		학번 <input type="text" name="hakbun" size="12"> 
		이름 <input type="text" name="name" size="8"> 
		국어 <input type="text" name="kor" size="8"> 
		영어 <input type="text" name="eng"size="8"> 
		수학 <input type="text" name="mat" size="8"> 
		<input type="submit" value="입력" name="submit">
	</form>
	<p>
	<table>
		<tr>
			<th>학번</th>
			<th>이름</th>
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
			<th>총점</th>
			<th>평균</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<c:forEach items="${list}" var="svo">
		<tr align="center">
			<td>${svo.hakbun}</td>
			<td>${svo.name}</td>
			<td>${svo.kor}</td>
			<td>${svo.eng}</td>
			<td>${svo.mat}</td>
			<td>${svo.tot}</td>
			<td>${svo.avg}</td>
			<td><a href="javascript:up(${svo.id},'${svo.hakbun}','${svo.name}',${svo.kor},${svo.eng},${svo.mat})">click</a></td>
			<td><a href="javascript:del(${svo.id})">click</a></td>
		</tr>
		</c:forEach>
		<tr><td colspan="9"></td></tr>
	</table>
</body>
</html>