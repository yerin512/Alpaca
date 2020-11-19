<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html lang="en">
<head>
   <title>Travel Maker - 개인 맞춤형 여행 사이트</title>
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
<style>
#board_write_se .w_table{margin:30px auto!important;}
	#board_write_se .w_table td{margin-botton:10px!important;border-spacing:43spx}
	.sw_btn{margin-bottom:25px}
#board_write_se .btn{background: #4986fc !important;padding:5px 13px !important; border: 1px solid #4986fc !important;color: #fff !important; }

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
       <p class="breadcrumbs"><span class="mr-2"><a href="index.do">Home <i class="fa fa-chevron-right"></i></a></span> <span>일정짜기 <i class="fa fa-chevron-right"></i></span></p>
       <h1 class="mb-0 bread">일정짜기</h1>
     </div>
   </div>
 </div>
</section>

<section id="board_write_se">
	<table>
		<form name="BoardWriteForm" method="post" action="Board_Write_action.jsp" 
														onsubmit="return boardWriteCheck();" >
   		<colgroup>
   			<col width="20%">
   			<col width="80%">
   		</colgroup>
		<table class="w_table" >
    		<tr>
     			<td>제 목</td>
     			<td><input type=text name=title></td>
    		</tr>
    		<tr>
     			<td>본 문</td>
     			 <td><textarea id="popContent" name="popContent" cols="108" rows="15"></textarea></td>

    		</tr>
    		<tr>
     			<td>태그 선택</td> 
     			<td>
     			 	<div class="checkBox">
					<label for="style01">
			        <input type="checkbox" id="style01" />힐링</label>
			        <label for="style02">
			        <input type="checkbox" id="style02" />가성비</label>
			        <label for="style03">
			        <input type="checkbox" id="style03" />플렉스</label>
			        <label for="style04">
			        <input type="checkbox" id="style04" />힐링</label>
			        <label for="style05">
			        <input type="checkbox" id="style05" />가성비</label>
			        <br>
			        <label for="style06">
			        <input type="checkbox" id="style06" />플렉스</label>
			        <label for="style07">
			        <input type="checkbox" id="style07" />힐링</label>
			        <label for="style08">
			        <input type="checkbox" id="style08" />가성비</label>
			        <label for="style09">
			        <input type="checkbox" id="style09" />플렉스</label>
			        <label for="style10">
			        <input type="checkbox" id="style10" />플렉스</label>
			        <br>
			        <label for="style11">
			        <input type="checkbox" id="style01" />힐링</label>
			        <label for="style12">
			        <input type="checkbox" id="style02" />가성비</label>
			        <label for="style13">
			        <input type="checkbox" id="style03" />플렉스</label>
			        <label for="style14">
			        <input type="checkbox" id="style04" />힐링</label>
			        <label for="style15">
			        <input type="checkbox" id="style05" />가성비</label>
				</div>
     			</td>
    		</tr>
    		<tr>
     			<td colspan=2><hr size=1></td>
    		</tr>
    		<tr>
     			<td colspan="2"><div class="sw_btn" align="center">
     			<input class="btn" type="submit" value="등록" >&nbsp;&nbsp;
         		<input class="btn" type="button" value="뒤로" onclick="location.href='with.do'"></div>
     			</td>
    		</tr> 
		</table>
	</form> 
</table>

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
<script type="text/javascript" src="se2/js/HuskyEZCreator.js" charset="utf-8"></script> <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>


</body>
</html>

<!-- SmartEditor2 --> <script type="text/javascript" src = "resources/js/notice-write.js"></script>

