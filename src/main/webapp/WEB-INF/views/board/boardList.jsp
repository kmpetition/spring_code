<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="articleList" value="${articleMap.articleList}" />
<c:set var="totBoard" value="${articleMap.totBoard}" />
<c:set var="section" value="${articleMap.section}" />
<c:set var="id" value="${articleMap.id}" />
<c:set var="pageNum" value="${articleMap.pageNum}" />
<c:set var="startNum" value="${articleMap.startNum}" />
<!DOCTYPE html>
<html>
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


<!-- CSS -->
<link rel="stylesheet"
	href="${contextPath}/resources/css/list_onebyone.css" type="text/css">

</head>
<body>
	<div class="row" style="padding-top: 80px;">

		<div class="col-8" id="cont">
			<div class="g_hader">
				<h1>1:1 문의</h1>

			</div>

			<div class="row ">

				<div class="col alert alert-primary layer_content at_list">

					<div class="row">
						<div class="col-1 num">
							<h4>번호</h4>
						</div>
						<div class="col-5">
							<h4>제목</h4>
						</div>
						<div class="col-3 writer">
							<h4>작성자</h4>
						</div>
						<div class="col-3 write_day">
							<h4>작성일</h4>
						</div>
					</div>
					<c:choose>
						<c:when test="${articleList ==null }">
							<tr height="10">
								<td colspan="4">
									<p align="center">
										<b><span style="font-size: 9pt;">등록된 글이 없습니다.</span></b>
									</p>
								</td>
							</tr>
						</c:when>
						<c:when test="${articleList !=null }">
							<c:forEach var="article" items="${articleList }"
								varStatus="articleNum">
								<%-- <tr align="center">
									<td width="5%">${article.articleNO}</td>
									<td width="40%"><a
										href="${contextPath }/board/boardDetail.do?articleNO=${article.articleNO}">${article.title }</a></td>
									<td width="10%">${article.id}</td>
									<td width="10%">${article.createdate }</td>
								</tr> --%>
								<div class="row">
									<div class="col-1 num">${article.articleNO}</div>
									<div class="col-5 in_list">
										<a
											href="${contextPath }/board/boardDetail.do?articleNO=${article.articleNO}">${article.title }</a>
									</div>
									<div class="col-3 user">${article.id}</div>
									<div class="col-3 date">${article.createdate }</div>
								</div>
							</c:forEach>
						</c:when>
					</c:choose>
				</div>
			</div>

		</div>
	</div>

	<div class="row">

		<div class="container">
			<div class="col-11">
				<ul class="pagination">

					<c:if test="${totBoard != null }">
						<c:choose>
							<c:when test="${totBoard >100 }">
								<!-- 글 개수가 100 초과인경우 -->
								<c:forEach var="page" begin="1"
									end="${totBoard/(section*100) >= 1 ? 10 : totBoard%((section-1)*100)/10+1 }"
									step="1">
									<c:if test="${section >1 && page==1 }">
										<li class="page-item"><a class="page-link"
											href="${contextPath }/board/boardList.do?section=${section-1}&pageNum=1">&nbsp;
												이전</a></li>
									</c:if>
									<li class="page-item"><a class="page-link"
										href="${contextPath }/board/boardList.do?section=${section}&pageNum=${page}">${(section-1)*10 +page }
									</a></li>
									<c:if test="${page ==10 && totBoard > section*100 }">
										<li class="page-item"><a class="page-link"
											href="${contextPath }/board/boardList.do?section=${section+1}&pageNum=1">&nbsp;
												다음</a></li>
									</c:if>
								</c:forEach>
							</c:when>
							<c:when test="${totBoard ==100 }">
								<!--등록된 글 개수가 100개인경우  -->
								<c:forEach var="page" begin="1" end="10" step="1">
									<li class="page-item"><a class="page-link" href="#">${page }
									</a></li>
								</c:forEach>
							</c:when>

							<c:when test="${totBoard< 100 }">
								<!--등록된 글 개수가 100개 미만인 경우  -->
								<c:forEach var="page" begin="1" end="${totBoard/10 +1}" step="1">
									<c:choose>
										<c:when test="${page==pageNum }">
											<li class="page-item"><a class="page-link"
												href="${contextPath }/board/boardList.do?section=${section}&pageNum=${page}">${page }
											</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="${contextPath }/board/boardList.do?section=${section}&pageNum=${page}">${page }
											</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:when>
						</c:choose>
					</c:if>


				</ul>

			</div>
			<div class="col-2 bottom_button">
				<button class="btn btn-primary new_write"
					onclick="location.href = '${contextPath}/board/boardForm.do'">글쓰기</button>
			</div>

		</div>
	</div>


</body>