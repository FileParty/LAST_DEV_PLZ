<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<style>
body{
	margin-bottom:0px;
	font-family: 'Noto Sans KR', sans-serif;
	
}

/* 회원가입 css 설정 */
article {
    width: 1366px;
    margin: 0 auto;
}

section{
	background-image: url(<%=request.getContextPath()%>/img/common/sitter_2.jpg);
	height:800px !important;
	
}


/* submit(완료) 버튼 설정 */
#btnn_btnn {
    /* 버튼 크기, 테두리 설정 */
    padding: 10px 25px;
    margin-left: 300px;

    background-color: black; /* 버튼 배경 */
    border-radius:25px; /* 버튼을 둥글게! */
    border: 0; /* 박스 선 없애기! */
    font-size: small; /* 폰트 사이즈 */
    color: white; /* 폰트 컬러 */
}
/* submit(완료) 버튼에 마우스를 올렸을 때 마우스 포인터 설정 */
#btnn_btnn:hover {
    cursor: pointer;
    background-color: rgb(98, 98, 98);
}

</style>
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>

<section>
		<div style="margin-left: 300px; margin-top:150px;">
			<h1 style="font-weight:500; font-size:28pt;">펫시터 지원</h1>
			우리집에서 사랑스러운 강아지를 돌보며 수익을 벌어요.<br/>
			혼자 남겨진 반려 동물에게 행복한 시간을 선물해볼까요?
		</div>
		<br>
		<br>
		<input type="button" id="btnn_btnn" value="펫 시터로 회원 가입" onclick="location.replace('<%=request.getContextPath()%>/join/before')" />
		
		
</section>
<%@ include file="/views/common/footer.jsp" %>
