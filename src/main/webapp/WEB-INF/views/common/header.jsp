<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.87.0">
<title>Skydash Admin</title>
<!-- plugins:css -->
<link rel="stylesheet"
	href="${contextPath}/resources/vendors/feather/feather.css">
<link rel="stylesheet"
	href="${contextPath}/resources/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet"
	href="${contextPath}/resources/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet"
	href="${contextPath}/resources/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
<link rel="stylesheet"
	href="${contextPath}/resources/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/js/select.dataTables.min.css">
<link rel="stylesheet"
	href="${contextPath}/resources/vendors/mdi/css/materialdesignicons.min.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet"
	href="${contextPath}/resources/css/vertical-layout-light/style.css">
<!-- endinject -->
<link rel="shortcut icon"
	href="${contextPath}/resources/images/favicon.png" />



<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Headers · Bootstrap v5.1</title>

<link rel="stylesheet" href="${contextPath}/resources/css/header.css"
	type="text/css">
<!--폰트-->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">

<!--bootstrap-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">


<!-- Swal js-->
<script src="${contextPath}/resources/js/header.js">
	var cntSearch = 1;
	function fn_addSearchWord() {
		if (cntSearch <= 3) {
			$("#d_search").append(
					"<br>" + "<input type='text' name='searchWord"+cntSearch+"' />");
			cntSearch++;
			console.log(cntSearch)
		} else {
			return;
		}
	}
	var cntExcept = 1;
	function fn_addExceptWord() {
		if (cntExcept <= 3) {
			$("#d_except").append(
					"<br>" + "<input type='text' name='exceptWord"+cntExcept+"' />");
			cntExcept++;
			console.log(cntExcept)
		} else {
			return;
		}
	}
</script>

</head>


