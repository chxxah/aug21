<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MULTI BOARD</title>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<script src="./js/jquery-3.7.0.min.js"></script>
<style type="text/css">
	.title {
		text-align: left;
	}
	
	.detail-detail {
		width: 100%;
		height: auto;
	}
	
	.detail-name {
		width: 30%;
		height: 20px;
		line-height: 20px;
		float: left;
		padding: 3px;
		border-bottom: 1px solid silver;
	}
	
	.detail-date-read {
		width: 70%;
		height: 20px;
		line-height: 20px;
		float: right;
		border-bottom: 1px solid silver;
	}
	
	.detail-date, .detail-read {
		width: 50%;
	}
	
	.detail-content {
		clear: both;
		width: 100%;
		height: auto;
	}
	
	
	
</style>
<script type="text/javascript">

$(function(){
	
});
</script>
</head>
<body>
	<%@include file="menu.jsp" %>
	<!-- Masthead-->
	<header class="masthead">
		<div class="container">
			<div class="masthead-heading text-uppercase">MULTI BOARD</div>
			<a class="btn btn-primary btn-xl text-uppercase" href="#services">Click Me</a>
		</div>
	</header>
	<!-- Services-->
	<section class="page-section" id="services">
		<div class="container">
		<c:choose>
			<c:when test="${fn:length(list) gt 0 }">
			<table class="table table-hover table-striped">
				<thead>
					<tr class="row">
						<th class="col-1">번호</th>
						<th class="col-5">제목</th>
						<th class="col-2">날짜</th>
						<th class="col-2">작성자</th>
						<th class="col-1">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="row">
						<tr class="row detail" onclick="location.href='./mbdetail?mb_no=${row.mb_no}'">
							<td class="col-1">${row.mb_no }</td>
							<td class="col-5 title">${row.mb_title } <c:if test="${row.commentcount ne 0 }"><span class="badge bg-primary">${row.commentcount }</span></c:if></td>
							<td class="col-2">${row.m_name }</td>
							<td class="col-2">${row.mb_date }</td>
							<td class="col-1">${row.mb_read }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</c:when>
			<c:otherwise>게시물이 없습니다.</c:otherwise>
		</c:choose>
			<br><br>
			<c:if test="${sessionScope.mid ne null }">
			<button type="button" class="btn btn-outline-dark" onclick="location.href='./mbwrite?board=${param.board}'">write</button>
			</c:if>
		</div>
	</section>
	
	
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>