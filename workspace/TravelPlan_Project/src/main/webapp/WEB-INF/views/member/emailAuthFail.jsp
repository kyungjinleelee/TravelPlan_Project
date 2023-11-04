<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여담: 이메일 인증 실패</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

	<!-- <script>
			alert("이메일 인증 후 다시 시도해주세요.");
			location.href="/app/loginForm"
		</script> -->
	<style>
		* { font-family: 'SUIT-Bold'; }
		.alert {
			width:800px;
			height:75px;
			display : flex;
			flex-direction: column;
			align-items:center;
			position : absolute;
			top:50%;
			left:50%;
			transform: translate(-50%, -50%) ;
		}	
	</style>
</head>
<body>
	<div class="text-center alert container alert-danger alert-dismissible fade show align-self-center" role="alert">
	  <strong style="font-size: x-large">이메일 인증 후 다시 시도해주세요.</strong>
	  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" onClick="location.href='/app/loginForm'"></button>
	</div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
