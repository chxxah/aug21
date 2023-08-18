<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MYINFO</title>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<script src="./js/jquery-3.7.0.min.js"></script>
<style type="text/css">

	table {
	clear: both;
	margin: 0 auto;
	width: 500px;
	height: auto;
	border-top: 2px solid #423F3B;
	border-bottom: 2px solid #423F3B;
	border-collapse: collapse; 
	}
	
	th {
		border-bottom: 1px solid white;
		background-color: #423F3B;
		color: white;
		height: 40px;
		width: 15%;
	}
	
	td {
		border-bottom: 1px solid #BDBDBD;
		text-align: left;
		padding-left: 15px;
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
			<div class="masthead-heading text-uppercase">USER INFO</div>
			<a class="btn btn-primary btn-xl text-uppercase" href="#services">Click Me</a>
		</div>
	</header>

	<!-- Services-->
	<section class="page-section" id="services">
		<div class="container">
			<table class="board_list">
				<tr>
					<th>번호</th>
					<td>${my.m_no }</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>${my.m_id }</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${my.m_name }</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>${my.m_gender }</td>
				</tr>
					<th>주소</th>
					<td>${my.m_addr }</td>
				<tr>
					<th>등급</th>
					<td>${my.m_grade }</td>
				</tr>
				<tr>
					<th>mbti</th>
					<td>${my.m_mbti }</td>
				</tr>
				<tr>
					<th>가입날짜</th>
					<td>${my.m_joindate }</td>
				</tr>
			</table>
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