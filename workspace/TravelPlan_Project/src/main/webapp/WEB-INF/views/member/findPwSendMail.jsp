<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jquery CDN -->   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여담: 비밀번호 재설정</title>
	<!-- <script>
			alert("메일을 통해 비밀번호를 재설정해 주세요.");
			location.href="/app/main"
		</script> -->
	<!-- alert 커스텀 -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.9.0/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.9.0/dist/sweetalert2.all.min.js"></script>

	<script>
		$(document).ready(function(){
			Swal.fire({	
				icon: 'warning',
				text: '메일을 통해 비밀번호를 재설정해 주세요.' }).then(function(){
				location.href='/app/main';
			});
		});
	</script> 
</head>
<body>
</body>
</html>
