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
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=e6h3qbzmz4"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c8f1e98d3b42f208e812d6c641c3952e&libraries=LIBRARY"></script>

	<style>
	#legend {
		font-family: Arial, sans-serif;
		background: #fff;
		padding: 10px;
		margin: 10px;
		border: 3px solid #000;
	}
	#legend h3 {
		margin-top: 0;
	}
	#legend img {
		vertical-align: middle;
	}
	div.row div {
	padding-left: 0px  !important;
	padding-right: 0px !important;
	}
	#map {
	padding-right: 0px !important;
	}
	</style>
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
	
	<!-- 좌측 메뉴 -->
	<div id="cityCategory" class="cityblock" style="position: relative; top: 0px; left: 0px; float: left">
		<div class="item" data-no="0" data-ci_name="서울" data-lat="37.56653500" data-lng="126.97796920" data-is_state="0">
			<div class="info_box fl" style="width: 140px;">
				<div class="info_title">서울</div>
				<div class="info_sub_title">Seoul</div>
			</div><hr>
		</div>
		<div class="item" data-no="1" data-ci_name="부산" data-lat="35.1795552" data-lng="129.0741443" data-is_state="0">
			<div class="info_box fl" style="width: 140px;">
				<div class="info_title">부산</div>
				<div class="info_sub_title">Busan</div>
			</div><hr>
		</div>
		<div class="item" data-no="2" data-ci_name="대전" data-lat="36.3504567" data-lng="127.38263" data-is_state="0">
			<div class="info_box fl" style="width: 140px;">
				<div class="info_title">대전</div>
				<div class="info_sub_title">Daejeon</div>
			</div><hr>
		</div>
		<div class="item" data-no="3" data-ci_name="제주" data-lat="33.4827062" data-lng="126.3906632" data-is_state="0">
			<div class="info_box fl" style="width: 140px;">
				<div class="info_title">제주도</div>
				<div class="info_sub_title">Jeju</div>
			</div><hr>
		</div>
		<div class="item" data-no="4" data-ci_name="여수" data-lat="34.7599627" data-lng="127.6592976" data-is_state="0">
			<div class="info_box fl" style="width: 140px;">
				<div class="info_title">여수</div>
				<div class="info_sub_title">Yeosu</div>
			</div><hr>
		</div>
	</div>
	<!-- 좌측메뉴 end -->

	<!-- 지도 -->
	<div id="map" style="width:80%; height:100vh; float:right"></div>
	<script>
    var mapContainer = document.getElementById('map'),  // 지도 생성
    mapOption = { 
        center: new kakao.maps.LatLng(36.38, 127.51), 
        level: 12,
    };

	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	var mapTypeControl = new kakao.maps.MapTypeControl();  // 지도에 컨트롤 올리기
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	var positions = [{  // 여러개 마크 표시
		content: '<div>서울</div>', 
		latlng: new kakao.maps.LatLng(37.5662952, 126.9757564)
    }, {
    	content: '<div>부산</div>', 
    	latlng: new kakao.maps.LatLng(35.1795552, 129.0741443)
    }, {
    	content: '<div>대전</div>', 
    	latlng: new kakao.maps.LatLng(36.3504567, 127.38263)
    }, {
    	content: '<div>제주</div>', 
    	latlng: new kakao.maps.LatLng(33.4827062, 126.3906632)
    }, {
    	content: '<div>여수</div>',
    	latlng: new kakao.maps.LatLng(34.7599627, 127.6592976)	    
	}];
	
	for (var i = 0; i < positions.length; i ++) {
	    var marker = new kakao.maps.Marker({
	        map: map, 
	        position: positions[i].latlng
	    });
	    
	    var infowindow = new kakao.maps.InfoWindow({
	    	 content: positions[i].content
	    });
	    
	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	}
	
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}

	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}
	</script>
	<!-- 지도 end -->
</body>
</html>