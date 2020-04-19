<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.petmily.admin.model.vo.ApplyUserData, 
 com.petmily.admin.model.vo.User,com.petmily.admin.model.vo.AdminPetsitter" %>
<% 
	String filaeName = request.getParameter("file");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보 페이지</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<img alt="" src="<%=request.getContextPath()%>/upload/sitter/<%=filaeName%>" width="400px" height="400px">
	<button onclick="closePage();">확인</button>
</body>
<style>
	body{
		display:flex;
		flex-direction:column;
		justify-content:center;
		align-items:center;
	}
	table{
		display:flex;
		flex-direction:column;
		text-align:center;
	}
	table tr{
		board:1px solid black;
	}
	table th{
		background-color:lightgray;
	}
	table td{
		background-color:white;
	}
	table th, table td{
		width:160px;
		height:40px;
	}
	table td>textarea{
		resize:none
	}
	tr.photo{
		width:160px;
		height:160px;
	}
</style>
<script>
	function closePage(){
		window.close();
	}
</script>
</html>





