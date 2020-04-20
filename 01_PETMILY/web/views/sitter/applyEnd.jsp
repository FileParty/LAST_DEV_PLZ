<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/applyEnd.css"> --%>
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<style>
	*{
	    /* 마진,패딩값 초기화*/
	     margin: 0 auto; 
	   /*  padding-top: 35px; */
	    font-family: 'Noto Sans KR', sans-serif; 
	    font-size:17px;
	 }
	 
	 body{
		margin-bottom:0px;
		font-family: 'Noto Sans KR', sans-serif;
		
	}
	
	article {
	    width: 1366px;
	    height: 600px;
	    /* margin: 0 auto; */
	    margin-top:200px;
	    
	}
	
	#completeBox{
		width:470px; 
		height:270px; 
		/* border:1px solid; */
		text-align: center; 
		
	 	margin: 0 auto; /*위+아래 와 왼쪽+오른쪽*/
	 	
    	/* text-align:justify; */
    	/* padding: 35px 10px; */
    	/* border :1px solid; */
    	background-color: #f0f0f0;
    	/* margin-bottom :20px; */
    	border-radius: 5px;
	}

	
	
	input#btn_btn {
   /* 원래는 안 보이게 해야 한다 */
   /* display: none; */
   
   /* 버튼 크기, 테두리 설정 */
    padding: 10px 60px;
    margin-left: 610px;
	/* margin-top :50px; */
    background-color: black; /* 버튼 배경 */
    border-radius:25px; /* 버튼을 둥글게! */
    border: 0; /* 박스 선 없애기! */
    font-size: large; /* 폰트 사이즈 */
    color: white; /* 폰트 컬러 */
    margin-top:50px;
	}
/* 버튼에 마우스를 올렸을 때 마우스 포인터 설정 */
	input#btn_btn:hover {
	    cursor: pointer;
	    background-color: rgb(98, 98, 98);
	}
</style>
  <%@ include file="/views/common/header.jsp" %>   
<body>
		<section>
			<article>
				<div id="completeBox">
				<h1 style="padding-top:50px; font-size:20px;">지원이 완료되었습니다.</h1><br><br>
				작성해 주신 이메일로 지원 결과를 안내 드립니다.<br>
				지원 결과는 1주 이내에 전달됩니다.<br>
				</div>
			
				<input id="btn_btn" type="button" value="홈으로" onclick="location.replace('<%=request.getContextPath()%>')" />
			</article>
		</section>
		
	
</body>
<%@ include file="/views/common/footer.jsp" %>