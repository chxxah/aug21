<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WRITE</title>
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>


<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<style type="text/css">

	.write-form {
		width: 70%;
		margin: 0 auto;
	}
	
	#write-title{
		width: 99.3%;
		padding-left: 7px;
		border-radius: 0;
		box-sizing: border-box;
		border: 1px solid silver;
	}
	
	#txtContent {
		width: 99%;
	}
	
	.btn-outline-dark {
		margin-top: 20px;
		text-align: center;
	}
	
</style>
<script type="text/javascript">



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
			<form action="./write" method="post">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
					</div>
					<input placeholder="제목을 입력하세요" type="text" id="write-title" name="title">
				</div>
					<textarea placeholder="내용을 입력하세요" id="txtContent" class="form-control" name="content"></textarea>
			<button type="button" class="btn btn-outline-dark">저장</button>
			</form>
			</div>
		</div>
			
	</section>
	
<script id="smartEditor" type="text/javascript"> 
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "txtContent",  //textarea ID 입력
	    sSkinURI: "/smartEditor/SmartEditor2Skin.html",  //martEditor2Skin.html 경로 입력
	    fCreator: "createSEditor2",
	    htParams : { 
	    	// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
	        bUseToolbar : true, 
		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
		bUseVerticalResizer : false, 
		// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
		bUseModeChanger : false 
	    }
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