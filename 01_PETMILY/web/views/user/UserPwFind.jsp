<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 내가 적용한 CSS : 아이디,비밀번호 찾기 -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/yskCss/pwFindForm.css">
	<!-- 내가 적용한 폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  
<section>
	
	<article>
	
		<h3 id="title">비밀번호 찾기</h3>
		
		<hr>
		
		
		<!-- [비밀번호 찾기] 아이디 입력 -->
		<!-- 바로 보여져야 하는 화면이기 때문에 따로 분기처리 하지 않았음. -->
		<div id="contentModal1" name="contentModal1">
			<p id="p_title">회원가입 때 작성한 아이디와 이메일을 입력하세요</p>
			<table id="firstTB">
				<tr>
					<td>아이디 입력</td>
					<td id="inputId">
						<input type="text" id="userId" name="userId" required>
					</td>
				</tr>
				<tr>
					<td></td>
					<td id="id_warningMsg">
						<span id="idMsg">아이디 메세지</span><!-- 아이디 메세지 -->
					</td> 
				</tr>
				<tr>
					<td>이메일 입력</td>
					<td>
						<input type="text" id="inputEmail" name="inputEmail">
					</td>
					<td>
						<button id="send-btn" onclick="next2(); ckechEmail();">인증번호 전송</button> 
					</td>
				</tr>
			</table>
			<br>
			<hr id="bottom-line">
			<button id="send-next-btn" onclick="ckechId();">다음</button>
		</div>
		
		
		
		
		
		<!-- [비밀번호 찾기] 이메일 인증번호 입력 -->
		<div id="contentModal3" name="contentModal3">
			<table>
				<tr>
					<td id="inputNum">인증번호 입력</td>
				</tr>
				<tr>
					<td><input type="text" name="randomNum" id="randomNum"></td>
				</tr>
				<tr>
					<td id="warningMsg">*인증번호가 일치하지 않습니다.</td>
				</tr>
			</table>
			
			<hr id="last-bottom-line">
			<button id="send-end-btn">인증 완료</button>
		</div>
		
		
	</article>
	
	
	
</section>

<script>
	/* // [다음] 버튼 누를 때 화면전환
	function next1() {
		let modal1 = document.getElementById("contentModal1");
		let modal2 = document.getElementById("contentModal2");
		
		modal1.style.display = "none";
		modal2.style.display = "inline";
	} */
	
	// [인증번호 전송] 버튼 누를 때 화면전환
	/* function next2() {
		let modal2 = document.getElementById("contentModal2");
		let modal3 = document.getElementById("contentModal3");
		
		modal2.style.display = "none";
		modal3.style.display = "inline";
	} */
	
	
	/* ------------- */
	
	// [다음] 버튼 누를 때 화면전환하기 전!! 아이디 확인하는 함수
	function ckechId() {
		let id = document.getElementById("userId").value; // 아이디 값 가져오기
		
		// 만약, 두 태그 중 둘중에 하나라도 값이 없으면?
		if( id==null ) { // 아이디 
			alert('아이디를 입력하세요');
			
			// 화면전환을 막는다
			let modal1 = document.getElementById("contentModal1");
			let modal2 = document.getElementById("contentModal2");
			modal1.style.display = "inline";
			modal2.style.display = "none";
		}
		
		if( !id==null ) { // 값이 있으면?
			// 화면전환한다
			alert("");
			let modal1 = document.getElementById("contentModal1");
			let modal2 = document.getElementById("contentModal2");
			modal1.style.display = "none";
			modal2.style.display = "inline";
		}
		
	} // checkId
	
	/* // [다음] 버튼 누를 때 화면전환하기 전!! 이메일 확인하는 함수
	function checkEmail() {
		let email = document.getElementById("inputEmail").value; // 이메일 값 가져오기
		console.log("input의 email값 확인하기 : "+email);
		if( email==null ) { // 이메일
			alert('이메일을 입력하세요');
			$("#inputEmail").focus();
		}
	} */
	
	
	
</script>