<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>알파카 - 헌 책 알고 팔자! 중고책거래 사이트</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css" rel="stylesheet">
	
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
			<a class="navbar-brand" href="${contextPath}/index.do" style="background-image: url('${contextPath}/resources/images/logo.png');"><span class="navbar-brandsp"></span></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="${contextPath}/index.do" class="nav-link">Home</a></li>
					<li class="nav-item active"><a href="${contextPath}/board/listArticles.do" class="nav-link">책거래</a></li>
					<li class="nav-item"><a href="${contextPath}/around/aroundMap.do" class="nav-link">주변거래</a></li>
					<li class="nav-item"><a href="${contextPath}/chat/login.do" class="nav-link">채팅하기</a></li>
					<li class="nav-item"><a href="${contextPath}/community/listCommunity.do" class="nav-link">커뮤니티</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<section class="hero-wrap hero-wrap-2"style="background-image: url('${contextPath}/resources/images/bg_2.png');">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate pb-5 text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="${contextPath}/index.do">Home <i class="fa fa-chevron-right"></i></a></span> 
						<span>책 거래<i class="fa fa-chevron-right"></i></span>
					</p>
					<h1 class="mb-0 bread">책 거래</h1>
				</div>
			</div>
		</div>
	</section>
	<!-- END nav -->



	<!-- 게시물 부분은 여기서부터 -->
	<c:choose>
		<c:when test="${articlesList ==null }">
			<tr height="10">
				<td colspan="4">
					<p align="center">
						<b><span style="font-size: 9pt;">등록된 글이 없습니다.</span></b>
					</p>
				</td>
			</tr>
		</c:when>
		<c:when test="${articlesList !=null }">
			<section class="ftco-section bg-light">
				<div class="container">
					<div class="row">
						<c:forEach var="item" items="${articlesList}"
							varStatus="articleNum">
							<div
								class="col-md-6 col-lg-3 ftco-animate d-flex align-items-stretch">
								<div class="staff">
									<div class="img-wrap d-flex align-items-stretch">
										<div class="img align-self-stretch">
											<!-- 여기가 사진 -->
											<a class='cls1'
												href="${contextPath}/board/viewArticle.do?articleNO=${item.articleNO}">
												<input type="hidden" name="originalFileName"
												value="${item.imageFile1}" /> <img
												src="${contextPath}/board/download.do?articleNO=${item.articleNO}&imageFileName=${item.imageFile1}"
												id="preview" height="100%" width="100%" /><br>
											</a>
										</div>
									</div>
									<div class="text pt-3">
										<h3>
											<a href="${contextPath}/board/viewArticle.do">${item.title}</a>
										</h3>
										<span class="position mb-2">${item.writeDate }</span>
										<div class="faded">
											<p>${item.price}원</p>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="col text-center"> <button type="button" id="listArticle_btn" class="btn btn-outline btn-primary pull-right">
		                      <a href="javascript:fn_articleForm('${isLogOn}','${contextPath}/board/articleForm.do', 
		                                                    '${contextPath}/index.do')" class="btn"><i class="fa fa-edit fa-fw"></i>글  작성</a>
		                      </button></div>
					
		</c:when>
	</c:choose>








		<!-- 	여기가 페이징 -->
		<div class="row mt-5" id="listA_paging">
			<div class="col text-center">
				
				<div class="block-27">
					<ul>
						<li><a href="#">&lt;</a></li>
						<li class="active"><span>1</span></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">&gt;</a></li>
					</ul>
				</div>
			</div>
		</div>
		</div>
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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="${contextPath}/resources/js/google-map.js"></script>
	<script src="${contextPath}/resources/js/main.js"></script>
	<script>
		function fn_articleForm(isLogOn, articleForm, loginForm) {
			if (isLogOn != '' && isLogOn != 'false') {
				location.href = articleForm;
			} else {
				alert("로그인 후 글쓰기가 가능합니다.")
				location.href = loginForm + '?action=/board/articleForm.do';
			}
		}

		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#preview').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>
</body>
</html>