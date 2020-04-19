<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.List,com.petmily.petsitterMyPage.reservation.model.vo.PetsitterMypageExtraFee" %>
<%
	
	int count =1;
	int rsCode = Integer.parseInt(request.getParameter("rsCode"));
	
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
	<form action="<%=request.getContextPath()%>/sitter/secretEnd" method="post" enctype="multipart/form-data">
			<table>
			
            <tr>
                <th>청구 이미지</th>
                <td class="none" style="line-height: 5px; font-size: 10px; width: 200px;"><input type="file" name="upload" required/></td>
            </tr>
            <tr>
                <td colspan="2" class="none" ><p style="line-height: 5px; font-size:10px;">*파일명이 영문, 숫자가 아닐경우 이미지가 안보일 수 있습니다.</p></td>
            </tr>
            <tr>
				<th>청구 타입</th>
				<td>
					<select name="type">
						<option value="강아지가 집안 물건을 파손했어요">- 강아지가 집안 물건을 파손했어요</option>
						<option value="강아지가 상해를 입혔어요">
						- 강아지가 상해를 입혔어요
						</option>
						<option value="정해진 시간을 초과했어요">
						- 정해진 시간을 초과했어요
						</option>
						<option value="기타">
						- 기타
						</option>
					</select>
				</td>
			<tr>
				<th>청구 금액</th>
				<td>
				<input type="number" name="money"/><span> 원</span>
				<input type="hidden" name="rsCode" value="<%=rsCode%>"/>
				</td>
			</tr>
			</tr>
			<tr>
				<th>청구 이유</th>
				<td><textarea name="reason" style="resize: none; vertical-align:middle;" cols="50" rows="10" required></textarea></td>
			</tr>
		
			</table>
			<br/>
			<div id="dv">
			<input type="submit" class="btn" value="등록"/>
			</div>
			<br/>
	
	</form>	
</div>


</body>
</html>