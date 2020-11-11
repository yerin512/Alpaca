<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
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
					<p class="breadcrumbs"><span class="mr-2"><a href="index.do">Home <i class="fa fa-chevron-right"></i></a></span> <span>맞춤테마 <i class="fa fa-chevron-right"></i></span></p>
					<h1 class="mb-0 bread">맞춤테마</h1>
				</div>
			</div>
		</div>
	</section>


<section class="ftco-section testimony-section bg-light">
 <div class="overlay" style="background-image: url(${contextPath}/resources/images/bg_2.jpg);"></div>
 <div class="container">
  <div class="row pb-4">
    <div class="col-md-7 heading-section ftco-animate">
     <span class="subheading">Testimonial</span>
     <h2 class="mb-4">What Are Students Says</h2>
   </div>
 </div>
</div>
<div class="container container-2">
  <div class="row ftco-animate">
    <div class="col-md-12">
      <div class="carousel-testimony owl-carousel">
        <div class="item">
          <div class="testimony-wrap py-4">
            <div class="text">
             <p class="star">
              <span class="fa fa-star"></span>
              <span class="fa fa-star"></span>
              <span class="fa fa-star"></span>
              <span class="fa fa-star"></span>
              <span class="fa fa-star"></span>
            </p>
            <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
            <div class="d-flex align-items-center">
             <div class="user-img" style="background-image: url(${contextPath}/resources/images/person_1.jpg)"></div>
             <div class="pl-3">
              <p class="name">Roger Scott</p>
              <span class="position">Marketing Manager</span>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="item">
      <div class="testimony-wrap py-4">
        <div class="text">
         <p class="star">
          <span class="fa fa-star"></span>
          <span class="fa fa-star"></span>
          <span class="fa fa-star"></span>
          <span class="fa fa-star"></span>
          <span class="fa fa-star"></span>
        </p>
        <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
        <div class="d-flex align-items-center">
         <div class="user-img" style="background-image: url(${contextPath}/resources/images/person_2.jpg)"></div>
         <div class="pl-3">
          <p class="name">Roger Scott</p>
          <span class="position">Marketing Manager</span>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="item">
  <div class="testimony-wrap py-4">
    <div class="text">
     <p class="star">
      <span class="fa fa-star"></span>
      <span class="fa fa-star"></span>
      <span class="fa fa-star"></span>
      <span class="fa fa-star"></span>
      <span class="fa fa-star"></span>
    </p>
    <p class="mb-4">부산</p>
    <div class="d-flex align-items-center">
     <div class="user-img" style="background-image: url(${contextPath}/resources/images/person_3.jpg)"></div>
     <div class="pl-3">
      <p class="name">Roger Scott</p>
      <span class="position">Marketing Manager</span>
    </div>
  </div>
</div>
</div>
</div>
<div class="item">
  <div class="testimony-wrap py-4">
    <div class="text">
     <p class="star">
      <span class="fa fa-star"></span>
      <span class="fa fa-star"></span>
      <span class="fa fa-star"></span>
      <span class="fa fa-star"></span>
      <span class="fa fa-star"></span>
    </p>
    <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
    <div class="d-flex align-items-center">
     <div class="user-img" style="background-image: url(${contextPath}/resources/images/person_1.jpg)"></div>
     <div class="pl-3">
      <p class="name">Roger Scott</p>
      <span class="position">Marketing Manager</span>
    </div>
  </div>
</div>
</div>
</div>
<div class="item">
  <div class="testimony-wrap py-4">
    <div class="text">
     <p class="star">
      <span class="fa fa-star"></span>
      <span class="fa fa-star"></span>
      <span class="fa fa-star"></span>
      <span class="fa fa-star"></span>
      <span class="fa fa-star"></span>
    </p>
    <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
    <div class="d-flex align-items-center">
     <div class="user-img" style="background-image: url(${contextPath}/resources/images/person_2.jpg)"></div>
     <div class="pl-3">
      <p class="name">Roger Scott</p>
      <span class="position">Marketing Manager</span>
    </div>
  </div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</section>
 <div class="container">
  <div class="row pb-4">
    <div class="col-md-7 heading-section ftco-animate">
     <span class="subheading">Testimonial</span>
     <h2 class="mb-4">추천 투어테마</h2>
   </div>
 </div>
