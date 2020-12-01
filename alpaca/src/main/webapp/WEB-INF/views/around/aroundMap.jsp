<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>알파카 - 헌 책 알고 팔자! 중고책거래 사이트</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="shortcut icon" href="${contextPath}/resources/images/favicon.ico"/>
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

	<style>	
		#aroundMap .ftco-navbar-light {background:#007bff!important;opacity:.8}
		#map {width: 100vw; height: 100vh;}
		.wrap {width: 200px;}
		.text-box {text-align: center;}	
		h3 {margin: 10px auto 0;}
		.img-box {max-height: 80px;overflow: hidden;float: left;}	
		img {width: 70px;height: 70px;margin: -20px auto 0;}	
		a {color: #fff;}
		.gmnoprint, .gm-control-active.gm-fullscreen-control {display: none;}
	</style>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDPkXtedSjcR4hmYgEAvIjgOb_aTuiGKQk&callback=initMap&region=kr"></script>

	<script>
		function initMap() {
			var map = new google.maps.Map(document.getElementById('map'), { // 지도 생성
				center : { // 처음 중심 좌표
					lat : 37.56651203645214,
					lng : 126.97785926709967
				},
				zoom : 16
			});

			var locX = [];
			<c:forEach var = "loc" items="${locX}" varStatus="status">
			locX[<c:out value='${status.index}'/>] = "<c:out value='${loc}'/>";
			</c:forEach>

			var locY = [];
			<c:forEach var = "loc" items="${locY}" varStatus="status">
			locY[<c:out value='${status.index}'/>] = "<c:out value='${loc}'/>";
			</c:forEach>

			var price = [];
			<c:forEach var = "loc" items="${price}" varStatus="status">
			price[<c:out value='${status.index}'/>] = "<c:out value='${loc}'/>";
			</c:forEach>

			var title = [];
			<c:forEach var = "loc" items="${title}" varStatus="status">
			title[<c:out value='${status.index}'/>] = "<c:out value='${loc}'/>";
			</c:forEach>

			var imageFileName = [];
			<c:forEach var = "loc" items="${imageFile1}" varStatus="status">
			imageFileName[<c:out value='${status.index}'/>] = "<c:out value='${loc}'/>";
			</c:forEach>

			var articleNO = [];
			<c:forEach var = "loc" items="${articleNO}" varStatus="status">
			articleNO[<c:out value='${status.index}'/>] = "<c:out value='${loc}'/>";
			</c:forEach>

			var customicon = "${contextPath}/resources/images/around/icon.png";  // 알파카 이미지 마커
			var infowindow = new google.maps.InfoWindow(); // 인포윈도우

			var marker, i; //마커 생성
			for (i = 0; i < locX.length; i++) {
				marker = new google.maps.Marker({
					position : new google.maps.LatLng(locX[i], locY[i]),
					icon : customicon,
					map : map
				});

				google.maps.event.addListener(marker, 'click', (function(marker, i) {
					return function() {
						infowindow.setContent('<div class="wrap"><div class="text-box"><h3>'+title[i]+'</h3>'
							+ '<div class="img-box"><img src="${contextPath}/board/download.do?articleNO='+articleNO[i]+'&imageFileName='+imageFileName[i]+'"></div>'
							+ '<div class="price">가격: '+price[i]+'원</div>'
							+ '<a href="${contextPath}/board/viewArticle.do?articleNO='+articleNO[i]+'" class="link">상세보기</a></div>'); // html로 표시될 인포윈도우의 내용
						infowindow.open(map, marker); // 인포윈도우가 표시될 위치
					}
				})(marker, i));

				if (marker) {
					marker.addListener('click', function() {
						map.setCenter(this.getPosition()); // 중심 위치를 클릭된 마커의 위치로 변경
						map.setZoom(17);
					});
				}
			}
		}
	</script>
</head>
<body>
	<section id="aroundMap">
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"id="ftco-navbar map-navbar">
		<div class="container">
			<a class="navbar-brand" href="${contextPath}/index.do" style="background-image: url('${contextPath}/resources/images/logo.png');"><span class="navbar-brandsp"></span></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item "><a href="${contextPath}/index.do" class="nav-link">Home</a></li>
					<li class="nav-item "><a href="${contextPath}/board/listArticles.do" class="nav-link">책거래</a></li>
					<li class="nav-item active"><a href="${contextPath}/around/aroundMap.do" class="nav-link">주변거래</a></li>
					<li class="nav-item "><a href="${contextPath}/chat/login.do"class="nav-link">채팅하기</a></li>
					<li class="nav-item "><a href="${contextPath}/community/listCommunity.do" class="nav-link">커뮤니티</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div id="map" style="width: 100%; height: 100vh;"></div>
	</section>
	<footer class="ftco-footer ftco-no-pt">
		<div class="container">

			<div class="row">
				<div class="col-md-12 text-center">
					<p>
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved by Alpaca
					</p>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>