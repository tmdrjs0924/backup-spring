<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script>
		function add(){
			document.pkc.food.options.length=5;
			document.pkc.food.options[1].text="짬뽕";
			document.pkc.food.options[1].value='120';
			document.pkc.food.options[2].text="탕수육";
			document.pkc.food.options[2].value="121";
			document.pkc.food.options[3].text="팔보채";
			document.pkc.food.options[3].value="122";
			document.pkc.food.options[4].text="짜장면";
			document.pkc.food.options[4].value="119";
		}
		function add2(){ 
			var str="<option value='11'> 볶음밥 </option>";
			str=str+"<option value='12'> 잡채밥 </option>";
			str=str+"<option value='13'> 짜장밥 </option>";
			str=str+"<option value='14'> 짬뽕밥 </option>";
			
			document.pkc2.food.innerHTML=document.pkc2.food.innerHTML+str;
		}
	</script>
</head>
<body>
	<!--
			select 태그에 option 태그를 자바스크립트에서 추가
	-->
	<input type="button" onclick="add()" value="옵션추가">
	<form name="pkc">
		<select name="food">
			<option>선택</option>
		</select>
	</form>
	<hr>
	<input type="button" onclick="add2()" value="옵션추가2">
	<form name="pkc2">
		<select name="food">
			<option>선택</option>
		</select>
	</form>
</body>
</html>