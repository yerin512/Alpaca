<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<title>알파카 - 헌 책 알고 팔자! 중고책거래 사이트</title>
	<meta charset="utf-8">
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
	
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c8f1e98d3b42f208e812d6c641c3952e"></script>
    <style>
	           
    </style>
</head>
<body>
 <nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="${contextPath}/index.do" style="background-image: url('${contextPath}/resources/images/logo.png');"><span class="navbar-brandsp"></span></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="${contextPath}/index.do"
						class="nav-link">Home</a></li>
					<li class="nav-item active"><a
						href="${contextPath}/board/listArticles.do" class="nav-link">책거래</a></li>
					<li class="nav-item"><a
						href="${contextPath}/around/aroundMap.do" class="nav-link">주변거래</a></li>
					<li class="nav-item"><a href="${contextPath}/chat/login.do"
						class="nav-link">채팅하기</a></li>
					<li class="nav-item "><a
						href="${contextPath}/community/listCommunity.do" class="nav-link">커뮤니티</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('${contextPath}/resources/images/bg_2.png');">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate pb-5 text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home <i
								class="fa fa-chevron-right"></i></a></span> <span>책거래 <i
							class="fa fa-chevron-right"></i></span>
					</p>
					<h1 class="mb-0 bread">책 판매 작성</h1>
				</div>
			</div>
		</div>
	</section>
	<form name="articleForm" method="post"
				action="${contextPath}/board/addNewArticle.do"
				enctype="multipart/form-data">
	<section id="articleForm">
		<div class="articleFrom_table">
			<!-- 게시물 작성 폼 -->
			
				<!-- 이미지 파일 올리는 섹션 -->

				<table border="0" align="center">
					<tr>
						<td class="td_title">이미지</td>
						<td><section class="ftco-section-kis">
								<div class="container">
									<div class="row">
										<div
											class="col-md-4 ftco-animate d-flex align-items-center align-items-stretch">
											<div class="staff-2 w-100">
												<input type="file" name="file1" onchange="readURL1(this);" />
												<div class="img-wrap d-flex align-items-stretch">
													<img id="preview1"
														src="${contextPath}/resources/images/board/pr01.jpg"
														width="100%" />
												</div>
											</div>
										</div>

										<div
											class="col-md-4 ftco-animate d-flex align-items-center align-items-stretch">
											<div class="staff-2 w-100">
												<input type="file" name="file2" onchange="readURL2(this);" />
												<div class="img-wrap d-flex align-items-stretch">
													<img id="preview2"
														src="${contextPath}/resources/images/board/pr02.jpg"
														width="100%" />
												</div>
											</div>
										</div>
										<div
											class="col-md-4 ftco-animate d-flex align-items-center align-items-stretch">
											<div class="staff-2 w-100">
												<input type="file" name="file3" onchange="readURL3(this);" />
												<div class="img-wrap d-flex align-items-stretch">
													<img id="preview3"
														src="${contextPath}/resources/images/board/pr03.jpg"
														width="100%" />
												</div>
											</div>
										</div>
									</div>
								</div>
							</section></td>
					</tr>
					<tr>
						<td class="td_title" align="left" width="10%">책 제목</td>
						<td colspan="2"><input type="text" size="67" maxlength="500"
							name="title" placeholder="제목을 입력해주세요" class="title_input" /></td>
					</tr>
					<tr>
						<td class="td_title" align="left">책 가격</td>
						<td colspan=2><input type="text" size="20" name="price"
							maxlength="100" placeholder="가격을 입력해주세요" class="title_input" />원</td>
					</tr>
					<tr>

						<td class="td_title" colspan=2 align="left">
							<div id="loc_x"></div>
							<div id="loc_y"></div>
						</td>
						<td colspan=6></td>
					</tr>
					<tr>
						<td class="td_title" align="left">책 설명</td>
						<td colspan=2><textarea id="i_content" name="content"
								rows="10" cols="65" maxlength="4000"></textarea> <script
								src="${contextPath}/resources/ckeditor/ckeditor.js"></script> <script
								type="text/javascript">
									CKEDITOR
											.replace(
													'i_content',
													{
														filebrowserUploadUrl : '${pageContext.request.contextPath }/community/fileupload.do'
													});
									window.parent.CKEDITOR.tools.callFunction(
											1, "${url}", "전송완료");
								</script></td>
					</tr>
					<tr>
						<td align="left" class="td_title">판매 위치</td>
						<td><div id="map"></div>
							<div id="clickLatlng"></div></td>
					</tr>

				</table>


				<div class="div_input">
					<input type="submit" value="작성"
						class="write_btn btn btn-outline btn-primary" /> <input
						type=button value="목록" onClick="backToList(this.form)"
						class="write_btn btn btn-outline btn-primary" />
				</div>
		</div>
	</section>
</form>
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

		var mapContainer = document.getElementById('map');
		var mapOption = {
			center : new kakao.maps.LatLng(37.56651203645214,
					126.97785926709967),
			level : 4
		};

		var map = new kakao.maps.Map(mapContainer, mapOption);

		var marker = new kakao.maps.Marker({
			position : map.getCenter()
		});
		marker.setMap(map);

		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
			var latlng = mouseEvent.latLng;
			marker.setPosition(latlng);

			var locx = '<input type="hidden" name="loc_x" value="'
					+ latlng.getLat() + '">';
			var locy = '<input type="hidden" name="loc_y" value="'
					+ latlng.getLng() + '">';
			var resultx = document.getElementById('loc_x');
			resultx.innerHTML = locx;
			var resulty = document.getElementById('loc_y');
			resulty.innerHTML = locy;
		});
	</script>
</body>
</html> 