<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html lang="en">
<head>
    <title>StudyLab - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="${contextPath}/resources/css/animate.css">
    
    <link rel="stylesheet" href="${contextPath}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/magnific-popup.css">

    <link rel="stylesheet" href="${contextPath}/resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/jquery.timepicker.css">


    <link rel="stylesheet" href="${contextPath}/resources/css/flaticon.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/style.css">
</head>
<body>
 <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
   <div class="container">
     <a class="navbar-brand" href="index.do"><span>TRAVEL </span>MAKER</a>
     <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
     <span class="oi oi-menu"></span> Menu
   </button>

   <div class="collapse navbar-collapse" id="ftco-nav">
      <ul class="navbar-nav ml-auto">
         <li class="nav-item active"><a href="index.do" class="nav-link">Home</a></li>
         <li class="nav-item"><a href="plan.do" class="nav-link">일정짜기</a></li>
         <li class="nav-item"><a href="with.do" class="nav-link">동행찾기</a></li>
         <li class="nav-item"><a href="themaTour.do" class="nav-link">맞춤테마</a></li>
           <li class="nav-item"><a href="myPage.do" class="nav-link">마이페이지</a></li>
     </ul>
   </div>
</div>
</nav>
<!-- END nav -->


<div class="hero-wrap js-fullheight" style="background-image: url('${contextPath}/resources/images/bg_1.jpg');">
  <div class="overlay"></div>
  <div class="container">
    <div class="row no-gutters slider-text js-fullheight align-items-center" data-scrollax-parent="true">
      <div class="col-md-7 ftco-animate">
        <span class="subheading">which do you prefer?</span>
        <h1 class="mb-4">Travel alone <br>or With others?</h1>
        <p class="caps">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
        <p class="mb-0"><a href="plan.do" class="btn btn-primary">일정짜기</a> <a href="with.do" class="btn btn-white">동행찾기</a></p>
    </div>
</div>
</div>
</div>

<section class="ftco-section ftco-no-pb ftco-no-pt">
   <div class="container">
      <div class="row">
         <div class="col-md-7"></div>
         <div class="col-md-5 order-md-last">
          <div class="login-wrap p-4 p-md-5">
              <h3 class="mb-4">Sign in to Travel Maker</h3>
          <form action="${contextPath}/member/login.do"
							class="signup-form" method="post">
               				<div class="form-group">
								<label class="label" for="id">ID</label> <input
									type="text" class="form-control" name="id">
							</div>
							<div class="form-group">
								<label class="label" for="pwd">Password</label> <input
									id="password-field" type="password" class="form-control"
									name="pwd" >
							</div>
			 <c:if test="${result == 'loginFailed' }">
			 		<div class="alert alert-danger" id="alert-danger"> 아이디 또는 비밀번호를 확인해주세요</div> 		
             </c:if>
							
             <div class="form-group d-flex justify-content-end mt-4">
                 <button type="submit" class="btn btn-primary submit btn-primary_submit">로그인<span class="fa fa-paper-plane"></span></button>
             </div>
         </form>

 
    <c:if test="${userId eq null}">
         <a href="https://kauth.kakao.com/oauth/authorize?client_id=4d6c516eb262829dabdcac45cae9703c&redirect_uri=http://localhost:8090/trip/login&response_type=code">
         <img src="resources/images/loc.png">
        </a>
    </c:if>
    <c:if test="${userId ne null}">
        <h1>로그인 성공입니다</h1>
        <input type="button" value="로그아웃" onclick="location.href='/logout'">
    </c:if>
    

         <p class="text-center">아직 회원이 아니신가요? <a href="signup.do">회원가입</a></p>

     </div>
 </div>
</div>
</div>
</section>
<!---->

<footer class="ftco-footer ftco-no-pt">
  <div class="container">
 
<div class="row">
  <div class="col-md-12 text-center">

    <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
      Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
      <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
  </div>
</div>
</div>
</footer>
		<!-- loader -->
		<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


		<script src="resources/js/jquery.min.js"></script>
		<script src="resources/js/jquery-migrate-3.0.1.min.js"></script>
		<script src="resources/js/popper.min.js"></script>
		<script src="resources/js/bootstrap.min.js"></script>
		<script src="resources/js/jquery.easing.1.3.js"></script>
		<script src="resources/js/jquery.waypoints.min.js"></script>
		<script src="resources/js/jquery.stellar.min.js"></script>
		<script src="resources/js/owl.carousel.min.js"></script>
		<script src="resources/js/jquery.magnific-popup.min.js"></script>
		<script src="resources/js/jquery.animateNumber.min.js"></script>
		<script src="resources/js/bootstrap-datepicker.js"></script>
		<script src="resources/js/scrollax.min.js"></script>
		<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=c8f1e98d3b42f208e812d6c641c3952e"></script>
		<script src="resources/js/kakao-map.js"></script>
		<script src="resources/js/main.js"></script>
</body>
</html>