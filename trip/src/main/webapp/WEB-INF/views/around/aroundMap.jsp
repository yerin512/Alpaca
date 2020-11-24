<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>알파카 - 믿을 수 있는 중고 책 거래사이트</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDPkXtedSjcR4hmYgEAvIjgOb_aTuiGKQk&callback=initMap&region=kr"></script>
  <style>
     body {overflow: hidden;}
     div#map {width: 100vw; height: 100vh;}
     div.wrap {width: 200px;}
     div.text-box {text-align: center;}
     h3 {margin: 10px auto 0;}
     div.img-box { max-height: 100px; overflow: hidden;}
     img {width: 150px; margin: -20px auto 0;}
     a {text-decoration: none; color: #000;}   
     .gmnoprint, .gm-control-active.gm-fullscreen-control {display: none;}       
  </style>
</head>

<body>
  <div id="map" style="width:100%; height: 100vh;"></div> 
  <script>
  function initMap() {
      var map = new google.maps.Map(document.getElementById('map'), {  // 지도 생성
          center: {  // 처음 중심 좌표
              lat: 37.56651203645214,
              lng: 126.97785926709967
          },
          zoom: 16
      });

      var locations = [  // 마커 정보
          ['<div class="wrap"><div class="text-box"><h3>트렌드 코리아</h3><div class="img-box"><img src="${contextPath}/resources/images/around/book1.jpg"></div><div class="price">가격 : 8,500원</div><a href="${contextPath}/board/listArticles.do" class="link">상세보기</a></div>',
        	  37.57115541194289, 126.97775376894938],         
          ['<div class="wrap"><div class="text-box"><h3>기분이 태도가 되지 않게</h3><div class="img-box"><img src="${contextPath}/resources/images/around/book4.jpg"></div><div class="price">가격 : 6,000원</div><a href="${contextPath}/board/listArticles.do" class="link">상세보기</a></div>',
        	  37.56649243480132, 126.98401308959981],         
          ['<div class="wrap"><div class="text-box"><h3>돈의 속성</h3><div class="img-box"><img src="${contextPath}/resources/images/around/book2.jpg"></div><div class="price">가격 : 7,300원</div><a href="${contextPath}/board/listArticles.do" class="link">상세보기</a></div>', 
        	  37.566081094077525, 126.96597699812116]          
      ]

      var customicon = 'http://drive.google.com/uc?export=view&id=1tZgPtboj4mwBYT6cZlcY36kYaQDR2bRM';    		  
      var infowindow = new google.maps.InfoWindow(); // 인포윈도우
     
      var marker, i;  //마커 생성
      for (i = 0; i < locations.length; i++) {
          marker = new google.maps.Marker({
              position: new google.maps.LatLng(locations[i][1], locations[i][2]),
              icon: customicon,
              map: map
          });

          google.maps.event.addListener(marker, 'click', (function(marker, i) {
              return function() {
                  infowindow.setContent(locations[i][0]);  // html로 표시될 인포윈도우의 내용
                  infowindow.open(map, marker);  // 인포윈도우가 표시될 위치
              }
          })(marker, i));
          
          if (marker) {
              marker.addListener('click', function() {                 
                  map.setCenter(this.getPosition());  // 중심 위치를 클릭된 마커의 위치로 변경
                  map.setZoom(17);  // 마커 클릭 시 줌 변화
              });
          }
      }
  }
  </script>
</body>
</html>