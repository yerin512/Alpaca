<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<head>

<style type="text/css">
.update {
	margin: 30px auto;
	padding: 0;
	width: 500px;
}

#alpaca {
	text-align: center;
	padding-top: 75px;
	//
}

#footer {
	position: absolute;
}

.gmd {
	background: #fff;
	border-radius: 30px;
	display: inline-table;
	float: left;
	left: 85px;
	height: 150px;
	position: relative;
	width: 150px;
	padding: 0 35px 0;
	margin: 40px 0 43px 30%;
	left: 93px;
	color: #444
}

.gmd-2 {
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
}
</style>
<meta charset="UTF-8">
<title>알파카 - 헌 책 알고 팔자! 중고책거래 사이트</title>
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
	href="${contextPath}/resources/css/magnific-popup.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/jquery.timepicker.css">
<link rel="stylesheet" href="${contextPath}/resources/css/flaticon.css">
<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
</head>
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// 취소
		$(".cancle").on("click", function() {

			location.href = "/alpaca/index.do";

		})
		// 필수입력칸 
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
			} else {
				alert("회원정보 수정 완료 !!! 다시 로그인 바랍니다.")
				location.href = "/alpaca/index.do";
			}

		});

	})
</script>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="${contextPath}/index.do"
				style="background-image: url('${contextPath}/resources/images/logo.png');"><span
				class="navbar-brandsp"></span></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>
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
						<span class="mr-2"><a href="index.do">Home <i
								class="fa fa-chevron-right"></i></a></span> <span>로그인 <i
							class="fa fa-chevron-right"></i></span>
					</p>
					<h1 class="mb-0 bread">회원정보 수정</h1>
				</div>
			</div>
		</div>
	</section>

	<div class="gmd gmd-2">
		<section id="container">
			<form action="/alpaca/memberUpdate" method="post" class="update">
				<div class="form-group has-feedback">
					<label class="control-label" for="id">ID</label> <input
						class="form-control" type="text" id="id" name="id"
						value="${member.id}" readonly="readonly" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="pwd">PASSWORD</label> <input
						class="form-control" type="password" id="pwd" name="pwd" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="name">NAME</label> <input
						class="form-control" type="text" id="name" name="name"
						value="${member.name}" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="email">EMAIL</label> <input
						class="form-control" type="text" id="email" name="email"
						value="${member.email}" />
				</div>

				<div class="form-group has-feedback" id="alpaca">
					<button class="btn btn-success" type="submit" id="submit">회원정보
						수정</button>
					<button type="button" class="btn btn-success"
						onclick="location.href='memberDeleteView'">회원 탈퇴</button>
					<button class="cancle btn btn-danger" type="button">취소</button>
				</div>
			</form>
	</div>
	</section>

	<footer class="ftco-footer ftco-no-pt" id="footer">
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
