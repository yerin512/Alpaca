<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat, java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
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
<script>
	function fn_communityForm(isLogOn,communityForm, index){
	  if(isLogOn != '' && isLogOn != 'false'){
	    location.href=communityForm;
	  }else{
	    alert("로그인 후 글쓰기가 가능합니다.")
	    location.href=index+'?action=/community/communityForm.do';
	  }
	}
</script>
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
						<span class="mr-2"><a href="index.html">Home <i
								class="fa fa-chevron-right"></i></a></span> <span>커뮤니티 <i
							class="fa fa-chevron-right"></i></span>
					</p>
					<h1 class="mb-0 bread">커뮤니티</h1>
				</div>
			</div>
		</div>
	</section>
 	<!-- 게시판 -->
 	<section class="communityList">
		  <div class="page-wrapper">
		    <div class="container-fluid">
		        <div class="col-lg-8 board"><!--게시판 넓이 -->
		            <div class="panel panel-default">
		                <div class="panel-heading">게시글 목록</div>
		                <div class="panel-body">
		                    <table class="table table-hover">
		                        <thead>
		                            <tr>
		                                <th>No.1</th>
		                                <th>제목</th>
		                                <th>작성자</th>
		                                <th>작성일</th>
		                            </tr>
		                        </thead>
		                        <tbody>
		                          <c:choose>
								  <c:when test="${communityList ==null }" >
								    <tr  height="10">
								      <td colspan="4">
								         <p align="center">
								            <b><span style="font-size:9pt;">등록된 글이 없습니다.</span></b>
								        </p>
								      </td>  
								    </tr>
								  </c:when>
								  <c:when test="${communityList !=null }" >
								    <c:forEach  var="community" items="${communityList }" varStatus="communityNum" >
								     <tr align="center">
									 <td width="5%">${communityNum.count}</td>
									<!--  <td>${community.c_no }</td>-->
									<td align='left'  width="35%">
									  <span style="padding-right:30px"></span>
									            <a class='cls1' href="${contextPath}/community/viewCommunity.do?c_no=${community.c_no}">${community.c_title }</a>
																  </td>
										<td>${community.c_date }</td>
										<td>${community.id }</td>
									</tr>
								    </c:forEach>
								     </c:when>
								    </c:choose>
		                        </tbody>
		                    </table>
		                </div>
		            </div>
		            <div class="row">
		                  <div class="col-lg-12">
		                      <button type="button" class="btn btn-outline btn-primary pull-right">
		                      <a href="javascript:fn_communityForm('${isLogOn}','${contextPath}/community/communityForm.do', 
		                                                    '${contextPath}/index.do')" class="btn"><i class="fa fa-edit fa-fw"></i>글  작성</a>
		                      </button>
		                  </div>
		              </div>
		             <div class="row mt-5">
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