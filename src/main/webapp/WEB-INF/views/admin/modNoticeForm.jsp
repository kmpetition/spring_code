<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8" isELIgnored="false" import="java.util.Date"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="now" value="<%=new Date()%>" />
<c:set var="noticeVO" value="${articleMap.noticeVO}" />
<c:set var="uploadList" value="${articleMap.uploadList}" />
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
   content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.87.0">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>adndin_notice</title>

<link rel="canonical"
   href="https://getbootstrap.com/docs/5.1/examples/headers/">

<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
   rel="stylesheet">

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
   integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
   crossorigin="anonymous">
<!-- CSS -->
<link rel="stylesheet"
   href="${contextPath}/resources/css/AD_Notice_4.css" type="text/css">
<title>Insert title here</title>

<!-- noti js-->
<script src="${contextPath}/resources/js/notice.js"></script>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
   function backToList(obj) { // [리스트로 돌아가기] 나 [취소] 눌렀을 때 obj <- this.form(폼 객체 전체)
      obj.action = "${contextPath}/board/noticeList.do";
      obj.setAttribute("method", "get");
      obj.submit();
   }

   var cnt = 1;
      function fn_addFile() {
            if (cnt <= 3) {
               $("#d_file").append(
                     "<br>" + "<input type='file' name='file"+cnt+"' />");
               cnt++;
            } else {
               return;
            }
         }
   function fileDelete(id, fileName, fileId) {
      var file = document.getElementById(fileId);
      file.setAttribute("name", "removeList");
      /* 
      $("#d_file")
      .append("<input type='hidden' name='removeList' value='"+fileName+"'/>");
       */
      $("#" + id).hide();

   }
</script>
</head>
<body>
   <form method="post" action="${contextPath}/admin/modNotice.do"
      enctype="multipart/form-data" name="frmNotice">
      <input type="hidden" name="articleNO"
         value="${articleMap.article.articleNO }">
      <table border=0 align="center">
         <div class="row" style="padding-top:80px;">

            <div class="col-10" id="cont">
               <div class="row">
                  <div class="col-12">

                     <h1>공지사항 수정</h1>
                  </div>
               </div>


               <div class="row ">

                  <div class="col-10 alert alert-primary layer_content at_list">

                     <div class="row">
                        <div class="col-12 little_header">
                           <div class="row">
                              <div class="col-1 text_filed2">
                                 <h5>제목</h5>

                              </div>
                              <div class="col-5 text_filed">
                                 <input type="text" class="inside_text"
                                    value="${noticeVO.title }" id="title_id" name="title">
                              </div>

                           </div>
                           <div class="row">
                              <div class="col-12 little_name">
                                 <h5>글번호 : ${noticeVO.articleNO } | 작성일자 :
                                    ${noticeVO.createdate }</h5>
                                 <hr align="left"
                                    style="border: solid 1px #0670D9; width: 100%;">
                              </div>

                           </div>

                        </div>



                     </div>

                     <div class="row">
                        <div class="col-5 re_writer">
                           <span></span>
                        </div>

                     </div>


                     <div class="row">
                        <div class="col-1 text_filed2">
                           <h5>내용</h5>

                        </div>
                        <div class="col text_filed2">
                           <textarea class="inside_text1" id="story" name="content"
                              style="resize: none;">${noticeVO.content }</textarea>
                        </div>
                     </div>
                                          <c:if test="${not empty uploadList}">
                        <c:forEach var="file" items="${uploadList }">
                                 ${file.uploadfile }
                          <div class="row bottom_insert">
                        </c:forEach>
                     </c:if>
                     
                     <div class="col-2 insert">
                              <button type="button" class=" btn btn-primary a4" onClick="fn_addFile()">파일
                                    첨부</button>
                              </div>
                 <div id="d_file"></div>
                     <div class="col">
                        <button type="button" class=" btn btn-primary a5">삭제</button>
                     </div>
                  </div>



                  <div class="row bottom_button">

                     <div class="col">
                        <button type="button" class=" btn btn-primary a3"
                           onClick="backToList(this.form)">목록</button>
                     </div>
                     <div class="col">
                        <button type="button" class=" btn btn-primary a3"
                           onClick="noticeChk(this.form)">확인</button>
                     </div>
                  </div>


               </div>
            </div>
         </div>
         </div>
      </table>
   </form>
</body>