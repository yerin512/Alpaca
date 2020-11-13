<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html lang="en">
<head>
        <meta charset="utf-8"/>
        <title>Travel Maker - 개인 맞춤형 여행 사이트</title>
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
	    
	    <!-- 지도 api 적용(네이버/카카오) -->
	    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c8f1e98d3b42f208e812d6c641c3952e"></script>
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
		        center: new kakao.maps.LatLng(37.5662952, 126.9757564),
		        level: 4
		};
		
		var map = new kakao.maps.Map(container, options);
      </script>

</body>
</html>