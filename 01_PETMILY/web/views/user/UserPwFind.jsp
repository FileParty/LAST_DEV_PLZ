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
					<td></td>
				</tr>
				
				<tr>
					<td></td>
					<td id="id_warningMsg">
						<span id="idMsg">아이디를 입력하세요.</span><!-- 아이디 메세지 -->
					</td> 
					<td></td>
				</tr>
				
				<tr>
					<td>이메일 입력</td>
					<td>
						<input type="text" id="inputEmail" name="inputEmail" required>
					</td>
					<td>
						<button id="send-btn" onclick="check(); smtpEmail();">인증번호 전송</button> 
					</td>
				</tr>
				
				<tr>
					<td></td>
					<td id="id_warningMsg">
						<span id="emailMsg">이메일을 입력하세요.</span><!-- 아이디 메세지 -->
					</td> 
					<td></td>
				</tr>
			</table>
			<hr id="bottom-line">
		</div>
		
		
		<!--  -->
		
		
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
					<td id="warningMsg">
						<span>*인증번호가 일치하지 않습니다.</span>
					</td>
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
	// span 태그 불러오기
	var idMsgSpan = document.getElementById("idMsg");
	var emailMsgSpan = document.getElementById("emailMsg");
	
	idMsgSpan.innerHTML="&nbsp;";
	emailMsgSpan.innerHTML="&nbsp;";
	
	
	//	SMTP 함수 - 화면 전환과 동시에 SMTP 실행
	function smtpEmail() {
		let email = document.getElementById("inputEmail").value; // 이메일 값 가져오기
		console.log("입력한 이메일값 넘어오는가? : "+email);
		
		if(email=="" || email.trim().length<4) {
			console.log('if문이 찍혀요!');
			alert('이메일을 입력하세요. (4글자 이상-이메일 포함)');
			emailMsgSpan.innerHTML="이메일을 입력하세요";			
			document.getElementById("inputEmail").focus();
		}
		else {
			console.log('else문이 찍혀요!');
			location.replace('<%=request.getContextPath()%>/smtpPWEmail?email='+email);		
		}
		
	} // smtpEmail()
	
	
	// [인증번호] 버튼 눌렀을 때 처리하는 것들.
	function check() {
		var id = document.getElementById("userId").value; // 아이디 값 가져오기
		var email = document.getElementById("inputEmail").value; // 이메일 값 가져오기
		console.log("id값 :"+id);
		console.log("email값 :"+email);
		
		// 만약, 두 태그 중 둘중에 하나라도 값이 없으면?
		if( id=="" || email=="" ) { 
			alert('아이디와 이메일을 입력하세요');
			let modal3 = document.getElementById("contentModal3");
			modal3.style.display = "none"; // 아직 모달처리하지 마라!
			
			// 아이디 값이 없으면?
			if( id=="" ) {
				idMsgSpan.innerHTML="아이디를 입력하세요";
				document.getElementById("userId").focus();
			}
			else {
				idMsgSpan.innerHTML="아이디 입력 확인 완료!";
				idMsgSpan.style.color="green";
				idMsgSpan.style.fontWeight='bolder';
				idMsgSpan.style.fontSize= '15px';
			}
			
			// 이메일 값이 없으면?
			if( email=="" ) {
				emailMsgSpan.innerHTML="이메일을 입력하세요";			
				document.getElementById("inputEmail").focus();
			}
			else {
				emailMsgSpan.innerHTML="아이디 입력 확인 완료!";
				emailMsgSpan.style.color="green";
				emailMsgSpan.style.fontWeight='bolder';
				emailMsgSpan.style.fontSize= '15px';
			}
		}
	} // check()
	
	
	
</script>