<%@page import="com.petmily.board.model.vo.PetSitterBoard"%>
<%@page import="com.petmily.board.model.vo.PetSitterBoard,java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%
	List<PetSitterBoard> list = (List)request.getAttribute("list");
	
	%>
<!DOCTYPE html>
<html>
<head>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=21457534dfe681cc96c51d32694dc5a9&libraries=services"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

<title>보유 자격증 목록</title>
 <link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/boardWrite2.css">
 <style>
table {
	border-radius: 5px;
	margin-left: auto;
	margin-right: auto;
	border-collapse: collapse;
}


th {
	width: 150px;
	font-size: 12px;
	text-align: center;
	
	color: black;
	}
</style>
</head>
<body>
	<section>

		<div class="container">
			<div class="row">
			<%@ include file="/views/petsitterMypage/petSitterSideBar.jsp"%> 
				<div class="vl"></div>
				<div class="col-9" style="padding: 0;">
					<div class="row top-div" style="height: 200px; overflow: hidden;">
						<img class="top-img" style="width: 100%; margin-top: -230px;"
							src="https://images.unsplash.com/flagged/photo-1548245643-7b805f2f93d5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80">
					</div>
					<ul class="breadcrumb">
						
						<li class="breadcrumb-item active">작성글 List >></li>
					</ul>
					
						
						<button style="display:inline;margin-left:730px;"type="button" onclick="location.replace('<%=request.getContextPath()%>/sitter/write')">글 쓰기</button>
				

					<div class="row3">
						<div class="in-table d-flex justify-content-center">
							<table id="inner" border="1" class="table table-hover">
							
								<tr>
									<th>no</th>									
									<th>제목</th>								
									<th>소개 글</th>									
									<th style="width:200px;">요금(소형)</th>
									<th style="width:200px;">요금(중형)</th>
									<th style="width:200px;">요금(대형)</th>
									<th style="width:350px;">주소</th>
									<th style="width:250px;">상태</th>
									
								</tr>

									<%for(PetSitterBoard p : list) {%>
								<tr>
									
									<td><%=p.getBoardNo() %></td>
									<td><%=p.getBoardTitle()%></td>
									<td><%=p.getBoardInfo()%></td>
									<td><%=p.getSmallPrice()%>원</td>
									<td><%=p.getMiddlePrice()%>원</td>
									<td><%=p.getBigPrice()%>원</td>
									<td style="width:300px;"><%=p.getBoardAddress()%></td>
									<%if(p.getBoardNewType().equals("Y")) {%>
									<td>최신</td>
									<%}else { %>
									<td>이전</td>
									<%} %>
									<td>
									<%if(p.getBoardNewType().equals("Y")) {%>
									<button style="width:60px;"type="button" onclick="boardDetail('<%=p.getBoardNo()%>');">상세보기</button>
									<button style="width:50px;"type="button" onclick="boardUpdate('<%=p.getBoardNo()%>');">수정</button>
									<%}else { %>
									<button style="width:60px;"type="button" onclick="boardDetail('<%=p.getBoardNo()%>');">상세보기</button>
									<%} %>
									</td>
								</tr>
								<%} %>
							</table>
						</div>
					</div>


				</div>
			</div>
		</div>


	</section>



	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</body>

<script>
	function boardDetail(no,userId) {
		
		var popupX = (window.screen.width / 2) - (1000 / 2);
		var popupY= (window.screen.height /2) - (800 / 2);
		window.open('<%=request.getContextPath()%>/sitter/Detail?no='+no,'_blank','width=1000,height=800,left='+popupX+',top='+popupY+',screenX='+popupX+',screenY='+popupY);
	}
	function boardUpdate(no) {
		location.replace('<%=request.getContextPath()%>/sitter/update?no='+no);
	}
</script>
</body>
</html>