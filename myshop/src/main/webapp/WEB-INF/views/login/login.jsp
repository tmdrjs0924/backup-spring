<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <style>
   section {
      width:1000px;
      height:600px;
      margin:auto;
      text-align:center;
   }
   section div {
     margin-top:12px;
   }
   section input[type=text] {
      width:330px;
      height:35px;
      border:1px solid purple; 
   }
   section input[type=password] {
      width:330px;
      height:35px;
      border:1px solid purple; 
   }
   section input[type=submit] {
      width:336px;
      height:39px;
      border:1px solid purple; 
      background:purple;
      border:1px solid purple; 
      color:white;
   }
   section input[type=button] {
      width:336px;
      height:39px;
      border:1px solid purple; 
      background:purple;
      border:1px solid purple; 
      color:white;
   }
   section #ss {
      display:inline-block;
      width:90px;
      height:20px;
      border:1px solid purple;
      font-size:13px;
      padding:5px;
      color:purple;
   }
   #uform ,#pform {
      display:none;
   }
  </style>
  <script>
    <c:if test="${chk == 2}">
      // alert("회원가입을 감사드립니다");
    </c:if>
    
    function view_uform() // 아이디 조회폼
    {
       document.getElementById("sview").innerText="";	
 	   document.getElementById("uform").style.display="block";
 	   document.getElementById("pform").style.display="none";
    }
    function view_pform() // 비밀번호 조회폼
    {
       document.getElementById("sview").innerText="";	
 	   document.getElementById("pform").style.display="block";
 	   document.getElementById("uform").style.display="none";
    }
    
    function userid_search()
    {
 	   
       var chk=new XMLHttpRequest();
 	   var name=document.uform.name.value;
 	   var email=document.uform.email.value;
 	   
 	   chk.onload=function()
 	   {
 		   //alert(chk.responseText.trim());
 		   
 		   var userid=chk.responseText.trim();
 		   if(userid=="1") // 이름, 이메일이 잘못 되었다..
 			 document.getElementById("sview").innerText="이름 혹은 이메일이 잘못 되었습니다";
 		   else
 	       {		   
 			 document.getElementById("sview").innerText="당신의 아이디 : "+userid;
 			 document.getElementById("uform").style.display="none"; 
 	       }
 	   }
 	   
 	   chk.open("get","userid_search?name="+name+"&email="+email);
 	   chk.send();
    }
    
    function pwd_search()
    {
           	
       var chk=new XMLHttpRequest();
       var userid=document.pform.userid.value;
       var name=document.pform.name.value;
 	   var email=document.pform.email.value;
 	   
 	   chk.onload=function()
 	   {
 		   //alert(chk.responseText.trim());
 		   var pwd=chk.responseText.trim();
 		   if(pwd=="1")
 		   {
 			  document.getElementById("sview").innerText="입력 정보가 불일치 합니다";
 		   }	
 		   else
 		   {
 			  document.getElementById("sview").innerText="당신의 비밀번호 : "+pwd;
 			  document.getElementById("pform").style.display="none";
 		   }	   
 	   }
 	   
 	   chk.open("get","pwd_search?userid="+userid+"&name="+name+"&email="+email);
 	   chk.send();
    }
  </script>
</head>
<body> <!-- login.jsp -->
   <section>
      <form method="post" action="login_ok">
       
        <h2> 로그인 </h2>
        <div> <input type="text" name="userid" placeholder="아이디" value="ksg123"> </div>
        <div> <input type="password" name="pwd" placeholder="비밀번호" value="123"> </div>
        <div> <input type="submit" value="로그인"> </div>
       <c:if test="${chk == 1}">
        <div id="msg" style="font-size:12px;color:red;">아이디 혹은 비밀번호가 틀립니다</div>
       </c:if>
      </form>
      <!-- 아이디,비밀번호 찾기 링크 -->
      <div align="center">
        <span id="ss" onclick="view_uform()"> 아이디 찾기 </span> 
        <span id="ss" onclick="view_pform()"> 비밀번호 찾기 </span>
      </div>
      <!-- 아이디 , 비밀번호 출력 -->
      <div id="sview" align="center"></div>
      
     <!-- 아이디 조회폼 -->
     <form name="uform" id="uform">
      <input type="text" name="name" placeholder="이 름"> <p>
      <input type="text" name="email" placeholder="이메일"> <p>
      <input type="button" onclick="userid_search()" value="아이디찾기">
     </form>
     <!-- 비밀번호 조회폼 -->
     <form name="pform" id="pform">
      <input type="text" name="userid" placeholder="아이디"> <p>
      <input type="text" name="name" placeholder="이 름"> <p>
      <input type="text" name="email" placeholder="이메일"> <p>
      <input type="button" onclick="pwd_search()" value="비밀번호찾기">
     </form>
   </section>
</body>
</html>