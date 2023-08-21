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
<title>ADMIN NOTICE</title>
<style type="text/css">
	
	table {
		width: 80%;
		margin: 0 auto;
		margin-top: 10px;
	}

	.notice-write-form {
		width: 90%;
		height: auto;
		margin: 10px;
		padding: 20px;
		box-sizing: border-box;
	}
	
	.notie-write-form input{
		height: 30px;
		width: 100%;
	}
	
	.notice-write-form textarea {
		width: 100%;
		height: 300px;
		margin: 5px 0px;
	}
	
	.notice-write-form button {
		width: 100px;
		height: 50px;
	}


</style>
</head>
<body>
	<div class="container">
		<%@ include file="menu.jsp"%>
		<div class="main">
			<div class="article">
				<h1>NOTICE</h1>
				<hr>
				<table>
					<tr>
	                    <th>번호</th>
                        <th>제목</th>
                        <th>게시일</th>
                        <th>작성자</th>
                        <th>삭제여부</th>
                        <th>파일유무</th>
					</tr>
					<c:forEach items="${notice}" var="row">
					<tr class="row detail">
						<td>${row.nno}</td>
						<td>${row.ntitle}</td>
						<td>${row.ndate}</td>
						<td>${row.m_no}</td>
						<td>
							<c:choose>
								<c:when test="${row.ndel eq 1}"><i class="xi-eye"></i></c:when>
								<c:otherwise><i class="xi-eye-off"></i></c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${row.norifile ne null}"><i class="xi-file-check"></i></c:when>
								<c:otherwise><i class="xi-file-remove"></i></c:otherwise>
							</c:choose>
						</td>
					</tr>
					</c:forEach>
				</table>
				
				<div class="notice-write-form">
				<!-- enctype 인코딩 타입 설정-->
					<form action="./noticeWrite" method="post" enctype="multipart/form-data">
						<input type="text" name="title">
						<textarea name="content"></textarea>
						<input type="file" name="upFile">
						<button type="submit">글쓰기</button>
					</form>
				</div>
			
			</div>
		</div>
	</div>

</body>
</html>