</div>
<section class="ftco-section bg-light">
  <div class="container">
    <div class="row d-flex">
      <div class="col-lg-4 ftco-animate">
        <div class="blog-entry">
          <a href="blog-single.do" class="block-20" style="background-image: url('${contextPath}/resources/images/image_1.jpg');">
          </a>
          <div class="text d-block">
           <div class="meta">
            <p>
             <a href="#"><span class="fa fa-calendar mr-2"></span>Sept. 17, 2020</a>
             <a href="#"><span class="fa fa-user mr-2"></span>Admin</a>
             <a href="#" class="meta-chat"><span class="fa fa-comment mr-2"></span> 3</a>
           </p>
         </div>
         <h3 class="heading"><a href="#">I'm not creative, Should I take this course?</a></h3>
         <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia...</p>
         <p><a href="blog.do" class="btn btn-secondary py-2 px-3">Read more</a></p>
       </div>
     </div>
   </div>

   <div class="col-lg-4 ftco-animate">
    <div class="blog-entry">
      <a href="blog-single.do" class="block-20" style="background-image: url('${contextPath}/resources/images/image_2.jpg');">
      </a>
      <div class="text d-block">
       <div class="meta">
        <p>
         <a href="#"><span class="fa fa-calendar mr-2"></span>Sept. 17, 2020</a>
         <a href="#"><span class="fa fa-user mr-2"></span>Admin</a>
         <a href="#" class="meta-chat"><span class="fa fa-comment mr-2"></span> 3</a>
       </p>
     </div>
     <h3 class="heading"><a href="#">I'm not creative, Should I take this course?</a></h3>
     <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia...</p>
     <p><a href="blog.do" class="btn btn-secondary py-2 px-3">Read more</a></p>
   </div>
 </div>
</div>
<div class="col-lg-4 ftco-animate">
  <div class="blog-entry">
    <a href="blog-single.do" class="block-20" style="background-image: url('${contextPath}/resources/images/image_3.jpg');">
    </a>
    <div class="text d-block">
     <div class="meta">
      <p>
       <a href="#"><span class="fa fa-calendar mr-2"></span>Sept. 17, 2020</a>
       <a href="#"><span class="fa fa-user mr-2"></span>Admin</a>
       <a href="#" class="meta-chat"><span class="fa fa-comment mr-2"></span> 3</a>
     </p>
   </div>
   <h3 class="heading"><a href="#">I'm not creative, Should I take this course?</a></h3>
   <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia...</p>
   <p><a href="blog.do" class="btn btn-secondary py-2 px-3">Read more</a></p>
 </div>
</div>
</div>
<div class="col-lg-4 ftco-animate">
  <div class="blog-entry">
    <a href="blog-single.do" class="block-20" style="background-image: url('${contextPath}/resources/images/image_4.jpg');">
    </a>
    <div class="text d-block">
     <div class="meta">
      <p>
       <a href="#"><span class="fa fa-calendar mr-2"></span>Sept. 17, 2020</a>
       <a href="#"><span class="fa fa-user mr-2"></span>Admin</a>
       <a href="#" class="meta-chat"><span class="fa fa-comment mr-2"></span> 3</a>
     </p>
   </div>
   <h3 class="heading"><a href="#">I'm not creative, Should I take this course?</a></h3>
   <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia...</p>
   <p><a href="blog.do" class="btn btn-secondary py-2 px-3">Read more</a></p>
 </div>
</div>
</div>

<div class="col-lg-4 ftco-animate">
  <div class="blog-entry">
    <a href="blog-single.do" class="block-20" style="background-image: url('${contextPath}/resources/images/image_5.jpg');">
    </a>
    <div class="text d-block">
     <div class="meta">
      <p>
       <a href="#"><span class="fa fa-calendar mr-2"></span>Sept. 17, 2020</a>
       <a href="#"><span class="fa fa-user mr-2"></span>Admin</a>
       <a href="#" class="meta-chat"><span class="fa fa-comment mr-2"></span> 3</a>
     </p>
   </div>
   <h3 class="heading"><a href="#">I'm not creative, Should I take this course?</a></h3>
   <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia...</p>
   <p><a href="blog.do" class="btn btn-secondary py-2 px-3">Read more</a></p>
 </div>
</div>
</div>
<div class="col-lg-4 ftco-animate">
  <div class="blog-entry">
    <a href="blog-single.do" class="block-20" style="background-image: url('${contextPath}/resources/images/image_6.jpg');">
    </a>
    <div class="text d-block">
     <div class="meta">
      <p>
       <a href="#"><span class="fa fa-calendar mr-2"></span>Sept. 17, 2020</a>
       <a href="#"><span class="fa fa-user mr-2"></span>Admin</a>
       <a href="#" class="meta-chat"><span class="fa fa-comment mr-2"></span> 3</a>
     </p>
   </div>
   <h3 class="heading"><a href="#">I'm not creative, Should I take this course?</a></h3>
   <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia...</p>
   <p><a href="blog.do" class="btn btn-secondary py-2 px-3">Read more</a></p>
 </div>
</div>
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