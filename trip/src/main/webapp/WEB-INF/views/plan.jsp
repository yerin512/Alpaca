<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>TRAVEL MAKER</title>
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
<style type="text/css">
* {
	margin: 0;
}
/*-------header---------*/
#planList_header {
	width: 100%;
	height: 600px;
	background: #7bc0f9;
}

#planList_inner {
	width: 1092px;
	margin: 0 auto;
}

#pinner_text {
	width: 100%;
	color: white;
	width: 100%;
	text-align: center;
	font-family: 'nanum_b';
	padding-top: 55px;
	padding-bottom: 55px;
	font-size: 36px;
	text-align: center;
}

#pinner_pbtn {
	width: 500px;
	height: 60px;
	margin: 0 auto;
}

#pinner_pbtn_1 {
	overflow: hidden;
	width: 200px;
	height: 60px;
	float: left;
	background-color: #848d9c;
	font-weight: bolder;
	color: white;
}

#pinner_pbtn_1 img {
	float: left;
	margin-top: 15px;
	margin-left: 10px;
}

#pinner_pbtn_1 span {
	float: left;
	height: 60px;
	line-height: 60px;
	margin-left: 10px;
}

#pinner_pbtn_2 {
	width: 170px;
	height: 60px;
	float: right;
	text-align: center;
	margin-right: 60px;
	background-color: #848d9c;
	font-weight: bolder;
	color: white;
}

#pinner_pbtn_2 img {
	float: left;
	margin-top: 15px;
	margin-left: 10px;
}

#pinner_pbtn_2 span {
	float: left;
	height: 60px;
	line-height: 60px;
	margin-left: 10px;
}
/*-------content----------  */
#planList_content {
	width: 100%;
	padding-top: 70px;
}

#pcontent_inner {
	width: 1092px;
	margin: 0 auto;
}

#pinner_header {
	text-align: center;
	font-weight: bolder;
	font-size: 25px;
	color: #505050;
	padding-bottom: 40px;
}

#pinner_filter {
	width: 100%;
	border: 1px solid #cfcfcf;
	margin-bottom: 20px;
}

.pfilter_filter_title {
	width: 140px;
	height: 50px;
	line-height: 50px;
	text-align: center;
	color: #555555;
	font-size: 14px;
	font-weight: bold;
	float: left;
	border-right: 1px solid #e3e3e3;
	border-bottom: 1px dotted #c8c8ca;
}

.pfilter_right_filter {
	float: left;
	width: 30%;
	height: 50px;
	border-bottom: 1px dotted #c8c8ca;
	height: 50px;
	line-height: 50px;
}
</style>
</head>
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
					<li class="nav-item active"><a href="index.do"
						class="nav-link">Home</a></li>
					<li class="nav-item"><a href="plan.do" class="nav-link">일정짜기</a></li>
					<li class="nav-item"><a href="with.do" class="nav-link">동행찾기</a></li>
					<li class="nav-item"><a href="themaTour.do" class="nav-link">맞춤테마</a></li>
					<li class="nav-item"><a href="myPage.do" class="nav-link">마이페이지</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<!-- section -->
	<div id="planList_header">
		<div id="planList_inner">
			<div id="pinner_text">같이 가도 좋지만 혼자 가면 더 좋은 여행</div>
			<div id="pinner_img">
				<img
					src="${pageContext.request.contextPath}/resources/images/plan/planList_header.jpg">
			</div>
			<div id="pinner_pbtn">
				<div id="pinner_pbtn_1">
					<a href="planMake.do"> <img
						src="${pageContext.request.contextPath}/resources/images/plan/makePlan.jpg">
						<span>새로운 일정 만들기</span>
					</a>
				</div>
				<div id="pinner_pbtn_2">
					<img
						src="${pageContext.request.contextPath}/resources/images/plan/myPlan.jpg">
					<span>My Planner</span>
				</div>
			</div>
		</div>
	</div>

	<div id="planList_content">

		<div id="pcontent_inner">

			<div id="pinner_header">
				<span>여행자들의 일정 보기</span>
			</div>

			<table id="pinner_filter">
				<th class="pfilter_filter_title">여행지</th>
				<tr class="pfilter_right_filter">
					<td class="pfilter_set_btn" data-hide="area_tab">서울</td>
					<td class="pfilter_set_btn" data-hide="area_tab">부산</td>
					<td class="pfilter_set_btn" data-hide="area_tab">제주도</td>
					<td class="pfilter_set_btn" data-hide="area_tab">속초</td>
					<td class="pfilter_set_btn" data-hide="area_tab">여수</td>
				</tr>

				<th class="pfilter_filter_title">여행일</th>
				<tr class="pfilter_right_filter">
					<td class="pfilter_set_btn" data-hide="tour_day">1일</td>
					<td class="pfilter_set_btn" data-hide="tour_day">2-3일</td>
					<td class="pfilter_set_btn" data-hide="tour_day">4-6일</td>
					<td class="pfilter_set_btn" data-hide="tour_day">7일 이상</td>
				</tr>

				<th class="pfilter_filter_title">여행시기</th>
				<tr class="pfilter_right_filter">
					<td class="pfilter_set_btn" data-hide="tour_ss" data="1">봄</td>
					<td class="pfilter_set_btn" data-hide="tour_ss" data="2">여름</td>
					<td class="pfilter_set_btn" data-hide="tour_ss" data="3">가을</td>
					<td class="pfilter_set_btn" data-hide="tour_ss" data="4">겨울</td>
				</tr>

				<th class="pfilter_filter_title">여행테마</th>
				<tr class="pfilter_right_filter">
					<td class="pfilter_set_btn" data-hide="theme" data="">힐링</td>
					<td class="pfilter_set_btn" data-hide="theme" data="">맛집 탐방</td>
					<td class="pfilter_set_btn" data-hide="theme" data="">하루 1만보 달성</td>
					<td class="pfilter_set_btn" data-hide="theme" data="">따로 또 같이</td>
				</tr>
			</table>

			<div id="pinner_list"></div>
			<div id="pinner_page"></div>
		</div>
	</div>