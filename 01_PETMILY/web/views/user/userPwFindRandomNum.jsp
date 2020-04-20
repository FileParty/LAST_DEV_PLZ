<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<!-- 슬기 작업 -->
	<!-- 내가 적용한 폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<%@ page import="com.petmily.user.model.vo.User" %>
<%
	String temp = (String)session.getAttribute("AuthenticationKey");
	User u = (User)request.getAttribute("u");
	System.out.println("jsp에서 보여지는 인증번호:" + temp);
	System.out.println("jsp에서 보여지는 유저 : "+u);
%>

<!-- 내가 적용한 내부CSS : 아이디 찾기 -->
	<style>
		/* 전체 페이지의 폰트 설정 */
		* {
			font-family: 'Noto Sans KR', sans-serif;
		}
		
		/* 아이디찾기 타이틀 가운데로 이동 */
		h3#title {
			/* 글씨 가운데 정렬 */
			text-align: center;
			/* 주변 영역 설정 */
			padding-top: 10px;
		}
		
		table {
			margin: 90px auto;
		}
		
		td#inputNum {
			text-align: center;
		}
		
		input#randomNum {
			width: 215px;
			height : 30px;
			
			line-height:20px; /* 태그 내 글씨위치 설정 */
			
			border-radius:5px; /* 테두리 설정 */
			border:1px solid rgb(182, 182, 182); /* 테두리  색상 설정  */
		}
		
		span#success {
			color: red;
			font-weight: bolder;
			font-size: 15px;
		}
		
		button#certification_Num {
			/* 영역 설정 */
			padding: 7px 15px; 
			margin-left: 10px;
			/* 버튼 테두리, 폰트 색상, 배경 설정 */
			border: 1px solid #ffcc33;
			border-radius: 25px;
			color: #ffcc33;
			background-color: white;
		}
		button#certification_Num:hover {
			cursor: pointer;
		    background-color: #ffcc33;
		    color: white;
		}
		
		button#send-end-btn {
			/* 버튼 크기, 테두리 설정 */
		    padding: 10px 60px;
		    margin-top: 10px;
		    margin-left: 200px;
		    margin-bottom: 20px;
		
		    background-color: black; /* 버튼 배경 */ 
		    border-radius:25px; /* 버튼을 둥글게! */ 
		    border: 0; /* 박스 선 없애기!*/ 
		    font-size: large;  /* 폰트 사이즈*/ 
		    color: white;  /* 폰트 컬러 */
		}
		
		button#send-end-btn:hover {
		    cursor: pointer;
		    background-color: rgb(98, 98, 98);
		}
	</style>
<!-- -------------------------------------------------------------------------------------------------------- -->
<section>
	<article>
		<h3 id="title">비밀번호 찾기</h3>
		<hr>
		
		<!-- [비밀번호 찾기] 이메일 인증번호 입력 -->
		<div id="contentModal3" name="contentModal3">
			<table>
				<tr>
					<td id="inputNum">인증번호 입력 &nbsp;&nbsp;</td>
					<td><input type="text" name="randomNum" id="randomNum">&nbsp;&nbsp;&nbsp;</td>
					<td>
						<button id="certification_Num" onclick="checkNum();">인증번호 확인</button>
					</td>
				</tr>
				<tr>
					<td></td>
					<td id="warningMsg">
						<span id="success">&nbsp;</span> <!-- *인증번호가 일치하지 않습니다. -->
					</td>
					<td></td>
				</tr>
			</table>
			
			<input type="hidden" id="hiddenInput">
			
			<hr id="last-bottom-line">
			<button id="send-end-btn" onclick="moveLogin();">로그인</button>
		</div>
	</article>
</section>


<script>

	var span = document.getElementById("success");

	//인증번호 확인 함수(SMTP)
	function checkNum() {
		let randomNum = document.getElementById("randomNum").value;
		// 인증번호가 맞는지 확인하는 로직
		if( randomNum==null || !(randomNum=='<%=temp%>') ) { // 만약, 인증번호가 맞지 않다면?
			alert('인증번호가 없거나 같지 않습니다.');
			$("#randomNum").focus();
			span.innerHTML="*인증번호가 일치하지 않습니다.";
			span.style.color='red';
		}
		else { // 만약 인증번호가 같다면?
			span.innerHTML="*인증번호가 일치합니다.";
			span.style.color="green";
			span.style.fontWeight="bolder";
			span.style.fontSize="15px";
			
			document.getElementById("hiddenInput").value = "통과했어요!";
		}
	};
	
	// 인증번호 확인을 마치고, 버튼을 눌렀을 때 발생함.
	function moveLogin() {
		let msg = document.getElementById("hiddenInput").value;
		console.log(msg);
		let randomNum = document.getElementById("randomNum").value;
		
		// hidden input에 통과했어요! 값이 없다면?
		if( msg=="" ) {
			alert('인증번호 확인 진행이 필요합니다.');
			$("#randomNum").focus();
		}
		else { // 값이 있다면?
			// 화면 전환하기
			location.replace("<%=request.getContextPath()%>/log-in");
			// input값에 있었던 email값을 부모창에 뿌리기
			opener.document.getElementById("userId").value='<%=u.getUserId()%>';
			opener.document.getElementById("userPw").value='<%=u.getPassword()%>';
			self.close();	
		}
	}
</script>