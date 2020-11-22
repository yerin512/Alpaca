<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html>
<head>
 <style>
   .cls1 {text-decoration:none;}
   .cls2{text-align:center; font-size:30px;}
  </style>
  <meta charset="UTF-8">
  <title>글목록창</title>
</head>
<script>
	function fn_communityForm(isLogOn,communityForm, index){
	  if(isLogOn != '' && isLogOn != 'false'){
	    location.href=communityForm;
	  }else{
	    alert("로그인 후 글쓰기가 가능합니다.")
	    location.href=index+'?action=/community/communityForm.do';
	  }
	}
</script>
<body>
<table align="center" border="1"  width="80%"  >
  <tr height="10" align="center"  bgcolor="lightgreen">
     <td >글번호</td>
     <td >작성자</td>              
     <td >제목</td>
     <td >작성일</td>
  </tr>
<c:choose>
  <c:when test="${communityList ==null }" >
    <tr  height="10">
      <td colspan="4">
         <p align="center">
            <b><span style="font-size:9pt;">등록된 글이 없습니다.</span></b>
        </p>
      </td>  
    </tr>
  </c:when>
  <c:when test="${communityList !=null }" >
    <c:forEach  var="community" items="${communityList }" varStatus="communityNum" >
     <tr align="center">
	<!--  <td width="5%">${communityNum.count}</td>-->
	<td>${community.c_no }</td>
	<td>${community.c_title }</td>
	<td>${community.c_content }</td>
	<td>${community.c_date }</td>
	<td>${community.id }</td>
	<!--  <td width="10%">${community.id }</td>-->
	<!-- <td align='left'  width="35%">
	  <span style="padding-right:30px"></span>
	            <a class='cls1' href="${contextPath}/community/viewCommunity.do?communityNO=${community.c_no}">${community.c_title }</a>
	  </td>
	   <td  width="10%">${community.c_date}</td> -->
	</tr>
    </c:forEach>
     </c:when>
    </c:choose>
</table>
<!-- <a  class="cls1"  href="#"><p class="cls2">글쓰기</p></a> -->
<a  class="cls1"  href="javascript:fn_communityForm('${isLogOn}','${contextPath}/community/communityForm.do', 
                                                    '${contextPath}/index.do')"><p class="cls2">글쓰기</p></a>
</body>
</html>