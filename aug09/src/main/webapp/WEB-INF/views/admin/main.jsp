<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="../css/admin.css">
<title>ADMIN MAIN</title>
</head>
<body>
	<div class="container">
		<%@ include file="menu.jsp"%>
		<div class="main">
			<div class="article">
				<h1 >MAIN</h1>
				<div>
					<div class="box" style="background-color: green;" onclick="url('multiBoard')">
						BOARD
						<div id="comment">보드 관리</div>
					</div>
					<div class="box" style="background-color: green;" onclick="url('post')">
						POST
						<div id="comment">게시글 관리</div>
					</div>
					<div class="box" style="background-color: green;" onclick="url('member')">
						MEMBER
						<div id="comment">회원 관리</div>
					</div>
					<div class="box" style="background-color: green;" onclick="url('comment')">
						COMMENT
						<div id="comment">댓글 관리</div>
					</div>
				</div>
				<div>
				<div class="box" style="background-color: green;" onclick="url('message')">
					MESSAGE
					<div id="comment">메시지 관리</div>
				</div>
				<div class="box" style="background-color: green;" onclick="url('mail')">
					MAIL
					<div id="comment">메일 관리</div>
				</div>
				<div class="box" style="background-color: green;" onclick="url('notice')">
					NOTICE
					<div id="comment">공지 관리</div>
				</div>
				<div class="box" style="background-color: green;" onclick="url('logout')">
					LOGOUT
					<div id="comment">로그아웃</div>
				</div>
				</div>
			
			</div>
		</div>
	</div>

</body>
</html>