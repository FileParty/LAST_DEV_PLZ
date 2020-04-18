<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팝업창</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
	body{
		display:flex;
		flex-direction:column;
		justify-content:center;
		align-items:center;
	}
	table{
		text-align:center;
	}
	</style>
</head>
<body align="center">

	<form action="<%=request.getContextPath() %>/sitter/AddCertificateEnd" method="post" enctype="multipart/form-data">
	<table  class="table table-hover">
	<tr><td><p>자격증 명</p></td></tr>
	<tr><td><input type="text" name="certificateName"></td></tr>
	<tr><td><p>인증 기관</p></td></tr>
	<tr><td><input type="text" name="certificationName"></td></tr>
	<tr><td><p>취득 일시</p></td></tr>
	<tr><td><input type="date" name="date"></td></tr>
	<tr><td><p>만료 일시</p></td></tr>
	<tr><td><input type="radio" name="radio"  id="radio" onclick="onOff();">있음
	<input type="radio" name="radio"  id="radio1"  onclick="onOff();">없음</td></tr>
	
	<tr><td><input type="date" name="date1" id="date1"></td></tr>
	<tr><td><p>이미지 첨부</p></td></tr>
	<tr><td><input type="file" name="file"></td></tr>
	
	<tr><td><button  type="submit">추가 요청</button></td></tr>
	</table>

		
	</form>
	
	<script>
		
		$("#date1").hide();
		function onOff() {
		if(document.getElementById("radio").checked==true) {
			$("#date1").show();
			
		}else if(document.getElementById("radio1").checked==true){
			$("#date1").hide();
			
		}
		}
		
		
	</script>
</body>
</html>