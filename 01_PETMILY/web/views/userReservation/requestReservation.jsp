<%@page import="com.petmily.reservation.model.vo.PetReservation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.petmily.admin.model.vo.ApplyUserData, 
 com.petmily.admin.model.vo.User,com.petmily.admin.model.vo.AdminPetsitter" %>
<% 
PetReservation pr = (PetReservation)request.getAttribute("rev");

%>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<!DOCTYPE html>
<html>


<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<body>
	<table style="border:1px solid lightgray;" class="table table-hover">
		
			<tr >
				<th style="border-right:1px solid lightgray;">예약NO</th>
				<td><%=pr.getReservationCode() %></td>						
			</tr>
			<tr>
				<th style="border-right:1px solid lightgray;">예약자 ID</th>
				<td><%=pr.getUserId() %></td>
			</tr>
			<tr>
				<th style="border-right:1px solid lightgray;">체크 인</th>
				<td><%=pr.getCheckIn().substring(0,11) %></td>
			</tr>
			<tr>
				<th style="border-right:1px solid lightgray;">체크 아웃</th>
				<td><%=pr.getCheckOut().substring(0,11) %></td>
				
			</tr>
			
			<tr>
				<th style="border-right:1px solid lightgray;">요청 사항</th>
				<%if(pr.getPlusQuestion()==null) { %>
					<td>없음</td>
					<%} else { %>
					<td><%=pr.getPlusQuestion() %></td>
					<%} %>
			</tr>
			<tr>
				<th style="border-right:1px solid lightgray;">입금 일자</th>
					<%if(pr.getPriceEndDate()!=null) {%>
					<td><%=pr.getPriceEndDate().substring(0,11) %></td>
					<%}else { %>
					<td>-</td>
					<%} %>
					
				
			</tr>
			<tr>
				<th style="border-right:1px solid lightgray;">총 금액</th>
				<td><%=pr.getPrice() %></td>
			</tr>
			
			<tr>
				<th style="border-right:1px solid lightgray;">약물 복용 상세</th>
				
				<%if(pr.getPetMedication()==null) { %>
				<td>없음</td>
				<%} else { %>
				<td><%=pr.getPetMedication() %></td>
				<%} %>
			</tr>
			<tr>
				<th style="border-right:1px solid lightgray;">픽업</th>
				
				<%if(pr.getPetPickup()==null) { %>
				<td>없음</td>
				<%} else { %>
				<td><%=pr.getPetPickup() %></td>
				<%} %>
			</tr>
			
				<tr>
				<th style="border-right:1px solid lightgray;">펫 사이즈</th>
				<td><%=pr.getPetSize() %></td>
			</tr>
			
				<tr>
				<th style="border-right:1px solid lightgray;">목욕 횟수</th>
				<td><%=pr.getPetBath() %></td>
			</tr>							
	</table>
	<br>
	<br>
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
		text-align:center;
	}
</style>
<script>
	function closePage(){
		window.close();
	}
</script>
</html>





