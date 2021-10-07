<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
%>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title><tiles:insertAttribute name="title" /></title>

<!-- CSS -->
<link rel="stylesheet" href="${contextPath}/resources/css/main.css"
	type="text/css">
<!-- 	<script>
	
	window.onload = function(){
		
		resize();
	}
	
	function resize(){
		
		var aside = document.getElementById("aside");
		var wid = aside.offsetWidth;
		console.log(wid);
		var article = document.getElementById("article");
		article.setAttribute('style', 'width:calc(100% - wid)');
	}
	</script> -->


</head>
<body>
	<div id="outer_wrap">
		<div id="wrap">
			<header>
				<tiles:insertAttribute name="header" />
			</header>
			<div class="clear" id="aside">
			<aside>
				<tiles:insertAttribute name="side" />
			</aside>
			</div>
			<div class="clear" id="article">
			<article>
				<tiles:insertAttribute name="body" />
			</article>
			</div>
		</div>
	</div>
</body>

