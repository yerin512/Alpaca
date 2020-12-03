<%@ page language="java" contentType="text/html; charset=UTF-8"
   isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>알파카 - 믿을 수 있는 중고 책 거래사이트</title>
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
   href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
   rel="stylesheet">
<link rel="shortcut icon"
   href="${contextPath}/resources/images/favicon.ico" />
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

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c8f1e98d3b42f208e812d6c641c3952e"></script>
<style>
#tr_file_upload1 {
   display: none;
}

#tr_file_upload2 {
   display: none;
}

#tr_file_upload3 {
   display: none;
}

#tr_btn_modify {
   display: none;
}
</style>
</head>
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
               <li class="nav-item active"><a
                  href="${contextPath}/board/listArticles.do" class="nav-link">책거래</a></li>
               <li class="nav-item"><a
                  href="${contextPath}/around/aroundMap.do" class="nav-link">주변거래</a></li>
               <li class="nav-item"><a href="${contextPath}/chat/login.do"
                  class="nav-link">채팅하기</a></li>
               <li class="nav-item "><a
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
                  <span class="mr-2"><a href="${contextPath}/index.do">Home
                        <i class="fa fa-chevron-right"></i>
                  </a></span> <span>책거래 <i class="fa fa-chevron-right"></i></span>
               </p>
               <h1 class="mb-0 bread">책 판매 작성</h1>
            </div>
         </div>
      </div>
   </section>
   <section id="articleForm" class="viewArticle">
   <form name="articleForm" method="post"
      action="${contextPath}/board/modArticle.do"
      enctype="multipart/form-data">
         <div class="articleFrom_table">
            <!-- 게시물 작성 폼 -->
            <table border="0" align="center">
            	<tr>
            		<td class="nav_title">책거래 > 판매글</td>
            	</tr>
            	<tr>
                  <td class="va_td va_td_title"><input type="text" size="67" maxlength="500"
                     id="i_title" name="title" value="${article.title}"
                     class="title_input" disabled />
                  </td>
               </tr>
               <tr>
                  <td class="va_td va_td_price"><input type="hidden" size="20" maxlength="100"
                     name="price" id="i_price" value="${article.price}"
                     class="title_input" disabled />
                  </td>
               </tr>
               <tr class="flot_tr">
					<td class="flot_tr_td td_id"> ${member.id} </td>
					<td>&nbsp; &nbsp;</td>
					<td class="flot_tr_td td_date"> ${article.writeDate}</td>
			   </tr>
			   <tr class="line_hr"></tr>
               <tr>
                  <td class="float_tdbox">
                        <div class="img_box">
                                    <div class="img-wrap d-flex align-items-stretch" height="250px" >
                                       <img id="preview1"
                                          src="${contextPath}/board/download.do?articleNO=${article.articleNO}&imageFileName=${article.imageFile1}"
                                          width="100%" />
                                    </div>
                        </div>
                        <div class="text_box">
                        	<p class="box_title"><span>판매&nbsp; </span>${article.title}</p>
                        	<p class="box_price">${article.price} 원</p>
                        	<p class="box_p">거래방법 : ${article.way}</p>
                        	<p class="box_p">물품상태: ${article.condition}</p>
                        	<p class="box_p">거래지역: ${article.location}</p>
                        	 <input type=button value="구매 문의 채팅"
                  onClick="location.href='${contextPath}/chat/login.do'"
                  class="chatbt write_btn btn btn-outline btn-primary" /> 
                        </div>
                   </td>
               </tr>
               
               <tr>
                  <td class="td_title" colspan=2 align="left"><input
                     type="hidden" size="20" maxlength="100" value="${member.name }"
                     readonly /></td>
                  <td><input type="hidden" name="articleNO"
                     value="${article.articleNO}" />
                  <td colspan=6></td>
               </tr>
               <tr class="nbsp"></tr>
               <tr class="tr_cation">
               		<td class="caption">
               			* 거래전 필독 ! 주의 하세요! <br>
               			* 거래 전 연락처를 사이버캅과 더치트로 조회해 주시기 바랍니다. <br>
               			* 알파카는 통신판매중개자로 통신판매자의 당사자가 아닙니다.  <br>
               			* 회원과 구매 회원 간의 상품거래 정보 및 거래에 관여하지 않으며 어떠한 의무와 책임도 부담하지 않습니다. 
               		</td>
               </tr>
               <tr class="nbsp"></tr>
               <!-- 이미지 세개 -->
                <tr>
                  <td>
                        <div class="container" id="content_underbox">
                           <div class="row">
                              <div
                                 class="vaimg ftco-animate d-flex align-items-center align-items-stretch">
                                 <div class="staff-2 w-100">
                                    <input type="hidden" name="originalFile1"
                                       value="${article.imageFile1}" />
                                    <div class="img-wrap d-flex align-items-stretch">
                                       <img id="preview1"
                                          src="${contextPath}/board/download.do?articleNO=${article.articleNO}&imageFileName=${article.imageFile1}"
                                          width="100%" />
                                    </div>

                                 </div>
                              </div>

                              <div
                                 class="vaimg ftco-animate d-flex align-items-center align-items-stretch">
                                 <div class="staff-2 w-100">
                                    <input type="hidden" name="originalFile2"
                                       value="${article.imageFile2}" />
                                    <div class="img-wrap d-flex align-items-stretch">
                                       <img id="preview2"
                                          src="${contextPath}/board/download.do?articleNO=${article.articleNO}&imageFileName=${article.imageFile2}"
                                          width="100%" />
                                    </div>
                                 </div>
                              </div>

                              <div
                                 class="vaimg ftco-animate d-flex align-items-center align-items-stretch">
                                 <div class="staff-2 w-100">
                                    <input type="hidden" name="originalFile3"
                                       value="${article.imageFile3}" />
                                    <div class="img-wrap d-flex align-items-stretch">
                                       <img id="preview3"
                                          src="${contextPath}/board/download.do?articleNO=${article.articleNO}&imageFileName=${article.imageFile3}"
                                          width="100%" />
                                    </div>
                                 </div>
                              </div>

                           </div>
                        </div>
                    </td>
               </tr>
               <tr>
                  <td colspan=2 width="100%"><textarea id="i_content" name="content" rows="10" cols="110" maxlength="4000" disabled>${article.content}</textarea>
                     <script src="${contextPath}/resources/ckeditor/ckeditor.js"></script>
                     <script type="text/javascript">
                           CKEDITOR
                                 .replace(
                                       'i_content',
                                       {
                                          filebrowserUploadUrl : '${pageContext.request.contextPath }/community/fileupload.do'
                                       });
                           window.parent.CKEDITOR.tools.callFunction(
                                 1, "${url}", "전송완료");
                        </script></td>
               </tr>
               <tr>
                  <td><div id="map"></div>
                     <div id="clickLatlng"></div></td>
                  <td><div id="loc_x">
                        <input type="hidden" name="loc_x" value="${article.loc_x}" />
                     </div>
                     <div id="loc_y">
                        <input type="hidden" name="loc_y" value="${article.loc_y}" />
                     </div></td>
               </tr>
            </table>
            <div class="div_input">
                  <input
                  type=button value="목록" onClick="backToList(this.form)"
                  class="write_btn btn btn-outline btn-primary" />
            </div>

            <c:if test="${member.id == article.id}">
               <div class="div_input">
                  <input type=button value="수정"
                     onClick="location.href='${contextPath}/board/modMode.do?articleNO=${article.articleNO}'"
                     class="write_btn btn btn-outline btn-primary" /> 
                     <input
                     type=button value="삭제"
                     onClick="fn_remove_article('${contextPath}/board/removeArticle.do', ${article.articleNO})"
                     class="write_btn btn btn-outline btn-primary">
               </div>
            </c:if>

         </div>
      
   </form>
	</section>
   <script src="${contextPath}/resources/js/jquery.min.js"></script>
   <script src="${contextPath}/resources/js/jquery-migrate-3.0.1.min.js"></script>
   <script src="${contextPath}/resources/js/popper.min.js"></script>
   <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
   <script src="${contextPath}/resources/js/jquery.easing.1.3.js"></script>
   <script src="${contextPath}/resources/js/jquery.waypoints.min.js"></script>
   <script src="${contextPath}/resources/js/jquery.stellar.min.js"></script>
   <script src="${contextPath}/resources/js/owl.carousel.min.js"></script>
   <script src="${contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
   <script src="${contextPath}/resources/js/jquery.animateNumber.min.js"></script>
   <script src="${contextPath}/resources/js/bootstrap-datepicker.js"></script>
   <script src="${contextPath}/resources/js/scrollax.min.js"></script>
   <script src="${contextPath}/resources/js/main.js"></script>

   <script type="text/javascript">
    
    function fn_modify_article(obj){
       obj.action="${contextPath}/board/modArticle.do";
       obj.submit();
    }
    
    function fn_remove_article(url,articleNO){
       var form = document.createElement("form");
       form.setAttribute("method", "post");
       form.setAttribute("action", url);
        var articleNOInput = document.createElement("input");
        articleNOInput.setAttribute("type","hidden");
        articleNOInput.setAttribute("name","articleNO");
        articleNOInput.setAttribute("value", articleNO);
       
        form.appendChild(articleNOInput);
        document.body.appendChild(form);
        form.submit();
    
    }
   
   
   
      function readURL1(input) {
         if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
               $('#preview1').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
         }
      }
      
      function readURL2(input) {
         if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
               $('#preview2').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
         }
      }
      
      function readURL3(input) {
         if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
               $('#preview3').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
         }
      }

      
      function backToList(obj) {
         obj.action = "${contextPath}/board/listArticles.do";
         obj.submit();
      }
      
      function backToForm(obj) {
         obj.action = "${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}";
         obj.submit();
      }
      
      var mapContainer = document.getElementById('map');
       var mapOption = {
           center: new kakao.maps.LatLng('${article.loc_x}', '${article.loc_y}'),
           level: 4
       };
   
       var map = new kakao.maps.Map(mapContainer, mapOption);
       
       var marker = new kakao.maps.Marker({ 
           position: map.getCenter() 
       });
       marker.setMap(map);
    
       
       kakao.maps.event.addListener(map, 'click', function(mouseEvent) {  
           var latlng = mouseEvent.latLng; 
           marker.setPosition(latlng);
           

           var locx ='<input type="hidden" name="loc_x" value="'+latlng.getLat()+'"/>';
           var locy ='<input type="hidden" name="loc_y" value="'+latlng.getLng()+'"/>';
           var resultx = document.getElementById('loc_x');
           resultx.innerHTML = locx;
           var resulty = document.getElementById('loc_y');
           resulty.innerHTML = locy;
       });
   </script>
</body>
</html>