<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat, java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html lang="en">
<head>
	<title>StudyLab - Free Bootstrap 4 Template by Colorlib</title>
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
<script type="text/javascript">
$(document).ready(function() {   
    $(".checkBox_btn").mouseover(function(){
        $(".checkBox").show();
    });
    $(".checkBox_btn").mouseout(function(){
        $(".checkBox").hide();
    });
});
</script>
<style>

.bestTM_area .best_list li{width: 150px;text-align: center;}
.bestTM_area .best_list_4 li{width: 150px;text-align: center;}
.bestTM_area .best_list li+li{margin-left: 40px;}
.bestTM_area .best_list .thumb{width: 150px;height: 130px;}
.bestTM_area .best_list_4 .thumb_product{width: 255px;height: 242px;}
.bestTM_area .best_list .thumb img{margin: auto;height: 100%;}
.mainT .best_list span{display: block; text-align:right;}
.bestTM_area .best_list .info{padding-top: 12px;text-align: center;}
.bestTM_area .best_list .info span+span{padding-top: 10px;}
.checkBox{display:none}
/*with board_list*/
.Board_list{margin:130px auto}
.Board_list .board{margin:0 auto;}
.content_wrap .col-lg-8{margin:50px auto 60px}
.Board_list .btn{background: #4986fc !important;padding:4px !important; border: 1px solid #4986fc !important;color: #fff !important; }
/**/

.searchWrap .mainT {
    padding-top: 50px;
    margin-top: 50px;
    padding-left: 0;
    padding-right: 0;
}

.searchWrap.subWrap .container {
    padding-bottom: 0;
}

.new_search_box li {
    float: left;
    border: 0 !important;
    padding: 0 !important;
    height: auto;
    width: auto;
    position: relative;
}

.new_wrap_wrap {
    padding-top: 0;
}

.new_travel_list .product_list {
    padding: 0 0 50px 0;
    min-height: 400px;
}

.new_search_area .main_tit_area {
    text-align: left;
}

.new_search_area .main_tit_area h2 {
    font-size: 20px;
}

.new_search_area .main_tit_area p {
    font-size: 20px;
}

.new_search_area .main_tit_area span {
    font-size: 14px;
    color:#777
}

.new_search_area {
	margin:0 auto;
    padding-bottom: 60px;
}

.new_search_box select, .new_search_box input {
    border: 1px solid #D2D2D2;
    background: #fff;
    height: 38px;
    width: 151px;
}

.new_search_box .canlender input {
    width: 140px;
    position: static;
}

.new_search_area li {
    margin-right: 20px;
    overflow: inherit;
    list-style:none
}

.new_search_area li:last-of-type {
    margin-right: 0px;
}

.new_search_area .search_ico {
    left: inherit;
    right: 10px;
}

.new_search_area label input {
    width: 180px;
    padding-right: 14px;
    padding-left: 10px;
}

.new_search_area .auto_select li {
    padding: 10px 20px !important;
    margin-right: 0 !important;
    float: none;
}

#selectTR .bestUT_area > .best_list {
    padding: 50px 0;
    min-height: 400px;
}

.new_search_tm .main_tit_area {
    text-align: left;
}

.searchWrap .search_bestTM .best_list li {
    width: 50%;
}

.new_best_tm_slider .slick-slider {
    margin: 0 -15px;
}

.new_best_tm_slider .slick-slide {
    margin-right: 15px;
    margin-left: 15px;
}

.new_best_tm_slider .new_profile {
    padding: 10px 10px 18px 10px;
}

.new_best_tm_slider .new_profile a:hover .go {
    color: #FF7358;
    border-bottom: 1px solid #FF7358;
}

.new_best_tm_slider .go {
    display: inline-block;
    border-bottom: 1px solid #777;
    color: #777;
    padding-bottom: 3px;
}

.new_plan_list li {
    width: calc(33.333% - 14px) !important;
    margin-right: 20px;
    margin-left: 0 !important;
    margin-bottom: 20px;
}

.new_plan_list li:nth-of-type(3n) {
    margin-right: 0;
}

.new_tm_search_area {
    background: #FAFAFA;
}

.new_plan_list {
    clear: both;
    padding-left: 0 !important;
    padding-right: 0 !important;
}

.clearfix2 > *:first-child {
    float: left;
}

.clearfix2 > *:nth-child(2) {
    float: right;
}
</style>
<body>
	 <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
   <div class="container">
     <a class="navbar-brand" href="index.do"><span>TRAVEL </span>MAKER</a>
     <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
       <span class="oi oi-menu"></span> Menu
   </button>

   <div class="collapse navbar-collapse" id="ftco-nav">
      <ul class="navbar-nav ml-auto">
         <li class="nav-item active"><a href="index.do" class="nav-link">Home</a></li>
         <li class="nav-item"><a href="plan.do" class="nav-link">일정짜기</a></li>
         <li class="nav-item"><a href="with.do" class="nav-link">동행찾기</a></li>
         <li class="nav-item"><a href="themaTour.do" class="nav-link">맞춤테마</a></li>
           <li class="nav-item"><a href="myPage.do" class="nav-link">마이페이지</a></li>
     </ul>
   </div>
