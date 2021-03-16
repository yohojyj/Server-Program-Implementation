<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="../css/login.css?after"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>

<body>
  <section>
    <div class="content">
      <div class="mockup">
        <img src="../img/phone2.png" width="auto" height="845px">
      </div>
      <div class="loginContainer">
        <div class="loginBox">
          <div id="logoPic">
            <!--   <img src="../img/Asset 4.png">-->
          </div>
          <form action="login.do" method="post" id="loginForm">
              <input class="inputData" type="text" name="uId" placeholder=" ID를 입력하세요" >
              <input class="inputData" type="password" name="uPwd" placeholder=" password를 입력하세요">
              <input id="login_btn" type="submit" value="로그인">
          </form>
        </div>
        <div id="signupBox">
          <p>계정이 없으신가요?&nbsp;<a href="../user/signup.do">가입하기</a></p>
        </div>
      </div>
    </div>
  </section>
  <footer>
     <p>COPYRIGHT © 2021 NADO.<br/> ALL RIGHTS RESERVED.</p>
  </footer>
</body>
</html>








