<%@page import="com.petmily.reservation.model.vo.PetReservation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
PetReservation pr = (PetReservation)request.getAttribute("revs");

%>


<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<body>
	<table class="table table-hover" align=center;>
		
			<tr>
				<th>예약NO</th>
				<td><%=pr.getReservationCode()%></td>
			</tr>
			<tr>
				<th>예약자 ID</th>
				<td><%=pr.getUserId() %></td>
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
					<th>요청 사항</th>
					<%if(pr.getPlusQuestion()==null) { %>
					<td>없음</td>
					<%} else { %>
					<td><%=pr.getPlusQuestion() %></td>
					<%} %>
				</tr>
				<tr>
				
					<th>입금일자</th>
					<%if(pr.getPriceEndDate()!=null) {%>
					<td><%=pr.getPriceEndDate().substring(0,11) %></td>
					<%}else {  %>
					<td>-</td>
					<%} %>
				</tr>
				<tr>
					<th>합계 금액</th>
					<td><%=pr.getPrice() %></td>
				</tr>
				<tr>
					<th>약물 복용 상세</th>
					<%if(pr.getPetMedication()==null) { %>
					<td>없음</td>
					<%} else { %>
					<td><%=pr.getPetMedication() %></td>
					<%} %>
				</tr>
			
			
				<tr>
					<th>집 앞 픽업</th>
					<%if(pr.getPetPickup()==null) { %>
					<td>없음</td>
					<%} else { %>
					<td><%=pr.getPetPickup() %></td>
					<%} %>
				</tr>
				<tr>
					<th>펫 사이즈</th>
					<td><%=pr.getPetSize() %></td>
				</tr>
				<tr>
					<th>목욕 횟수</th>
					<td><%=pr.getPetBath() %></td>
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
		
		justify-content:center;
		flex-direction:column;
		text-align:center;
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






