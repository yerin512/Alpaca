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
 <meta charset="UTF-8">
     <title>KIVIEW &mdash; 글쓰기</title> <!-- css --> 
      <!-- js --> <!-- SmartEditor2 라이브러리 -->
     <script type="text/javascript" src="se2/js/HuskyEZCreator.js" charset="utf-8"></script> 
     <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
      </head>
       <body>
       
       
       <!-- SmartEditor2 --> <div class="jsx-2303464893 editor">
        <div class="fr-box fr-basic fr-top" role="application"> 
        <div class="fr-wrapper show-placeholder" dir="auto" style="overflow: scroll;"> 
        <textarea name="c_content" id="c_content" style="width: 100%; height: 412px;">
        </textarea> </div> </div> </div>
</body> </html> <!-- SmartEditor2 --> 
<script type="text/javascript" src = "resources/js/notice_write.js"></script>

