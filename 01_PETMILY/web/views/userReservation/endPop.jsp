<%@page import="com.petmily.reservation.model.vo.PetReservation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.petmily.admin.model.vo.ApplyUserData, 
 com.petmily.admin.model.vo.User,com.petmily.admin.model.vo.AdminPetsitter" %>
<% 
PetReservation pr = (PetReservation)request.getAttribute("pr");

%>
<!DOCTYPE html>
<html>


<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<body>
	<table class="table table-hover">
		
			<tr>
				<th>예약NO</th>
				<td><%=pr.getReservationCode() %></td>
			</tr>
			<tr>
				<th>체크 인</th>
				<td><%=pr.getCheckIn().substring(0,11) %></td>
			</tr>
		
			
			<tr>
				<th>체크 아웃</th>
				<td><%=pr.getCheckOut().substring(0,11) %></td>
			</tr>
		
				<tr>
					<th>체크 아웃</th>
					<td><%=pr.getCheckOut().substring(0,11) %></td>
				</tr>
				<tr>
					<th>결제 금액</th>
					
					<td><%=pr.getPrice() %></td>
				</tr>
				<tr>
					<th>예약 상태</th>
					<td>펫 시팅<%=pr.getResType() %></td>
				</tr>															
	</table>
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
		justify-content:center;
		align-items:center;
	}
	table tr{
	
		board:1px solid black;
	}
	table th, table td{
		board:1px solid white;
	}
	table td>textarea{
		resize:none
	}
</style>
<script>
	function closePage(){
		window.close();
	}
</script>
</html>