</div>
</nav>
	<!-- END nav -->
	
	<section class="hero-wrap hero-wrap-2" style="background-image: url('${contextPath}/resources/images/bg_2.jpg');">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate pb-5 text-center">
					<p class="breadcrumbs"><span class="mr-2"><a href="index.do">Home <i class="fa fa-chevron-right"></i></a></span> <span>동행찾기 <i class="fa fa-chevron-right"></i></span></p>
					<h1 class="mb-0 bread">동행찾기</h1>
				</div>
			</div>
		</div>
	</section>
	<section class="content_wrap">
	<div class="clearfix2 new_search_area col-md-8">
                            <div class="main_tit_area search_title">
                                <p>동행찾기</p>
								<span>편리한 검색으로 내가 원하는 동행자를 찾아보세요!</span>
                            </div>
                            <div class="wantWrap new_wrap_wrap">
                                <!--new search_box"-->
                                <div class="new_search_box">
                                    <ul class="clearfix">
                                        <li>
                                            <label for="">
                                                <input type="text" placeholder="국가 > 도시" name="search_area" style="width: 522px;" autocomplete="off">
                                                <i class="search_ico"></i>
                                                <ul class="auto_select" style="display:none;position:absolute;width:100%;z-index:100;overflow:auto;height:200px;font-size: 12px;"></ul>
                                            </label>
                                        </li>
                                        <div class="clearfix"></div>

                                        <li style="margin-top: 5px;">
                                            <select name="search_class" class="">
                                                <option value="">인기순/후기순/최신순</option>
                                                <option value="인기순">인기순</option>
                                                <option value="후기순">후기순</option>
                                                <option value="최신순">최신순</option>
                                            </select>
                                        </li>
                                        <li style="display: none;">
                                            <div class="canlender">
                                                <i class="calender_ico"></i>
                                                <input type="text" id="datepicker2" name="search_date" placeholder="YYYY-MM-DD" class="hasDatepicker">
                                            </div>
                                        </li>
                                        <li style="maarch_box3 icon_select">
                                                <ul class="tr_type_search txtG">
                                                    <li class="txtG list_on"><i class=""><a href="#"></i>동행 스타일</li></a>
                                                </ul>
                                                <div id="hideBox" class="checkBox tr_type_list">
													<label for="style01">
											        <input type="checkbox" id="style01">힐링</input></label>
											        <label for="style01">
											        <input type="checkbox" id="style02" />가성비</label>
											        <label for="style01">
											        <input type="checkbox" id="style03" />플렉스</label>
											        <label for="style01">
											        <input type="checkbox" id="style04" />힐링</label>
											        <label for="style01">
											        <input type="checkbox" id="style05" />가성비</label>
											        <br>
											        <label for="style01">
											        <input type="checkbox" id="style06" />플렉스</label>
											        <label for="style01">
											        <input type="checkbox" id="style07" />힐링</label>
											        <label for="style01">
											        <input type="checkbox" id="style08" />가성비</label>
											        <label for="style01">
											        <input type="checkbox" id="style09" />플렉스</label>
											        <label for="style01">
											        <input type="checkbox" id="style10" />플렉스</label>
											        <br>
											        <label for="style01">
											        <input type="checkbox" id="style01" />힐링</label>
											        <label for="style01">
											        <input type="checkbox" id="style02" />가성비</label>
											        <label for="style01">
											        <input type="checkbox" id="style03" />플렉스</label>
											        <label for="style01">
											        <input type="checkbox" id="style04" />힐링</label>
											        <label for="style01">
											        <input type="checkbox" id="style05" />가성비</label>
												</div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
			</div>
		</form>
		</div>
	</section>
 	<!-- 게시판 -->
 	<hr>
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	<section class="Board_list">
 		
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
                                <th>조회수</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>제목</td>
                                <td>작성자</td>
                                <td>작성일</td>
                                <td>조회수</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>제목</td>
                                <td>작성자</td>
                                <td>작성일</td>
                                <td>조회수</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>제목</td>
                                <td>작성자</td>
                                <td>작성일</td>
                                <td>조회수</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row">
                  <div class="col-lg-12">
                      <button type="button" class="btn btn-outline btn-primary pull-right">
                      <a href="insertBoard.do" class="btn"><i class="fa fa-edit fa-fw"></i>글  작성</a>
                      </button>
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

    <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
      Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
      <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
  </div>
</div>
</div>
</footer>
			<!-- loader -->
			<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


			<script src="resources/js/jquery.min.js"></script>
			<script src="resources/js/jquery-migrate-3.0.1.min.js"></script>
			<script src="resources/js/popper.min.js"></script>
			<script src="resources/js/bootstrap.min.js"></script>
			<script src="resources/js/jquery.easing.1.3.js"></script>
			<script src="resources/js/jquery.waypoints.min.js"></script>
			<script src="resources/js/jquery.stellar.min.js"></script>
			<script src="resources/js/owl.carousel.min.js"></script>
			<script src="resources/js/jquery.magnific-popup.min.js"></script>
			<script src="resources/js/jquery.animateNumber.min.js"></script>
			<script src="resources/js/bootstrap-datepicker.js"></script>
			<script src="resources/js/scrollax.min.js"></script>
			<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
			<script src="resources/js/google-map.js"></script>
			<script src="resources/js/main.js"></script>
			
		</body>
		</html>