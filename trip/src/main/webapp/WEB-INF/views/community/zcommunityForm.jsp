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
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
   function readURL(input) {
      if (input.files && input.files[0]) {
	      var reader = new FileReader();
	      reader.onload = function (e) {
	        $('#preview').attr('src', e.target.result);
          }
         reader.readAsDataURL(input.files[0]);
      }
  }  
  function backToList(obj){
    obj.action="${contextPath}/community/listCommunity.do";
    obj.submit();
  }

</script>
<style>
#board_write_se .w_table{margin:30px auto!important;}
	#board_write_se .w_table td{margin-botton:10px!important;border-spacing:43spx}
	.sw_btn{margin-bottom:25px}
#board_write_se .btn{background: #4986fc !important;padding:5px 13px !important; border: 1px solid #4986fc !important;color: #fff !important; }

</style>
<body>

 <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
   <div class="container">
     <a class="navbar-brand" href="index.do">알파카 <span class="navbar-brandsp">중고책 거래소</span></a>
     <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
     <span class="oi oi-menu"></span> Menu
   </button>

   <div class="collapse navbar-collapse" id="ftco-nav">
      <ul class="navbar-nav ml-auto">
         <li class="nav-item active"><a href="${contextPath}/index.do" class="nav-link">Home</a></li>
         <li class="nav-item"><a href="${contextPath}/board/listArticles.do" class="nav-link">책거래</a></li>
         <li class="nav-item"><a href="${contextPath}/around/aroundMap.do" class="nav-link">주변거래</a></li>
         <li class="nav-item"><a href="${contextPath}/themaTour.do" class="nav-link">채팅</a></li>
         <li class="nav-item"><a href="${contextPath}/community/listCommunity.do" class="nav-link">커뮤니티</a></li>

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

<section id="community_write_se">
	<table>
		<form name="communityForm" method="post"   action="${contextPath}/community/addNewCommunity.do"   enctype="multipart/form-data">
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
     			 <td><textarea id="content" name="content" cols="108" rows="15"></textarea></td>

    		</tr>
    		<tr>
    			<td align="right">이미지파일 첨부:  </td>
	     		<td> <input type="file" name="imageFileName"  onchange="readURL(this);" /></td>
        		<td><img  id="preview" src="#"   width=200 height=200/></td>
    		</tr>
    		<tr>
     			<td colspan=2><hr size=1></td>
    		</tr>
    		
    		<tr>
     			<td colspan="2"><div class="sw_btn" align="center">
     			<input class="btn" type="submit" value="등록" >&nbsp;&nbsp;
         		<input class="btn" type="button" value="뒤로" onclick="backToList(this.form)'"></div>
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

