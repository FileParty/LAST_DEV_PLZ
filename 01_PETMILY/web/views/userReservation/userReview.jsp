<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int no = (int)request.getAttribute("no");	
	String pId = (String)request.getAttribute("pId");
	System.out.print(no);
%>
<html>
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
	
<body>

	<form action="<%=request.getContextPath()%>/user/reviews?no=<%=no %>&pId=<%=pId %>" method="post">
	<table  class="table table-hover">
	<tr><td><p>예약 번호 : <%=no %></p></td></tr>
	<tr><td><textarea cols="50" rows="5" name="text"></textarea></td></tr>
	<tr><td><p>별점★</p><input type="number" name="star" min="0" max="5" step="1"></td></tr>
	<tr><td><button  type="submit">후기 등록</button></td></tr>
	</table>
	
		
	</form>
</body>
</html>