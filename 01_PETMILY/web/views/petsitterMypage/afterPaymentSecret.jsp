<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.List,com.petmily.petsitterMyPage.reservation.model.vo.PetsitterMypageReservation" %>

<%
	PetsitterMypageReservation pmr= (PetsitterMypageReservation)request.getAttribute("pmr");

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청 상세 내용.</title>
<style>
   table{
   		border: 1px solid grey;
        border-radius: 5px;
        margin-left: auto;
        margin-right: auto;
        border-collapse: collapse;
        vertical-align:middle;
 	}
    td{
    	font-size : 12px;
        border-top: 1px solid grey;
        border-bottom: 1px solid grey;
		text-align: center;
		line-height: 30px;
		vertical-align:middle;
		
    }

    th{
    	font-weight: 500;
        width: 150px;
        font-size: 14px;
        text-align: center;
        line-height: 25px;
        background-color: rgb(189, 188, 188);
        color: grey;
        border-right: 1px solid white;
        border-bottom: 1px solid grey;
       	vertical-align:middle;
    }
    
    #dv{
    	text-align : center;
    }
    
	.btn{
		
    	margin-left : auto;
    	margin-right : auto;
		padding: 5px 35px;
		color: grey;
		border: 3px solid black;
		background-color: black;
	    font-size: 12px;
	  	width: 110px;
	  	height: 35px;
	 	border-radius: 20.5px;
	 
	}
	.btn:hover{
	    color: white;
	    background-color: black;
	}
	
</style>
</head>
<body>

<div>
		<form action="<%=request.getContextPath()%>/sitter/secretEnd" method="post" name= "insertForm" id="insertForm">
			<table>
			
			<tr>
			<th>사용자 아이디</th>
			<td><input type="text" name="userId" readonly value="<%=pmr.getUserId()%>"/></td>
			</tr>
			
			<tr>
			<th>예약코드</th>
			<td><input type="text" name="rsCode" readonly value="<%=pmr.getReservationCode()%>"/></td>
			</tr>
			
			<tr>
			<th>별점</th>
			<td>
			<input type="hidden" name="sitterRNo"/>
			<%-- <input type="hidden" name="rsCode" value="<%=psr.getRsCode()%>"/> --%>
				<select name="star">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
			</td>
			</tr>
			
			<tr>
			<th>리뷰 작성</th>
			<td>
				<textarea name="reviewTxt" style="resize: none; vertical-align:middle;" cols="50" rows="10" required></textarea>
			</td>
			</tr>

			</table>
			<br/>
			<div id="dv">
			<input type="submit" class="btn" value="등록"/>
			</div>
		</form>
</div>
<script>

</script>


</body>
</html>