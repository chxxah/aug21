<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOARD</title>
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
	
	$(document).on("click", ".del", function(){
		let bno = $(".bno").val();
		let uuid = $(".uuid").val();
		
		// 가상 form 만들어서 body에 넣고 전송하기
		let form = $('<form></form>');
		
		// form의 속성을 붙여줌
		form.attr("action","./delete");
		form.attr("method", "post");
		
		//json 객체를 쓸거
		form.append($("<input>", {type:"hidden", name:"bno", value:bno}));//value에 변수 안 만들고 바로 넣어도 됨
		form.append($("<input>", {type:"hidden", name:"uuid", value:uuid}));
		
		form.appendTo("body");
		
		form.submit();
	});
	
	$(document).on("click", ".edit", function(){
		let bno = $(".bno").val();
		let uuid = $(".uuid").val();
		alert(bno + " | " + uuid);
	});
	
	
	
	$(".detail").click(function(){
		let bno = $(this).children("td").eq(0).html();
		let comment = $(this).children("td").eq(1).children(".bg-primary").text().length;
		let title = $(this).children("td").eq(1).text();
		let date = $(this).children("td").eq(2).html();
		let name = $(this).children("td").eq(3).html();
		let read = Number($(this).children("td").eq(4).html())+1;
		
		if(comment > 0) {
			title = title.slice(0, -comment);
		}
		
		$.ajax({
			url:"./detail",
			type: "post",
			data:{ bno : bno },
			dataType: "json",
			success: function(data){
				$(".modal-title").text(title);
				name = name + '<img class="edit" src="./img/edit.png"> <img class="del" src="./img/delete.png">';
				name += '<input type="hidden" class="bno" value="'+ bno +'">';
				name += '<input type="hidden" class="uuid" value="'+ data.uuid +'">';
				
				$(".detail-name").html(name);
				$(".detail-date").text(date);
				$(".detail-read").text(data.ip+" | "+read);
				$(".detail-content").html(data.content);
				$("#exampleModal").modal("show");
			},
			error: function(error){
				alert("에러가 발생했습니다.");
			},
			
			
			
		});
		
	});
	

	
});
</script>
</head>
<body>
	<%@include file="menu.jsp" %>
	<!-- Masthead-->
	<header class="masthead">
		<div class="container">
			<div class="masthead-heading text-uppercase">BOARD</div>
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
						<tr class="row detail">
							<td class="col-1">${row.bno }</td>
							<td class="col-5 title">${row.btitle } <c:if test="${row.commentcount ne 0 }"><span class="badge bg-primary">${row.commentcount }</span></c:if></td>
							<td class="col-2">${row.bdate }</td>
							<td class="col-2">${row.m_name }</td>
							<td class="col-1">${row.blike }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
					</c:when>
				<c:otherwise>게시물이 없습니다.</c:otherwise>
			</c:choose>
			<button type="button" class="btn btn-outline-dark" onclick="location.href='./write'">write</button>
			<button type="button" id="modal1" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">modal</button>
			
			<!-- 모달 여는 스크립트 만들기 -->
			<button type="button" class="modalOpen btn btn-outline-secondary">modal open</button>
		</div>
	</section>
	
	<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
      	<!-- 제목 적기 -->
        <h5 class="modal-title" id="exampleModalLabel"></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        	<div class=	"detail-detail">
        		<div class="detail-name">이름</div>
        		<div class="detail-date-read">
        			<div class="detail-date">작성일</div>
        			<div class="detail-read">조회</div>
        		</div>
        		<div class="detail-content">본문내용</div>
        	</div>
        	<br>
      </div>
    </div>
  </div>
</div>




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