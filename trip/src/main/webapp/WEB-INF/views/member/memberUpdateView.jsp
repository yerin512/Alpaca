<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="${contextPath}/resources/css/animate.css">

<link rel="stylesheet"
	href="${contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/magnif.testimony-section .container-2ic-popup.css">

<link rel="stylesheet"
	href="${contextPath}/resources/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/jquery.timepicker.css">


<link rel="stylesheet" href="${contextPath}/resources/css/flaticon.css">
<link rel="stylesheet" href="${contextPath}/resources/css/style.css">


<script src="/resources/js/jquery-3.2.1.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<style type="text/css">
#container {
	position: absolute;
	text-align: center;
	left: 50%;
	top: 50%;
	margin: -120px auto 0 -130px;
	width: 260px;
}
</style>
<!-- width: 100%;
	height: 100vh;
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
	text-align: center; -->
<style type="text/css">
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>회원 정보 수정</title>
</head>


<script type="text/javascript">
	$(document).ready(function() {
		// 취소
		$(".cancle").on("click", function() {

			location.href = "/trip/index.do";

		})

		$("#submit").on("click", function() {
			if ($("#pwd").val() == "") {
				alert("비밀번호 를 입력해주세요.");
				$("#pwd").focus();
				return false;
			}
			if ($("#name").val() == "") {
				alert("이름 을 입력해주세요.");
				$("#name").focus();
				return false;
			}
			if ($("#email").val() == "") {
				alert("Email 을 입력해주세요.");
				$("#email").focus();
				return false;
			}

		});

	})
</script>
<body>

<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.do"><span>TRAVEL </span>MAKER</a>
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
					<li class="nav-item"><a href="${contextPath}/themaTour.do"
						class="nav-link">채팅</a></li>
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
						<span class="mr-2"><a href="index.do">Home <i
								class="fa fa-chevron-right"></i></a></span> <span>일정짜기 <i
							class="fa fa-chevron-right"></i></span>
					</p>
					<h1 class="mb-0 bread">회원가입</h1><br>
            <p class="lead">회원가입하세요. 가입하면 게시판을 열람할 수 있습니다.</p>
				</div>
			</div>
		</div>
	</section>
	
	
	<section id="container">
		<form action="/trip/memberUpdate" method="post">
			<div class="form-group has-feedback">
				<label class="control-label" for="id">아이디</label> <input
					class="form-control" type="text" id="id" name="id"
					value="${member.id}" readonly="readonly" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="pwd">패스워드</label> <input
					class="form-control" type="password" id="pwd" name="pwd" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="name">성명</label> <input
					class="form-control" type="text" id="name" name="name"
					value="${member.name}" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="email">Email</label> <input
					class="form-control" type="text" id="email" name="email"
					value="${member.email}" />
			</div>
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="submit">회원
					정보 수정</button>
				<button class="cancle btn btn-danger" type="button">취소</button>
			</div>
		</form>
	</section>

</body>

</html>