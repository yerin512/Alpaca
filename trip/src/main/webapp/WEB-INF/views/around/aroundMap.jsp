<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>알파카 - 믿을 수 있는 중고 책 거래사이트</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- 지도 api 적용(네이버/카카오) -->
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=e6h3qbzmz4"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c8f1e98d3b42f208e812d6c641c3952e&libraries=LIBRARY"></script>

	<style>
	    .wrap {position: absolute;left: 0;bottom: 40px;width: 250px;height: 125px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 11px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
	    .wrap * {padding: 0;margin: 0;}
	    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
	    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
	    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
	    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
	    .info .close:hover {cursor: pointer;}
	    .info .body {position: relative;overflow: hidden;}
	    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
	    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
	    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
	    .info .img {position: absolute;top: 6px;left: 5px;width: 60px;height: 70px;border: 1px solid #ddd;color: #888;overflow: hidden;}
	    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
	    .info .link {color: #5085BB;}
	</style>
</head>


<body>
	<!-- 본문 -->
	<div id="map" style="width: 100%; height: 100vh;"></div>
	<script>
    var mapContainer = document.getElementById('map'),  // 지도 생성
    mapOption = { 
        center: new kakao.maps.LatLng(37.497980, 127.027627), 
        level: 4
    };

	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	var mapTypeControl = new kakao.maps.MapTypeControl();  // 지도에 컨트롤 올리기
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	var positions = [{
		content: '<div class="wrap">'
			+ '<div class="info">'
			+ '  <div class="title">트렌드 코리아 2021'
			+ '  <div class="close" onclick="closeOverlay()" title="닫기"></div>'
			+ '</div>'
			+ '<div class="body">'
			+ '  <div class="img">'
			+ '  <img src="${contextPath}/resources/images/around/book1.jpg" width="60" height="70">'
			+ '</div>'
			+ '<div class="desc">'
			+ '  <div class="condition">상태 : 최상</div>'
			+ '  <div class="price">가격 : 8,500원</div>'
			+ '  <div><a href="${contextPath}/board/listArticles.do" class="link">상세보기</a></div>'
			+ '  </div>'
			+ '  </div>' 
			+ '  </div>'
			+ '</div>',
		latlng: new kakao.maps.LatLng(37.497933, 127.026892)	
 	}, {
		content: '<div class="wrap">'
			+ '<div class="info">'
			+ '  <div class="title">기분이 태도가 되지 않게'
			+ '  <div class="close" onclick="closeOverlay()" title="닫기"></div>'
			+ '</div>'
			+ '<div class="body">'
			+ '  <div class="img">'
			+ '  <img src="${contextPath}/resources/images/around/book4.jpg" width="60" height="70">'
			+ '</div>'
			+ '<div class="desc">'
			+ '  <div class="condition">상태 : 중</div>'
			+ '  <div class="price">가격 : 6,000원</div>'
			+ '  <div><a href="${contextPath}/board/listArticles.do" class="link">상세보기</a></div>'
			+ '  </div>'
			+ '  </div>' 
			+ '  </div>'
			+ '</div>',
		latlng: new kakao.maps.LatLng(37.494215, 127.014039)
	}];

	for (var i = 0; i < positions.length; i ++) {
	    var marker = new kakao.maps.Marker({
	        map: map, 
	        position: positions[i].latlng
	    });

 		var overlay = new kakao.maps.CustomOverlay({
 			map: map, 
		    position: positions[i].content
		}); 
	}

 	kakao.maps.event.addListener(marker, 'click', function() {
		overlay.setMap(map);
	});

	function closeOverlay() {
		overlay.setMap(null);
	}
	</script>
</body>
</html>