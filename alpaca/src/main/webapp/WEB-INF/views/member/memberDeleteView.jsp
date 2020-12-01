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
.delete {
	
	text-align: center;
	margin: 70px auto;
	padding :0;
	width : 700px;
}
#delete {
	text-align: center;
	margin: 70px auto;
	padding :0;
	width : 700px;

}


</style>
<meta charset="UTF-8">
<title>알파카 - 헌 책 알고 팔자! 중고책거래 사이트</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="shortcut icon" href="${contextPath}/resources/images/favicon.ico"/>
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
			alert("메인 화면으로 돌아갑니다.")
			location.href = "/alpaca/index.do";

		})

		$("#submit").on("click", function() {
			if ($("#pwd").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#pwd").focus();
				return false;
			}
			$.ajax({
				url : "/alpaca/passChk",
				type : "POST",
				dataType : "json",
				data : $("#delForm").serializeArray(),
				success : function(data) {

					if (data == 0) {
						alert("패스워드가 틀렸습니다.");
						return;
					} else {
						if (confirm("회원탈퇴 하시겠습니까?")) {
							$("#delForm").submit();
						}

					}
				}
			})

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
					<h1 class="mb-0 bread">회원 탈퇴</h1>
					<p>꼭 ... 이렇게 떠나야만 속이 후련했냐!!!
				</div>
			</div>
		</div>
	</section>

	<section id="container">
		<form action="/alpaca/memberDelete" method="post" class = "delete" id = "delForm" >
			<div class="form-group has-feedback">
				<label class="control-label" for="id"><strong><h4>ID</h4></strong></label> <input
					class="form-control" type="text" id="id" name="id"
					value="${member.id}" readonly="readonly" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="pwd"><strong><h4>PASSWORD</h4></strong></label> <input
					class="form-control" type="password" id="pwd" name="pwd" />
			</div>
		</form>
		<div class="form-group has-feedback" id = "delete">
			<button class="btn btn-success" type="button" id="submit">회원탈퇴</button>
			<button class="cancle btn btn-danger" type="button">취소</button>
		</div>
		
		<div>
			<c:if test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:if>
		</div>
	</section>

	<footer class="ftco-footer ftco-no-pt">
		<div class="container">
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
</body>
</html>