<body>
	<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
		<div
			class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
			<a class="navbar-brand brand-logo mr-5"
				href="${contextPath }/main/main.do"><img
				src="${contextPath}/resources/images/logo.svg" class="mr-2"
				alt="logo" /></a> <a class="navbar-brand brand-logo-mini"
				href="${contextPath }/main/main.do"><img
				src="${contextPath}/resources/images/logo-mini.svg" alt="logo" /></a>
		</div>
		<div
			class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
			<button class="navbar-toggler navbar-toggler align-self-center"
				type="button" data-toggle="minimize">
				<span class="icon-menu"></span>
			</button>
			<ul class="navbar-nav mr-lg-2">
				<li class="nav-item nav-search d-none d-lg-block dropdown">
					<div class="input-group">
						<div class="input-group-prepend hover-cursor"
							id="navbar-search-icon">
							<span class="input-group-text" id="search"> <i
								class="icon-search"></i>
							</span>
						</div>
						<div class="col-5 cont-3">
							<div class="search_text1">
								<input type="search" class="form-control search_text"
									id="form_text" placeholder="Search...">
							</div>
						</div>
					</div>
			</ul>



			<ul class="navbar-nav navbar-nav-right">
				<li class="nav-item dropdown"><a
					class="nav-link count-indicator dropdown-toggle"
					id="notificationDropdown" href="#" data-toggle="dropdown"> <i
						class="icon-bell mx-0"></i> <span class="count"></span>
				</a>
					<div
						class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list"
						aria-labelledby="notificationDropdown">
						<p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
						<a class="dropdown-item preview-item">
							<div class="preview-thumbnail">
								<div class="preview-icon bg-success">
									<i class="ti-info-alt mx-0"></i>
								</div>
							</div>
							<div class="preview-item-content">
								<h6 class="preview-subject font-weight-normal">Application
									Error</h6>
								<p class="font-weight-light small-text mb-0 text-muted">
									Just now</p>
							</div>
						</a> <a class="dropdown-item preview-item">
							<div class="preview-thumbnail">
								<div class="preview-icon bg-warning">
									<i class="ti-settings mx-0"></i>
								</div>
							</div>
							<div class="preview-item-content">
								<h6 class="preview-subject font-weight-normal">Settings</h6>
								<p class="font-weight-light small-text mb-0 text-muted">
									Private message</p>
							</div>
						</a> <a class="dropdown-item preview-item">
							<div class="preview-thumbnail">
								<div class="preview-icon bg-info">
									<i class="ti-user mx-0"></i>
								</div>
							</div>
							<div class="preview-item-content">
								<h6 class="preview-subject font-weight-normal">New user
									registration</h6>
								<p class="font-weight-light small-text mb-0 text-muted">2
									days ago</p>
							</div>
						</a>
					</div></li>
				<li class="nav-item nav-profile dropdown"><c:choose>
						<c:when test="${isLogOn==true and not empty memberInfo }">
							<a class="nav-link dropdown-toggle" href="#"
								data-toggle="dropdown" id="profileDropdown"> <i
								class="mdi mdi-account-circle"></i>
							</a>
							<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
								aria-labelledby="profileDropdown">
								<a class="dropdown-item"
									href="${contextPath}/mypage/modMemberForm.do "> <i
									class="mdi mdi-account-settings"></i> My Page
								</a> <a class="dropdown-item"
									href="${contextPath }/member/logout.do"> <i
									class="mdi mdi-logout"></i> Logout
								</a>
							</div>
						</c:when>
						<c:when test="${isLogOn==true and isAdmin==true }">
							<a class="nav-link dropdown-toggle" href="#"
								data-toggle="dropdown" id="profileDropdown"> <img
								src="${contextPath}/resources/images/faces/face28.jpg"
								alt="profile" />
							</a>
							<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
								aria-labelledby="profileDropdown">
								<a class="dropdown-item"
									href="${contextPath}/admin/memberList.do "> <i
									class="mdi mdi-wrench"></i> Admin Page
								</a> <a class="dropdown-item"
									href="${contextPath }/member/logout.do"> <i
									class="mdi mdi-logout"></i> Logout
								</a>
							</div>
						</c:when>
						<c:otherwise>
							<a class="nav-link dropdown-toggle" href="#"
								data-toggle="dropdown" id="profileDropdown"> <%-- <img src="${contextPath}/resources/images/faces/face28.jpg" alt="profile"/> --%>
								<i class="mdi mdi-chevron-down"></i>
							</a>
							<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
								aria-labelledby="profileDropdown">
								<a class="dropdown-item"
									href="${contextPath}/member/memberForm.do"> <i
									class="mdi mdi-account-plus"></i> Join Member
								</a> <a class="dropdown-item"
									href="${contextPath}/member/loginForm.do"> <i
									class="mdi mdi-login"></i> Login
								</a>
							</div>
						</c:otherwise>
					</c:choose></li>
				<c:if test="${isLogOn == true}">
					<li class="nav-item nav-settings d-none d-lg-flex"><a
						class="nav-link" href="#"> <i class="icon-ellipsis"></i>
					</a></li>
				</c:if>
			</ul>
			<button
				class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
				type="button" data-toggle="offcanvas">
				<span class="icon-menu"></span>
			</button>
		</div>
	</nav>
	<div class="row"
		style="position: absolute; top: 60px; left: 235px; z-index: 999;">

		<form class="col-12 col-lg-auto mb-2 mb-lg-0 me-lg-auto" method="post"
			action="${contextPath }/board/search.do">

			<div class="layer" id="layer" style="display:none;">

				<div class="alert alert-primary layer_content">
					<div class="month_button">
						<div class="layer_content">
							<div class="month_button">
								<a><input type="date" class="month" id="today1"></a> <a><input
									type="date" class="month" id="today"></a>
								<li type="button" class="btn btn-secondary month" id="month1" style="height:25px; line-height:0; width:90px;">1개월</li>
								<li type="button" class="btn btn-secondary month" id="month2" style="height:25px; line-height:0; width:90px;">2개월</li>
								<li type="button" class="btn btn-secondary month" id="month3" style="height:25px; line-height:0; width:90px;">3개월</li>
							</div>
						</div>

						<div class="checkbox_lang">
							<a><input type="checkbox" class="language">제외할 단어</a>
						</div>

						<div class="checkbox2_lang">
							<ul>
								<div id="boxWrap">

									<input type="text" class="original">
									<button type="button" class="btn btn-outline-primary button" style="height:25px; line-height:0; width:90px;">추가</button>


								</div>
							</ul>
						</div>

						<div class="checkbox3_lang">
							<a><input type="checkbox" class="language">포함할 단어</a>
						</div>

						<div class="checkbox4_lang">
							<ul>
								<div id="boxWrap2">
									<input type="text" class="original">
									<button type="button" class="btn btn-outline-primary button2" style="height:25px; line-height:0; width:90px;">추가</button>
								</div>
							</ul>
						</div>

						<div class="serch">
							<button class="btn btn btn-primary" type="button"
								id="serch_serch">검색</button>
							<input class="btn btn-secondary" type="button" id="layer_close"
								value="닫기" readonly="readonly">
							<!-- <button class="btn btn-secondary" type=" button"
                                       id="layer_close">닫기</button> -->
						</div>
					</div>
				</div>

			</div>
		</form>

	</div>
</body>
</html>