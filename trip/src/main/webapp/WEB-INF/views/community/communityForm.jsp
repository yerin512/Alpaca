<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<head>
<meta charset="UTF-8">
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
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" ></script>
<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[name='communityForm']");
		$(".write_btn").on("click", function(){
			if(fn_valiChk()){
				return false;
			}
			formObj.attr("action", "${contextPath}/community/addNewCommunity.do");
			formObj.attr("method", "post");
			formObj.submit();
		});
	})
	
	function fn_valiChk(){
			var regForm = $("form[name='communityForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}

   function fn_communityForm(isLogOn,communityForm, index){
        if(isLogOn != '' && isLogOn != 'false'){
          location.href=communityForm;
        }else{
          alert("로그인 후 글쓰기가 가능합니다.")
          location.href=index+'?action=/community/communityForm.do';
        }
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
   
  function backToList(obj){
    obj.action="${contextPath}/community/listCommunity.do";
    obj.submit();
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
						<span class="mr-2"><a href="index.do">Home <i
								class="fa fa-chevron-right"></i></a></span> <span>커뮤니티 <i
							class="fa fa-chevron-right"></i></span>
					</p>
					<h1 class="mb-0 bread">커뮤니티</h1>
				</div>
			</div>
		</div>
	</section>
	<section id="communityFrom">
		<p class="p_title">커뮤니티 글쓰기</p>
		<div class="line_hr"></div>
		<form name="communityForm" method="post"
			action="${contextPath}/community/addNewCommunity.do"
			enctype="multipart/form-data">
			<table border="0" align="center">
				<tr>
					<td colspan=2 align="left"><input type="hidden" size="20"
						maxlength="100" name="id" value="${member.id }" readonly /></td>
				</tr>
				<tr>
					<td colspan="2"><input type="text" class="title_input chk"
						maxlength="500" name="c_title" placeholder="제목을 입력해주세요"
						title="제목을 입력해주세요." /></td>
				</tr>
				<tr>
					<td colspan=2><textarea name="c_content" id="c_content"
							rows="10" cols="100" placeholder="내용을 입력해주세요"
							title="내용을 입력해주세요."></textarea> <script
							src="${contextPath}/resources/ckeditor/ckeditor.js"></script> <script
							type="text/javascript">
								CKEDITOR
										.replace(
												'c_content',
												{
													filebrowserUploadUrl : '${pageContext.request.contextPath }/community/fileupload.do'
												});
								window.parent.CKEDITOR.tools.callFunction(1,
										"${url}", "전송완료");
							</script></td>
				</tr>
				<tr>
					<td class="td_btn"><input type="submit" value="등록"
						class="write_btn btn btn-outline btn-primary" /> <input
						type=button value="목록" onClick="backToList(this.form)"
						class="btn btn-outline btn-primary" /></td>
				</tr>
			</table>
		</form>
	</section>
	<footer class="ftco-footer ftco-no-pt">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
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
