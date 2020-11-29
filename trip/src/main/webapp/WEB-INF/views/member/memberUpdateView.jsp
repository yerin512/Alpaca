<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
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
		$("#submit").on("click", function() {
			alert("회원정보가 수정되었습니다. 로그인 페이지로 이동합니다.");
			location.href = "/trip/index.do";

		})
	})
</script>
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