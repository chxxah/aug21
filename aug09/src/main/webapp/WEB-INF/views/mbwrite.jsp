<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MULTI BOARD WRITE</title>
<script src="./js/jquery-3.7.0.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>


<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<style type="text/css">

	.input-group {
		width: 80%;
		margin: 0 auto;
		text-align: left;
	}
	
	.input-group-prepend {
		width:  100%;
		margin-bottom: 10px;
	}
	
	.write-title {
		width: 100%;
		padding-left: 7px;
		border-radius: 0;
		box-sizing: border-box;
		border: 1px solid silver;
		height: 40px;
	}
	
	.note-editor {
		width: 100%;
		height: auto;
	}
	
	.btn-outline-dark {
		margin-top: 20px;
		text-align: center;
	}
	
</style>
<script type="text/javascript">
	
	$(function(){
		$(".write-btn").click(function(){
			let id = $('.write-title').val();
			if(id == null || id == ""){
				alert("제목을 입력하세요.");
				$(".write-title").focus();
				return false;
			}
			
			let summernote = $('.write-content').val();
			if(summernote == null || summernote == ""){
				alert("내용을 입력하세요.");
				return false;
			}
			
			//위 두 검사가 성공한다면 form 전송하기
			$("form").submit();
		});
	});

</script>
</head>
<body>
	<%@include file="menu.jsp" %>
	<!-- Masthead-->
	<header class="masthead">
		<div class="container">
			<div class="masthead-heading text-uppercase">WRITE</div>
			<a class="btn btn-primary btn-xl text-uppercase" href="#services">Click Me</a>
		</div>
	</header>

	<!-- Services-->
	<section class="page-section" id="services">
		<div class="container">
			<div class="rounded-3 write-form">
				<form action="./mbwrite" method="post" id="form">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<input placeholder="제목을 입력하세요" type="text" class="write-title" name="title">
						</div>
					<textarea placeholder="내용을 입력하세요" id="summernote" class="write-content" name="content"></textarea>
					</div>
					<input type="hidden" name="board" value=${board }>
					<button type="submit" class="btn btn-outline-dark write-btn">저장</button>
				</form>
			</div>
		</div>
	</section>
	
	<script>
	$(document).ready(function() {
	  $('#summernote').summernote({
	  placeholder: '내용을 입력하세요.',
	  tabsize: 1,
	  height: 500,
      toolbar: [
        ['style', ['style']],
        ['font', ['bold', 'underline', 'clear']],
        ['color', ['color']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['table', ['table']],
        ['insert', ['link', 'picture', 'video']],
        ['view', ['fullscreen', 'codeview', 'help']]
     	]
	  });
	});
    </script>
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