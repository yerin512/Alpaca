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
         <li class="nav-item"><a href="about.do" class="nav-link">일정짜기</a></li>
         <li class="nav-item"><a href="course.do" class="nav-link">동행찾기</a></li>
         <li class="nav-item"><a href="instructor.do" class="nav-link">맞춤테마</a></li>
           <li class="nav-item"><a href="blog.do" class="nav-link">마이페이지</a></li>
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

	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 sidebar">
					<div class="sidebar-box bg-white ftco-animate">
						<form action="#" class="search-form">
							<div class="form-group">
								<span class="icon fa fa-search"></span>
								<input type="text" class="form-control" placeholder="Search...">
							</div>
						</form>
					</div>

					<div class="sidebar-box bg-white p-4 ftco-animate">
						<h3 class="heading-sidebar">Course Category</h3>
						<form action="#" class="browse-form">
							<label for="option-category-1"><input type="checkbox" id="option-category-1" name="vehicle" value="" checked> Design &amp; Illustration</label><br>
							<label for="option-category-2"><input type="checkbox" id="option-category-2" name="vehicle" value=""> Web Development</label><br>
							<label for="option-category-3"><input type="checkbox" id="option-category-3" name="vehicle" value=""> Programming</label><br>
							<label for="option-category-4"><input type="checkbox" id="option-category-4" name="vehicle" value=""> Music &amp; Entertainment</label><br>
							<label for="option-category-5"><input type="checkbox" id="option-category-5" name="vehicle" value=""> Photography</label><br>
							<label for="option-category-6"><input type="checkbox" id="option-category-6" name="vehicle" value=""> Health &amp; Fitness</label><br>
						</form>
					</div>

					<div class="sidebar-box bg-white p-4 ftco-animate">
						<h3 class="heading-sidebar">Course Instructor</h3>
						<form action="#" class="browse-form">
							<label for="option-instructor-1"><input type="checkbox" id="option-instructor-1" name="vehicle" value="" checked> Ronald Jackson</label><br>
							<label for="option-instructor-2"><input type="checkbox" id="option-instructor-2" name="vehicle" value=""> John Dee</label><br>
							<label for="option-instructor-3"><input type="checkbox" id="option-instructor-3" name="vehicle" value=""> Nathan Messy</label><br>
							<label for="option-instructor-4"><input type="checkbox" id="option-instructor-4" name="vehicle" value=""> Tony Griffin</label><br>
							<label for="option-instructor-5"><input type="checkbox" id="option-instructor-5" name="vehicle" value=""> Ben Howard</label><br>
							<label for="option-instructor-6"><input type="checkbox" id="option-instructor-6" name="vehicle" value=""> Harry Potter</label><br>
						</form>
					</div>

					<div class="sidebar-box bg-white p-4 ftco-animate">
						<h3 class="heading-sidebar">Course Type</h3>
						<form action="#" class="browse-form">
							<label for="option-course-type-1"><input type="checkbox" id="option-course-type-1" name="vehicle" value="" checked> Basic</label><br>
							<label for="option-course-type-2"><input type="checkbox" id="option-course-type-2" name="vehicle" value=""> Intermediate</label><br>
							<label for="option-course-type-3"><input type="checkbox" id="option-course-type-3" name="vehicle" value=""> Advanced</label><br>
						</form>
					</div>

					<div class="sidebar-box bg-white p-4 ftco-animate">
						<h3 class="heading-sidebar">Software</h3>
						<form action="#" class="browse-form">
							<label for="option-software-1"><input type="checkbox" id="option-software-1" name="vehicle" value="" checked> Adobe Photoshop</label><br>
							<label for="option-software-2"><input type="checkbox" id="option-software-2" name="vehicle" value=""> Adobe Illustrator</label><br>
							<label for="option-software-3"><input type="checkbox" id="option-software-3" name="vehicle" value=""> Sketch</label><br>
							<label for="option-software-4"><input type="checkbox" id="option-software-4" name="vehicle" value=""> WordPress</label><br>
							<label for="option-software-5"><input type="checkbox" id="option-software-5" name="vehicle" value=""> HTML &amp; CSS</label><br>
						</form>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="row">
						<div class="col-md-6 d-flex align-items-stretch ftco-animate">
							<div class="project-wrap">
								<a href="#" class="img" style="background-image: url(images/work-1.jpg);">
									<span class="price">Software</span>
								</a>
								<div class="text p-4">
									<h3><a href="#">Design for the web with adobe photoshop</a></h3>
									<p class="advisor">Advisor <span>Tony Garret</span></p>
									<ul class="d-flex justify-content-between">
										<li><span class="flaticon-shower"></span>2300</li>
										<li class="price">$199</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-md-6 d-flex align-items-stretch ftco-animate">
							<div class="project-wrap">
								<a href="#" class="img" style="background-image: url(images/work-2.jpg);">
									<span class="price">Software</span>
								</a>
								<div class="text p-4">
									<h3><a href="#">Design for the web with adobe photoshop</a></h3>
									<p class="advisor">Advisor <span>Tony Garret</span></p>
									<ul class="d-flex justify-content-between">
										<li><span class="flaticon-shower"></span>2300</li>
										<li class="price">$199</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-md-6 d-flex align-items-stretch ftco-animate">
							<div class="project-wrap">
								<a href="#" class="img" style="background-image: url(images/work-3.jpg);">
									<span class="price">Software</span>
								</a>
								<div class="text p-4">
									<h3><a href="#">Design for the web with adobe photoshop</a></h3>
									<p class="advisor">Advisor <span>Tony Garret</span></p>
									<ul class="d-flex justify-content-between">
										<li><span class="flaticon-shower"></span>2300</li>
										<li class="price">$199</li>
									</ul>
								</div>
							</div>
						</div>

						<div class="col-md-6 d-flex align-items-stretch ftco-animate">
							<div class="project-wrap">
								<a href="#" class="img" style="background-image: url(images/work-4.jpg);">
									<span class="price">Software</span>
								</a>
								<div class="text p-4">
									<h3><a href="#">Design for the web with adobe photoshop</a></h3>
									<p class="advisor">Advisor <span>Tony Garret</span></p>
									<ul class="d-flex justify-content-between">
										<li><span class="flaticon-shower"></span>2300</li>
										<li class="price">$199</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-md-6 d-flex align-items-stretch ftco-animate">
							<div class="project-wrap">
								<a href="#" class="img" style="background-image: url(images/work-5.jpg);">
									<span class="price">Software</span>
								</a>
								<div class="text p-4">
									<h3><a href="#">Design for the web with adobe photoshop</a></h3>
									<p class="advisor">Advisor <span>Tony Garret</span></p>
									<ul class="d-flex justify-content-between">
										<li><span class="flaticon-shower"></span>2300</li>
										<li class="price">$199</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-md-6 d-flex align-items-stretch ftco-animate">
							<div class="project-wrap">
								<a href="#" class="img" style="background-image: url(images/work-6.jpg);">
									<span class="price">Software</span>
								</a>
								<div class="text p-4">
									<h3><a href="#">Design for the web with adobe photoshop</a></h3>
									<p class="advisor">Advisor <span>Tony Garret</span></p>
									<ul class="d-flex justify-content-between">
										<li><span class="flaticon-shower"></span>2300</li>
										<li class="price">$199</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="row mt-5">
						<div class="col">
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
		</section><

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