<%@page import="com.petmily.petsitter.model.vo.PetSitterCertificate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%
    	PetSitterCertificate pc = (PetSitterCertificate)request.getAttribute("pc");
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
	href="<%=request.getContextPath()%>/css/boardWrite.css">
<style>
table {
	border-radius: 5px;
	margin-left: auto;
	margin-right: auto;
	border-collapse: collapse;
}

td {
	border-top: 1px solid grey;
	border-bottom: 1px solid grey;
}

th {
	width: 150px;
	font-size: 12px;
	text-align: center;
	background-color: rgb(189, 188, 188);
	color: grey;
	border-right: 1px solid white;
}
</style>
</head>
<body>
	<section>

		<div class="container">
			<div class="row">
				<div class="col-2 menu">
					<div id="menu">
						<ul type="none">
							<li class="title">회원정보</li>
							<hr class="hr-line" />
							<li class="content"><a href=""> - 회원정보 수정</a></li>
							<li class="content"><a href=""> - 회원 탈퇴</a></li>
							<br />

							<li class="title">작성글</li>
							<hr class="hr-line" />
							<li class="content"><a
								href="<%=request.getContextPath()%>/sitter/Detail"> - 작성글 보기</a></li>
							<li class="content"><a href=""> - 작성한 비밀후기 보기</a></li>
							<br />

							<li class="title">예약</li>
							<hr class="hr-line" />
							<li class="content"><a href=""> - 예약 현황</a></li>
							<li class="content"><a href=""> - 요청중인 예약</a></li>
							<li class="content"><a href=""> - 진행중인 예약</a></li>
							<li class="content"><a href=""> - 완료된 예약</a></li>
							<li class="content"><a href=""> - 채팅</a></li>
							<br />

							<li class="title">정산</li>
							<hr class="hr-line" />
							<li class="content"><a href=""> - 이번 달 정산 현황</a></li>
							<li class="content"><a href=""> - 이번 정산 보기</a></li>
							<br />

							<li class="title">자격증</li>
							<hr class="hr-line" />
							<li class="content"><a
								href="<%=request.getContextPath()%>/sitter/certificate"> -
									보유 자격증 목록</a></li>
							<li class="content"><a href="<%=request.getContextPath()%>/sitter/addCertificate"> - 자격증 추가</a></li>
						</ul>
					</div>
				</div>
				<div class="vl"></div>
				<div class="col-9" style="padding: 0;">
					<div class="row top-div" style="height: 200px; overflow: hidden;">
						<img class="top-img" style="width: 100%; margin-top: -230px;"
							src="https://images.unsplash.com/flagged/photo-1548245643-7b805f2f93d5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80">
					</div>
					<ul class="breadcrumb">
						<li class="breadcrumb-item">자격증</li>
						<li class="breadcrumb-item active">보유 자격증 목록</li>
					</ul>


					<div class="row3">
						<div class="in-table d-flex justify-content-center">
							<table id="inner" border="1">
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
									<td>NO</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>

									
									<td></td>
			
									<td></td>									
								</tr>
								
							</table>
							
						</div>
					</div>
							<button style="margin-left:400px;font-size:10px;height:25px;border-radius:15px;" onclick="addCertificate();">자격증 추가</button>
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
		window.open("<%=request.getContextPath()%>/views/userReservation/addCertificatePop.jsp","_blank","width=500,height=700");
	}
</script>
</body>
</html>