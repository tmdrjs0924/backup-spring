<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		table {
			border-collapse:collapse;
		}
		table td {
			padding-left:10px;
			height:28px;
			background:#f6f6f6;
		}
		table tr:first-child {
			border-bottom:2px solid black;
		}
		table tr:last-child {
			border-bottom:2px solid black;
		}
		#left {
			font-size:25px;
			font-weight:bold;
			padding-bottom:10px;
		}
	</style>
	<script>
		window.onload=function(){
			document.cla.cla[${cla}].checked=true;
		}
		function chg_ok(){
			var chk=new XMLHttpRequest();
			var cla=document.cla.cla.value;
			var id=document.cla.id.value;
			chk.onload=function(){
				//opener.location.reload();
				if(chk.responseText=="0"){
					var my2=opener.document.getElementById("my2");
					var div=document.getElementsByClassName("div");
					my2.innerText=div[cla].innerText;
					opener.document.gform.cla.value=cla;
					opener.document.gform.id.value=id;
					close();
				}
				else{
					alert("오류");
				}
			}
			chk.open("get", "chg_ok?cla="+cla+"&id="+id);
			chk.send();
		}
	</script>
</head>
<body>
	<form name="cla">
		<table width="380" align="center">
			<input type="hidden" name="id" value="${id}">
			<tr>
				<td style="background:none" id="left">
					배송 시 요청사항 변경
				</td>
			</tr>
			<tr>
				<td>
					<p>
					<div class="div"><input type="radio" name="cla" value="0">문 앞</div><p>
					<div class="div"><input type="radio" name="cla" value="1">경비실</div><p>
					<div class="div"><input type="radio" name="cla" value="2">택배함</div><p>
					<div class="div"><input type="radio" name="cla" value="3">편의점택배</div><p>
					<input type="button" value="변경" onclick="chg_ok()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>