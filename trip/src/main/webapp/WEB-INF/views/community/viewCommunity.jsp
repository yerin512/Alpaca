<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat, java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>       
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set  var="communitysList"  value="${communityMap.communitysList}" />
<c:set  var="totcommunity"  value="${communityMap.totcommunitys}" />
<c:set  var="section"  value="${communityMap.section}" />
<c:set  var="pageNum"  value="${communityMap.pageNum}" />
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html lang="en">
<head>
	<title>알파카 - 헌 책 알고 팔자! 중고책거래 사이트</title>
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
</head>
 <script  src="http://code.jquery.com/jquery-latest.min.js"></script> 
   <script type="text/javascript" >
   
     function backToList(obj){
	    obj.action="${contextPath}/community/listCommunity.do";
	    obj.submit();
     }
 
	 function fn_enable(obj){
		 document.getElementById("i_title").disabled=false;
		 document.getElementById("i_content").disabled=false;
		 document.getElementById("tr_btn_modify").style.display="block";
		 document.getElementById("tr_btn").style.display="none";
	 }
	 
	 function fn_modify_community(obj){
		 document.getElementById("tr_btn").style.display="none";
		 obj.action="${contextPath}/community/modCommunity.do";
		 obj.submit();
	 }
	 
	 function fn_remove_community(url,c_no){
		 var form = document.createElement("form");
		 form.setAttribute("method", "post");
		 form.setAttribute("action", url);
	     var c_noInput = document.createElement("input");
	     c_noInput.setAttribute("type","hidden");
	     c_noInput.setAttribute("name","c_no");
	     c_noInput.setAttribute("value", c_no);
		 
	     form.appendChild(c_noInput);
	     document.body.appendChild(form);
	     form.submit();
	 
	 }
	 
	 function readURL(input) {
	     if (input.files && input.files[0]) {
	         var reader = new FileReader();
	         reader.onload = function (e) {
	             $('#preview').attr('src', e.target.result);
	         }
	         reader.readAsDataURL(input.files[0]);
	     }
	 }  
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

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item "><a href="${contextPath}/index.do"
						class="nav-link">Home</a></li>
					<li class="nav-item"><a
						href="${contextPath}/board/listArticles.do" class="nav-link">책거래</a></li>
					<li class="nav-item"><a
						href="${contextPath}/around/aroundMap.do" class="nav-link">주변거래</a></li>
					<li class="nav-item"><a href="${contextPath}/chat/login.do"
						class="nav-link">채팅하기</a></li>
					<li class="nav-item active"><a
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
						<span class="mr-2"><a href="index.do">Home <i
								class="fa fa-chevron-right"></i></a></span> <span>커뮤니티 <i
							class="fa fa-chevron-right"></i></span>
					</p>
					<h1 class="mb-0 bread">커뮤니티</h1>
				</div>
			</div>
		</div>
	</section>
	<!-- 게시판 -->
	<section class="viewCommunity">
		<div class="page-wrapper">
			<div class="container-fluid">
				<div class="col-lg-12 board">
					<!--게시판 넓이 -->
					<h3>커뮤니티</h3>
					<form name="frmCommunity" method="post" action="${contextPath}"
						enctype="multipart/form-data">
						<table class="form_table" align="center">
							<tr>
								<td><input type="hidden" name="c_no"
									value="${community.c_no}" /></td>
							</tr>
							<tr>
								<td><input type=text value="${community.c_title }"
									name="c_title" id="i_title" disabled /></td>

							</tr>
							<tr class="flot_tr">
								<td><input type=text value="${community.id }" name="id"
									disabled /> <input type=text
									value="<fmt:formatDate value="${community.c_date}" />" disabled />
								</td>
							</tr>

							<tr>
								<td><textarea rows="20" cols="120" name="c_content"
										id="i_content" disabled />${community.c_content }</textarea></td>
							</tr>

							<tr id="tr_btn_modify" align="center">
								<td colspan="2"><input type=button value="수정"
									onClick="fn_modify_community(frmCommunity)"
									class="btn btn-outline btn-primary pull-right"> <input
									type=button value="취소" onClick="backToList(frmCommunity)"
									class="btn btn-outline btn-primary pull-right"></td>
							</tr>
							<tr id="tr_btn">
								<td colspan="12" align="center"><c:if
										test="${member.id == community.id }">
										<input type=button value="수정" onClick="fn_enable(this.form)"
											class="btn btn-outline btn-primary pull-right">
										<input type=button value="삭제"
											onClick="fn_remove_community('${contextPath}/community/removeCommunity.do', ${community.c_no})"
											class="delete_btn btn btn-outline btn-primary pull-right">
									</c:if> <input type=button value="목록" onClick="backToList(this.form)"
									class="btn btn-outline btn-primary pull-right"></td>
							</tr>
						</table>
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
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>document.write(new Date().getFullYear());</script>
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