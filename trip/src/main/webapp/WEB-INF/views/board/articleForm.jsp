<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<title>알파카 - 믿을 수 있는 중고 책 거래사이트</title>
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
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDPkXtedSjcR4hmYgEAvIjgOb_aTuiGKQk&callback=initMap&region=kr"></script>
	 <style>
	     .gmnoprint, .gm-control-active.gm-fullscreen-control {display: none;}       
	  </style>
</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="${contextPath}/index.do"><span>TRAVEL
			</span>MAKER</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="${contextPath}/index.do"
						class="nav-link">Home</a></li>
					<li class="nav-item"><a
						href="${contextPath}/board/listArticles.do" class="nav-link">책거래</a></li>
					<li class="nav-item"><a
						href="${contextPath}/around/aroundMap.do" class="nav-link">주변거래</a></li>
					<li class="nav-item"><a href="${contextPath}/chat/login.do"
						class="nav-link">채팅하기</a></li>
					<li class="nav-item"><a
						href="${contextPath}/community/listCommunity.do" class="nav-link">커뮤니티</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('${contextPath}/resources/images/bg_2.jpg');">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate pb-5 text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="${contextPath}/index.do">Home
								<i class="fa fa-chevron-right"></i>
						</a></span> <span class="mr-2"><a
							href="${contextPath}/board/listArticles.do">게시글 목록 <i
								class="fa fa-chevron-right"></i></a></span> <span>게시글 작성 <i
							class="fa fa-chevron-right"></i>
						</span>
					</p>
					<h1 class="mb-0 bread">거래 게시물 작성</h1>
				</div>
			</div>
		</div>
	</section>

	<!-- 게시물 작성 폼 -->
	<form name="articleForm" method="post"
		action="${contextPath}/board/addNewArticle.do"
		enctype="multipart/form-data">

		<!-- 이미지 파일 올리는 섹션 -->
		<section class="ftco-section-kis bg-light">
			<div class="container">
				<div class="row">
					<div
						class="col-md-4 ftco-animate d-flex align-items-center align-items-stretch">
						<div class="staff-2 w-100">
							앞면 <input type="file" name="file1" onchange="readURL1(this);" />
							<div class="img-wrap d-flex align-items-stretch">
								<img id="preview1" src="#" width="100%" />
							</div>
						</div>
					</div>

					<div
						class="col-md-4 ftco-animate d-flex align-items-center align-items-stretch">
						<div class="staff-2 w-100">
							뒷면 <input type="file" name="file2" onchange="readURL2(this);" />
							<div class="img-wrap d-flex align-items-stretch">
								<img id="preview2" src="#" width="100%" />
							</div>
						</div>
					</div>

					<div
						class="col-md-4 ftco-animate d-flex align-items-center align-items-stretch">
						<div class="staff-2 w-100">
							옆면 <input type="file" name="file3" onchange="readURL3(this);" />
							<div class="img-wrap d-flex align-items-stretch">
								<img id="preview3" src="#" width="100%" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>


		<div class="col-md-8 d-flex align-items-center">
			<div class="staff-detail w-100 pl-md-5">
				<table border="0" align="center">
					<tr>
						<td align="right"><h3>글제목</h3></td>
						<td colspan="2"><input type="text" size="67" maxlength="500"
							name="title" /></td>
						<td colspan=6></td>
					</tr>
					<td align="right">
						<h3>가 &nbsp;&nbsp;&nbsp;&nbsp;격</h3>
					</td>
					<td colspan=2 align="left"><input type="text" size="20"
						maxlength="100" /></td>
					<td colspan=6></td>
					<tr>
						<td align="right">
							<h3>작성자</h3>
						</td>
						<td colspan=2 align="left"><input type="text" size="20"
							maxlength="100" value="${member.name }" readonly /></td>
						<td colspan=6></td>
					</tr>

					<tr>
						<td align="right" valign="top"><br>
						<h3>글내용</h3></td>
						<td colspan=2><textarea name="content" rows="10" cols="65"
								maxlength="4000"></textarea></td>
						<td colspan=6></td>
					</tr>
					<tr>

					</tr>
					<tr>
						<td align="right">
							<h3>거래장소</h3>
						</td>
						<td colspan=2 align="left"><input type="text" size="20"
							maxlength="100" /></td>						
						<td colspan=6></td>
					</tr>
					<tbody id="map" style="width:600px; height: 300px;"></tbody>
					<tr>
						<td align="right"></td>
						<td colspan="2"><input type="submit" value="글쓰기" /> <input
							type=button value="목록보기" onClick="backToList(this.form)" /></td>
					</tr>
				</table>
			</div>
		</div>
	</form>

	<footer class="ftco-footer ftco-no-pt">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md pt-5">
					<div class="ftco-footer-widget pt-md-5 mb-4">
						<h2 class="ftco-heading-2">About</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia, there live the blind texts.</p>
						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft">
							<li class="ftco-animate"><a href="#"><span
									class="fa fa-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="fa fa-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="fa fa-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md pt-5">
					<div class="ftco-footer-widget pt-md-5 mb-4 ml-md-5">
						<h2 class="ftco-heading-2">Help Desk</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">Customer Care</a></li>
							<li><a href="#" class="py-2 d-block">Legal Help</a></li>
							<li><a href="#" class="py-2 d-block">Services</a></li>
							<li><a href="#" class="py-2 d-block">Privacy and Policy</a></li>
							<li><a href="#" class="py-2 d-block">Refund Policy</a></li>
							<li><a href="#" class="py-2 d-block">Call Us</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md pt-5">
					<div class="ftco-footer-widget pt-md-5 mb-4">
						<h2 class="ftco-heading-2">Recent Courses</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">Computer
									Engineering</a></li>
							<li><a href="#" class="py-2 d-block">Web Design</a></li>
							<li><a href="#" class="py-2 d-block">Business Studies</a></li>
							<li><a href="#" class="py-2 d-block">Civil Engineering</a></li>
							<li><a href="#" class="py-2 d-block">Computer Technician</a></li>
							<li><a href="#" class="py-2 d-block">Web Developer</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md pt-5">
					<div class="ftco-footer-widget pt-md-5 mb-4">
						<h2 class="ftco-heading-2">Have a Questions?</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon fa fa-map-marker"></span><span
									class="text">203 Fake St. Mountain View, San Francisco,
										California, USA</span></li>
								<li><a href="#"><span class="icon fa fa-phone"></span><span
										class="text">+2 392 3929 210</span></a></li>
								<li><a href="#"><span class="icon fa fa-paper-plane"></span><span
										class="text">info@yourdomain.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="fa fa-heart" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>


	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script src="${contextPath}/resources/js/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="${contextPath}/resources/js/popper.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${contextPath}/resources/js/jquery.easing.1.3.js"></script>
	<script src="${contextPath}/resources/js/jquery.waypoints.min.js"></script>
	<script src="${contextPath}/resources/js/jquery.stellar.min.js"></script>
	<script src="${contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="${contextPath}/resources/js/jquery.animateNumber.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap-datepicker.js"></script>
	<script src="${contextPath}/resources/js/scrollax.min.js"></script>
	<script src="${contextPath}/resources/js/main.js"></script>

	<script type="text/javascript">
		function readURL1(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#preview1').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}

		function readURL2(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#preview2').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}

		function readURL3(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#preview3').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		function backToList(obj) {
			obj.action = "${contextPath}/board/listArticles.do";
			obj.submit();
		}
		
		function initMap() {
	      var map = new google.maps.Map(document.getElementById('map'), {  // 지도 생성
	          center: {  // 처음 중심 좌표
	              lat: 37.56651203645214,
	              lng: 126.97785926709967
	          },
	          zoom: 16
	      });
		}
	</script>
</body>
</html>