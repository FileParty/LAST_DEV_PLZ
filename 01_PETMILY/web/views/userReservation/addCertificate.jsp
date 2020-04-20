<%@page import="com.petmily.petsitter.model.vo.PetSitterCertificate,java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%
    	List<PetSitterCertificate> list = (List)request.getAttribute("pc");
		System.out.println("추가목록:"+list);
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
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

<title>자격증 추가</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/boardWrite2.css">
<style>
table {
	
	margin-left: auto;
	margin-right: auto;
	border-collapse: collapse;
}

th {
	width: 150px;
	font-size: 12px;
	text-align: center;
	background-color:lightgray;
	color: grey;
	
}
</style>
</head>
<body>
	<section>

		<div class="container">
			<div class="row">
				<%@ include file="/views/petsitterMypage/petSitterSideBar.jsp" %>
				<div class="vl"></div>
				<div class="col-9" style="padding: 0;">
					<div class="row top-div" style="height: 200px; overflow: hidden;">
						<img class="top-img" style="width: 100%; margin-top: -230px;"
							src="https://images.unsplash.com/flagged/photo-1548245643-7b805f2f93d5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80">
					</div>
					<ul class="breadcrumb">
						<li class="breadcrumb-item">자격증</li>
						<li class="breadcrumb-item active">자격증 추가</li>
					</ul>


					<div class="row3">
						<div class="in-table d-flex justify-content-center">
							<table id="inner" border="1" class="table table-hover">
							
						
								<tr>
									<th>no</th>
									<th>자격증 명</th>
									<th>인증 기관</th>
									<th>취득 일시</th>
									<th>만료 일시</th>
									<th>이미지 보기</th>
									<th>상태</th>
								</tr>
								<tr>
								<%for(PetSitterCertificate pc : list) {%>
									<td><%=pc.getCount() %></td>
									<td><%=pc.getCertificateName() %></td>
									<td><%=pc.getCertificationNmae() %></td>
									<td><%=pc.getDateOfAcquisition().substring(0,11) %></td>
									<%if(pc.getExpirationDate()!=null) {%>
									<td><%=pc.getExpirationDate().substring(0,11) %></td>
									<%}else { %>
									<td>- </td>
									<%} %>
									<td><button type="button" onclick="window.open('<%=request.getContextPath()%>/views/userReservation/imgView.jsp?img=<%=pc.getCertificateFilename()%>','_blank','width=500px,height=500px')">이미지 보기</button></td>
									<td><%=pc.getResType() %></td>									
								</tr>
								<%} %>
							
							</table>
							
						</div>
					
					</div>
							<button type="button" style="margin-left:400px;font-size:10px;height:25px;border-radius:15px;" onclick="addCertificate();">자격증 추가</button>
							<br>
							<br>
							<div style="margin-left:50px;letter-spacing:5px;"align=center>
							<%=request.getAttribute("pageBar") %>
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
	function addCertificate() {
		window.open("<%=request.getContextPath()%>/views/userReservation/addCertificatePop.jsp","pop","width=500,height=800");
	}

</script>
</body>
</html>