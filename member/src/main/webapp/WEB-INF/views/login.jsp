<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		div {
			text-align:center;
		}
		#lform {
			margin-top:100px;
		}
		#uform {
			display:none;
		}
		#pform {
			display:none;
		}
		#msg {
			color:red;
			font-size:12px;
		}
		input {
			outline:none;
		}
		a {
			text-decoration:none;
			color:black;
		}
		a:hover {
			color:dimgrey;
		}
	</style>
	<script>
		function check() {
			var lf=document.getElementById("lform");
			if(lf.userid.value.trim()=="") {
				alert("아이디를 입력하세요");
				return false;
			}
			if(lf.pwd.value.trim()=="") {
				alert("비밀번호를 입력하세요");
				return false;
			}
			else
				return true;
		}
		function ucheck() {
			var uf=document.getElementById("uform");
			if(uf.name.value.trim()=="") {
				alert("이름을 입력하세요");
				return false;
			}
			if(uf.phone.value.trim()=="") {
				alert("전화번호를 입력하세요");
				return false;
			}
			else
				return true;
		}
		function pcheck() {
			var pf=document.getElementById("pform");
			if(pf.userid.value.trim()=="") {
				alert("아이디를 입력하세요");
				return false;
			}
			else if(pf.name.value.trim()=="") {
				alert("이름을 입력하세요");
				return false;
			}
			else if(pf.phone.value.trim()=="") {
				alert("전화번호 입력하세요");
				return false;
			}
			else
				return true;
		}
		function uview() {
			var uform=document.getElementById("uform");
			var pform=document.getElementById("pform");
			if(uform.style.display=="none") {
				uform.style.display="block";
				pform.style.displayy="none";
			}
			else {
				uform.style.display="none";
				pform.style.display="none";
			}
		}
		function pview() {
			var pform=document.getElementById("pform");
			var uform=document.getElementById("uform");
			if(pform.style.display=="none") {
				pform.style.display="block";
				uform.style.displayy="none";
			}
			else {
				pform.style.display="none";
				uform.style.display="none";
			}
		}
		function psearch() {
			var ps=new XMLHttpRequest();
			var userid=document.pform.userid.value;
			var name=document.pform.name.value;
			var phone=document.pform.phone.value;
			ps.onload=function() {
				alert(ps.responseText);
			}
			ps.open("get", "psearch?userid="+userid+"&name="+name+"&phone="+phone);
			ps.send();
		}
	</script>
</head>
<body>
	<div>
		<form id="lform" method="post" action="login_ok" onsubmit="return check()">
			<input type="text" name="userid" placeholder="아이디 또는 이메일" value="${userid}"> <p>
			<input type="password" name="pwd" placeholder="비밀번호"> <p>
				<c:if test="${!empty chk}">
					<span id="msg"> 아이디 또는 비밀번호가 틀렸습니다 </span> <p>
				</c:if>
			<a href="javascript:uview()"> 아이디 찾기 </a>
			&nbsp;│&nbsp;
			<a href="javascript:pview()"> 비밀번호 찾기 </a> <p>
			<input type="submit" value="로그인">
		</form>
	</div>
	
		<div id="pmsg"></div>
	
	<div>
		<form id="uform" method="post" action="usearch" onsubmit="return ucheck()">
			<input type="text" name="name" placeholder="이름"> <p>
			<input type="text" name="phone" placeholder="전화번호"> <p>
			<input type="submit" value="다음">
		</form>
	</div>
	
	<div>
		<form id="pform" name="pform">
			<input type="text" name="userid" placeholder="아이디"> <p>
			<input type="text" name="name" placeholder="이름"> <p>
			<input type="text" name="phone" placeholder="전화번호"> <p>
			<input type="button" value="다음" onclick="psearch()">
		</form>
	</div>
	
</body>
</html>