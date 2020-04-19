<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.List,com.petmily.petsitterMyPage.reservation.model.vo.PetsitterMypageExtraFee" %>
<%
	
	PetsitterMypageExtraFee pme  = (PetsitterMypageExtraFee)request.getAttribute("pme");
	int count =1;
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청 상세 내용.</title>
<style>
   table{
        border-radius: 5px;
        margin-left: auto;
        margin-right: auto;
        border-collapse: collapse;
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
    }
</style>
</head>
<body>

<div>
	
		
			<table>
			<tr>
			<th>청구 이미지</th>
			<th>청구 날짜</th>
	
			<th>청구 타입</th>
			<th>청구 이유</th>
			<th>청구 금액</th>
	
			</tr>
			<tr>
			<td></td>
		
			<td></td>
			<td></td>
			<td></td>
			</tr>
			</table>
			<br/>

</div>


</body>
</html>