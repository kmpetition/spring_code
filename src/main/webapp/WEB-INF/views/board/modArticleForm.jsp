<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="boardVO" value="${articleMap.boardVO}" />
<c:set var="uploadList" value="${articleMap.uploadList}" />
<c:set var="replyVO" value="${articleMap.replyVO}" />
<c:set var="replyUploadList" value="${articleMap.replyUploadList}" />
<c:set var="isAdmin" value="${loginMap.isAdmin}" />
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.87.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Headers · Bootstrap v5.1</title>

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

<link rel="stylesheet"
	href="${contextPath}/resources/css/list_onebyone_detail _06.css"
	type="text/css">
<!-- noti js-->
<script src="${contextPath}/resources/js/notice.js"></script>
<!-- alert -->
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function backToList(obj) { // [리스트로 돌아가기] 나 [취소] 눌렀을 때 obj <- this.form(폼 객체 전체)
		obj.action = "${contextPath}/board/boardList.do";
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
	/* (본문)삭제하기 버튼 클릭 */
	function fn_delete(obj, articleNO) {
		var action = "${contextPath}/board/removeBoard.do?articleNO="
				+ articleNO;
		location.href = action;
	}
</script>
</head>

<!DOCTYPE html>
<html>

<body>
	<form method="post" action="${contextPath}/board/modArticle.do"
		enctype="multipart/form-data" name="frmNotice">
		<input type="hidden" name="articleNO"
         value="${articleMap.article.articleNO }">
		<table border=0 align="center">

			<div class="row" style="padding-top: 80px;">

				<div class="col-11" id="cont">

					<div class="g_header">

						<h1>1:1 문의 수정</h1>
					</div>

					<div class="row ">

						<div class="col-10 alert alert-primary layer_content at_list">

							<div class="row">
								<div class="col-1 text_filed2">
									<h5>제목</h5>

								</div>
								<div class="col-5 text_filed">
									<input type="text" class="inside_text"
										value="${boardVO.title }" id="title_id" name="title">
								</div>

							</div>
							
							<div class="row">
								<div class="col-12 little_name">
									<h5>글번호 : ${boardVO.articleNO } | 작성자 : ${boardVO.id } |
										작성일자 : ${boardVO.createdate } | ${boardVO.visible}</h5>
									<hr align="left"
										style="border: solid 1px #0670D9; width: 100%;">
								</div>
							</div>
							<div class="row">
								<div class="col-1 text_filed2">
									<h5>내용</h5>

								</div>
								<div class="col text_filed2">
									<textarea class="inside_text1" id="story" name="story"
										style="resize: none;">${boardVO.content }</textarea>
								</div>
							</div>
							<div class="text">
								<c:if test="${not empty uploadList}">
									<c:forEach var="file" items="${uploadList }">
                         ${file.uploadfile }   
                        </c:forEach>
								</c:if>
							</div>


							<div class="row bottom_download">
								<div class="col-12 a3-1">
									<button type="button" class=" btn btn-primary a3"
										onClick="fileDownload('${contextPath }/downloadFile.do','${file.uploadfile }')">첨부파일
										다운</button>
								</div>
							</div>

							<div class="row bottom_button">
								<div class="col-2">
									<button type="button" class=" btn btn-primary a1"
										onClick="backToList(this.form)">목록</button>
								</div>
								<div class="col-2">
									<button type="button" class=" btn btn-secondary a2"
										onClick="noticeChk(this.form)">확인</button>
								</div>
								<div class="col-2">
									<button type="button" class=" btn btn-danger a3"
										onClick="fn_delete(this.form, '${boardVO.articleNO}')">삭제</button>
								</div>
		</table>
	</form>
</body>