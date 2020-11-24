<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원가입</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cancle").on("click", function(){
				
				location.href = "/trip/index.do";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#pwd").val()==""){
					alert("비밀번호 를 입력해주세요.");
					$("#pwd").focus();
					return false;
				}
				if($("#name").val()==""){
					alert("이름 을 입력해주세요.");
					$("#name").focus();
					return false;
				}
				if($("#Email").val()==""){
					alert("Email 을 입력해주세요.");
					$("#Email").focus();
					return false;
				}
			});
			
				
			
		})
	</script>
	<body>
		<section id="container">
			<form action="/trip/memberUpdate" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="id">아이디</label>
					<input class="form-control" type="text" id="id" name="id" value="${member.id}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="pwd">패스워드</label>
					<input class="form-control" type="password" id="pwd" name="pwd" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="name">성명</label>
					<input class="form-control" type="text" id="name" name="name" value="${member.name}"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="email">Email</label>
					<input class="form-control" type="text" id="email" name="email" value="${member.email}"/>
				</div>
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">회원 정보 수정</button>
					<button class="cancle btn btn-danger" type="button">취소</button>
				</div>
			</form>
		</section>
		
	</body>
	
</html>