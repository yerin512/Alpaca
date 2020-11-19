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
   <title>글보기</title>
   <style>
     #tr_btn_modify{
       display:none;
     }
   
   </style>
   <script  src="http://code.jquery.com/jquery-latest.min.js"></script> 
   <script type="text/javascript" >
     function backToList(obj){
	    obj.action="${contextPath}/community/listCommunity.do";
	    obj.submit();
     }
 
	 function fn_enable(obj){
		 document.getElementById("c_title").disabled=false;
		 document.getElementById("c_content").disabled=false;
		 document.getElementById("c_imageFileName").disabled=false;
		 document.getElementById("tr_btn_modify").style.display="block";
		 document.getElementById("tr_btn").style.display="none";
	 }
	 
	 function fn_modify_community(obj){
		 obj.action="${contextPath}/community/modCommunity.do";
		 obj.submit();
	 }
	 
	 function fn_remove_community(url,c_no){
		 var form = document.createElement("form");
		 form.setAttribute("method", "post");
		 form.setAttribute("action", url);
	     var c_noInput = document.createElement("input");
	     c_noInput.setAttribute("type","hidden");
	     c_noInput.setAttribute("name","c_no");
	     c_noInput.setAttribute("value", c_no);
		 
	     form.appendChild(c_noInput);
	     document.body.appendChild(form);
	     form.submit();
	 
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
 </script>
</head>
<body>
  <form name="frmCommunity" method="post"  action="${contextPath}"  enctype="multipart/form-data">
  <table  border=0  align="center">
  <tr>
   <td width=150 align="center" bgcolor=#FF9933>
      글번호
   </td>
   <td >
    <input type="text"  value="${community.c_no }"  disabled />
    <input type="hidden" name="c_no" value="${community.c_no}"  />
   </td>
  </tr>
  <tr>
    <td width="150" align="center" bgcolor="#FF9933">
      작성자 아이디
   </td>
   <td >
    <input type=text value="${community.id }" name="id"  disabled />
   </td>
  </tr>
  <tr>
    <td width="150" align="center" bgcolor="#FF9933">
      제목 
   </td>
   <td>
    <input type=text value="${community.title }"  name="c_title"  id="c_title" disabled />
   </td>   
  </tr>
  <tr>
    <td width="150" align="center" bgcolor="#FF9933">
      내용
   </td>
   <td>
    <textarea rows="20" cols="60"  name="content"  id="c_content"  disabled />${community.content }</textarea>
   </td>  
  </tr>
 
<c:if test="${not empty community.imageFileName && community.imageFileName!='null' }">  
<tr>
    <td width="150" align="center" bgcolor="#FF9933"  rowspan="2">
      이미지
   </td>
   <td>
     <input  type= "hidden"   name="originalFileName" value="${community.imageFileName }" />
    <img src="${contextPath}/download.do?c_no=${community.c_no}&imageFileName=${community.imageFileName}" id="preview"  /><br>
       
   </td>   
  </tr>  
  <tr>
    <td>
       <input  type="file"  name="c_imageFileName " id="c_imageFileName"   disabled   onchange="readURL(this);"   />
    </td>
  </tr>
 </c:if>
  <tr>
	   <td width="150" align="center" bgcolor="#FF9933">
	      등록일자
	   </td>
	   <td>
	    <input type=text value="<fmt:formatDate value="${community.c_date}" />" disabled />
	   </td>   
  </tr>
  <tr   id="tr_btn_modify"  >
	   <td colspan="2"   align="center" >
	       <input type=button value="수정반영하기"   onClick="fn_modify_community(frmCommunity)"  >
           <input type=button value="취소"  onClick="backToList(frmCommunity)">
	   </td>   
  </tr>
    
  <tr  id="tr_btn"    >
   <td colspan="2" align="center">
	    <input type=button value="수정하기" onClick="fn_enable(this.form)">
	    <input type=button value="삭제하기" onClick="fn_remove_community('${contextPath}/community/removeCommunity.do', ${community.c_no})">
	    <input type=button value="리스트로 돌아가기"  onClick="backToList(this.form)">
   </td>
  </tr>
 </table>
 </form>
</body>
</html>