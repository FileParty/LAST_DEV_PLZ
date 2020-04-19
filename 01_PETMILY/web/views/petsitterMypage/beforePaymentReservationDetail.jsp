<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.List,com.petmily.petsitterMyPage.reservation.model.vo.PetsitterMypageDetail" %>
<%
	
	List<PetsitterMypageDetail> list = (List)request.getAttribute("list");
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
	<%if(!list.isEmpty()) {%>
		<%for(PetsitterMypageDetail pmd:list){ %>
			<table>
			<tr>
			<th>no</th>
			<th>사용자 아이디</th>
			<th>체크인 날짜</th>
			<th>체크아웃 날짜</th>
			<th>목욕 여부</th>
			<th>추가 요청</th>
			</tr>
			<tr>
			<th><%=count++ %></th>
			<td><%=pmd.getUserId()%></td>
			<td><%=pmd.getCheckInDate()%></td>
			<td><%=pmd.getCheckOutDate()%></td>
			<%if(pmd.getPetBath()!=0){ %>
				
				<td><%=pmd.getPetBath()%></td>
					
			<%} else{%>
				
				<td>없음</td>
			
			<%} %>
			<%if(pmd.getPlusQuestions()!=null){ %>
			<td><%=pmd.getPlusQuestions()%></td>
			<%} else{%>
				
				<td>없음</td>
			
			<%} %>
	
			</tr>
			</table>
			<br/>
		<%} %>
		
	<%}else{ %>
	
		<p>내용이 없습니다.</p>
		
	<%} %>
</div>


</body>
</html>