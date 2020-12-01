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
	text-align: center;
	margin: 70px auto;
	padding: 0;
	width: 700px;
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

<script src="/resources/js/jquery-3.2.1.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<%-- 비밀번호 체크 스크립트 --%>
<script type="text/javascript">
	$(function() {
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function() {
			var pwd1 = $("#pwd1").val();
			var pwd2 = $("#pwd2").val();
			if (pwd1 != "" || pwd2 != "") {
				if (pwd1 == pwd2) {
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("#submit").removeAttr("disabled");
				} else {
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled");
				}
			}
		});
	});
</script>

<%-- 아이디 중복 체크 스크립트 --%>
<script type="text/javascript">
	$(function() {
		$("#signimp").hide();
		$("#signp").hide();
		$("input").keyup(function() {
			var id = $("#id").val();
			$.ajax({
				type : 'POST',
				data : {
					id : id
				},
				dataType : 'text',
				url : "idChk.do",
				success : function(data) {
					if (data != 0) {
						$("#signimp").show();
						$("#signp").hide();
						$("#submit").attr("disabled", "disabled");
					} else {
						$("#signimp").hide();
						$("#signp").show();
						$("#submit").removeAttr("disabled");
					}
				},
				error : function(data) {
					alert(data + "실패");
					console.dir();
				}
			});
		});
	});
</script>


<%-- 회원가입 후 로그인페이지로 이동 --%>
<script type="text/javascript">
	$(document).ready(function() {
		$(".btn").on("click", function() {
			alert("회원가입을 축하합니다. 로그인 페이지로 이동합니다.");
			location.href = "/trip/index.do";

		})
	})
</script>
</head>
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
					<h1 class="mb-0 bread">회원 가입</h1>
					<p>너가 '회원가입' 한다는것에 내 모든것을 건다. 쫄리면 뒈지시던가
				</div>
			</div>
		</div>
	</section>

	<section id="signUp_footer" class="ftco-section ftco-no-pb ftco-no-pt">
		<div class="container">
			<div class="row">
				<div class="col-md-12 order-md-last">
					<div class="p-4 p-md-5" id="sign_up_wrap">

						<form action="member/addMember.do" class="signup-form"
							method="post" enctype="multipart/form-data">

							<div class="form-group">
								<label class="label" for="id">ID</label> <input type="text"
									name="id" id="id" class="form-control" placeholder="ID">
								<div class="alert alert-success" id="signp">사용 가능한 ID 입니다</div>
								<div class="alert alert-danger" id="signimp">중복된 ID 입니다</div>
							</div>


							<div class="form-group">
								<label class="label" for="password">Password</label> <input
									id="pwd1" name="pwd" type="password" class="form-control"
									placeholder="Password">
							</div>
							<div class="form-group">
								<label class="label" for="password">Confirm Password</label> <input
									id="pwd2" type="password" class="form-control"
									placeholder="Confirm Password">
								<div class="alert alert-success" id="alert-success">비밀번호가
									일치합니다.</div>
								<div class="alert alert-danger" id="alert-danger">비밀번호가
									일치하지 않습니다.</div>
							</div>
							<div class="form-group">
								<label class="label" for="name">Full Name</label> <input
									type="text" id="id" name="name" class="form-control"
									placeholder="홍길동">
							</div>
							<div class="form-group">
								<label class="label" for="email">Email Address</label> <input
									id="email" type="text" name="email" class="form-control"
									placeholder="hong@gmail.com">

							</div>




							<div class="form-group d-flex justify-content-end mt-4">

								<button type="submit" id="submit" class="btn btn-primary submit"
									disabled>
									<span class="fa fa-paper-plane"> 가입하기</span>
								</button>
							</div>
						</form>
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
</body>
</html>
