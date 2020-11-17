<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"

    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>

<html lang="en">

<head>

   <title>Travel Maker - 개인 맞춤형 여행 사이트</title>

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

  

  <!-- 지도 api 연동 -->

  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=870d088a84055f60760b51a6835c248c&libraries=services"></script>

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

 

 <section class="hero-wrap hero-wrap-2" style="background-image: url('${contextPath}/resources/images/bg_2.jpg');">

  <div class="overlay"></div>

  <div class="container">

    <div class="row no-gutters slider-text align-items-end justify-content-center">

      <div class="col-md-9 ftco-animate pb-5 text-center">

       <p class="breadcrumbs"><span class="mr-2"><a href="index.do">Home <i class="fa fa-chevron-right"></i></a></span> <span>일정짜기 <i class="fa fa-chevron-right"></i></span></p>

       <h1 class="mb-0 bread">일정짜기</h1>

     </div>

   </div>

 </div>

</section>

 

<!-- 지도 -->

    <div id="search">

      <input id="search_input" placeholder="목적지를 입력해주세요" />

      <button id="search_button">검색</button>

    </div>

    <div id="map" style="width:100%; height:100vh;"></div>

	<script>

		var container = document.getElementById('map');

		var options = {

			center: new kakao.maps.LatLng(33.450701, 126.570667),

			level: 3

		};

 

		var map = new kakao.maps.Map(container, options);

	</script>

	

	

 

<footer class="ftco-footer ftco-no-pt">

  <div class="container">

 

<div class="row">

  <div class="col-md-12 text-center">

 

    <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

      Copyright ©<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>

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

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>

<script src="resources/js/google-map.js"></script>

<script src="resources/js/main.js"></script>

 

</body>

</html>