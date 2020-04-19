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

 p#title{
    	text-align:center; 
    	margin-top:100px;
    	margin-bottom:50px;
    	font-size:24pt;
    	font-weight: 500;
    }

/* 회원가입 */
/* 회원가입 폰트 설정 */
/* section > h1 {
    width: 100%;
   	font-weight: 100;
    height: 70px;
    text-align: center;
} */

/* ---------- */

/* 회원가입 테이블 설정 */
table#enrollTB {
    border-radius: 5px; /* 테두리 둥글게 */
    margin: 0 auto; /*가운데로 정렬*/
    
    
    background-color: #f0f0f0;
    
    /* 영역 설정 */
    padding-top: 50px;
    padding-bottom: 50px;
    padding-left: 30px;
    padding-right: 150px;  
    
    width: 900px;
}

tr.tr-blank {
	/* border: 1px solid; */
}

/* 테이블 내 첫번째 td 설정 */
table#enrollTB tr >td:first-child {
	font-size : 14px;
    width: 250px;
    text-align: right;
}


/* 회원가입 테이블 내 td 설정 */
tr.tr-blank td{
    padding-bottom: 10px; /* 각 td의 아래 여백 설정 */
}
/* 테이블 내 2번째 td의 좌측 여백 설정 */
tr.tr-blank > td.second-td     {
    padding-left: 10%;
}


/* input 태그 설정 */
td.second-td input {
    /* 높이설정 */
    height: 30px;
    
    /* 태그 내 글씨 위치설정 */
    line-height: 20px;
    /* 테두리설정 */
    border-radius: 5px;
    /* border: 1px solid rgb(182, 182, 182); */
}
input#phone {
	line-height: 20px;
	width: 175px;
}

input#email{
	
	width: 175px;
}
/* select 태그 설정 */
/* td.second-td select {
    height: 30px;
} */

/* 이메일 선택하는 td 설정 */

/* 이메일 선택하는 select 설정 */
select#email {
	/* 길이설정 */
	width: 175px;
	/* 높이설정 */
    height: 30px;
	/* 테두리설정 */
    border-radius: 5px;
    /* border: 1px solid rgb(182, 182, 182); */
}
/* 우편번호, 지번주소, 도로명주소, 상세주소입력 input 설정 */
input#postNum,
input#streetAddress,
input#jibunAddress,
input#addressInput,
input#accountName,
input#account,
input#certiName,
input#certiAgency,
input#certiday,
input#expireday {
	width: 175px;
	line-height: 20px;
	padding-left: 10px;
}




/* 메세지영역 설정 */
td.div-msg {
    /* 원래는 안 보이게 한다 */
    display: none;
    
    padding-left: 10%;
    font-size: 13px;
    color: rgb(138, 0, 0);
}

/* ---------- */

/* 체크하는 버튼 3개 설정 */
button#check-btn {
    padding: 7px 15px;
    
    border: 1px solid #ffcc33;
    border-radius: 25px;
    
    color: #ffcc33;
    background-color: white;
}
/* 체크하는 버튼 3개에 마우스를 올렸을 때 포인터 설정 */
button#check-btn:hover {
    cursor: pointer;
    background-color: #ffcc33;
    color: white;
}

/* submit(완료) 버튼 설정 */
button#enroll-btn {
    /* 버튼 크기, 테두리 설정 */
    padding: 10px 60px;
    margin-left: 610px;

    background-color: black; /* 버튼 배경 */
    border-radius:25px; /* 버튼을 둥글게! */
    border: 0; /* 박스 선 없애기! */
    font-size: large; /* 폰트 사이즈 */
    color: white; /* 폰트 컬러 */
}
/* submit(완료) 버튼에 마우스를 올렸을 때 마우스 포인터 설정 */
button#enroll-btn:hover {
    cursor: pointer;
    background-color: rgb(98, 98, 98);
}
#enrollTB td{
	border :none;
}

span.spanClass {
	margin-left: 80px;
	visibility:hidden; 
}

</style>


	<!-- 내가 적용한 CSS : 회원가입 -->
	<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/joinForm.css"> --%>
	<!-- 내가 적용한 jQuery -->
	<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
	<!-- Daum 우편번호 서비스 API  -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<!-- 회원가입 영역 -->
<section>
    <p id="title">펫 시터 회원가입</p>
    <article>

        <form action="<%=request.getContextPath()%>/apply/join" method="post" enctype="multipart/form-data" onsubmit="return all_join_check();">
            <table id="enrollTB">

                <tr class="tr-blank">
                    <td>아이디</td>
                    <td class="second-td">
                    	<input id="sitterId" name="sitterId" type="text" placeholder="4~12글자 입력" required >&nbsp;&nbsp;&nbsp;
                    	<button type="button" id="check-btn" onclick="duplicate();">중복 확인</button>
                    </td>
                </tr>

                <tr class="tr-blank">
                    <td>비밀번호</td>
                    <td class="second-td">
                    	<input type="password" id="password" name="password" placeholder="8~15자리 입력"required> 
                    </td>
                </tr>

                <tr>
                    <td></td>
                    <td id="pwMsg">
                    	<span id="result" class="spanClass">비밀번호 중복확인 메세지 영역</span></td>
                </tr>

                <tr class="tr-blank">
                    <td>비밀번호 확인</td>
                    <td class="second-td">
                    	<input type="password" id="pwck" name="pwck" required>
                    </td>
                </tr>
                
                <tr class="tr-blank">
                    <td>프로필 이미지</td>
                    <td class="second-td">
                    	<input style ="padding-left:5px; padding-top:5px;" type="file" id="upload" name="upload" required>
                    	<p style = "font-size:10px; color : gray;">* 파일명이 영문, 숫자가 아닐경우 이미지가 안보일 수 있습니다.</p>
                    </td>
                </tr>
                
				<!-- <tr class="tr-blank">
				<td></td>
				</tr>
				<tr class="tr-blank">
				<td></td>
				</tr>
				<tr class="tr-blank">
				<td></td>
				</tr> -->
                <tr class="tr-blank">
                    <td>이름</td>
                    <td class="second-td" style="padding-bottom:0px;">
                    	<input type="text" id="user_name" name="user_name">
                    </td>
                </tr>
                
                <tr>
                	<td>성별</td>
	                <td style="padding-left: 10%; line-height: 40px; margin-top:0px;">
						<input type="radio" name="gender" id="gender0" value="남">
						<label for="gender0" style="font-size:14px">남</label>
						<input type="radio"  name="gender" id="gender1" value="여">
						<label for="gender1" style="font-size:14px">여</label>
					</td>
                </tr>

                <tr class="tr-blank">
                    <td>생년월일</td>
                    <td class="second-td">
                    	<input type="date" id="user_birth_day" name="user_birth_day" min="1900-01-01" max="<%=System.currentTimeMillis() %> %>"
			            style="width: 175px; padding-left: 10px;">
                   </td>
               </tr>
               
               <tr class="tr-blank">
                   <td>이메일</td>
                   <td class="second-td" id="emailSelect">
                   		<div style="display:flex-direction: row;">
	                   		<input id="email" type="email" name="email">&nbsp;&nbsp;&nbsp;
	                   		<button type="button" id="check-btn" onclick="duplicateEmail();">중복 확인</button>
	                   	</div>
                   </td>
               </tr>

               
               <tr class="tr-blank">
                   <td>핸드폰 번호</td>
                   <td class="second-td">
                   		<input style="padding-left: 10px;" type="text" id="phone" name="phone" required placeholder="입력 예 : 010-1234-5656">&nbsp;&nbsp;&nbsp;
                       <!-- <input type="text" style="width: 100px;" required> - <input type="text" style="width: 100px;" required> - <input type="text" style="width: 100px;" required > -->
                  		<button type="button" id="check-btn" onclick="duplicatePhone();">중복 확인</button>
                   </td>
               </tr>
               
                <tr class="tr-blank">
                    <td>우편변호</td>
                    <td class="second-td">
                    	<input type="text" id="postNum" name="postNum" placeholder="우편번호" readonly>&nbsp;&nbsp;&nbsp;
                    	<button type="button" id="check-btn" onclick="zip_code();">우편번호 찾기</button>
                    	
                    </td>
                </tr>
                
                <tr class="tr-blank">
                    <td></td>
                    <td class="second-td">
                    	<input id="streetAddress" name="address" type="text" placeholder="도로명주소" readonly>
                    </td>
                </tr>
                
                <!-- <tr class="tr-blank">
                    <td></td>
                    <td class="second-td">
                    	<input id="jibunAddress" type="text" placeholder="지번주소">
                    </td>
                </tr> -->
                
                <tr class="tr-blank">
                    <td>상세주소</td>
                    <td class="second-td">
                    	<input id="addressInput" name="detail" type="text" placeholder="상세주소 입력">
                   	</td>
                   	<td><input type="hidden" name="type" value="미승인펫시터"/></td>
                </tr>
                
                <!-- <tr class="tr-blank">
				<td></td>
				</tr>
				<tr class="tr-blank">
				<td></td>
				</tr>
				<tr class="tr-blank">
				<td></td>
				</tr> -->
				
                <tr>
                	<td style="padding-bottom:10px;">정산계좌 등록</td>
                </tr>
                <tr class="tr-blank">
                	<td style="font-size : 12px; color:grey;">은행</td>
                	<td class="second-td">
                    	<select name="bank">
					     
					        <option value="산업은행">산업은행</option>
					        <option value="기업은행">기업은행</option>
					        <option value="국민은행">국민은행</option>
					        <option value="외환은행">외환은행</option>
					        <option value="수협은행">수협은행</option>
					        <option value="농협중앙회">농협중앙회</option>
					        <option value="농협은행">농협은행</option>
					        <option value="우리은행">우리은행</option>
					        <option value="신한은행">신한은행</option>
					        <option value="SC제일은행">SC제일은행</option>
					        <option value="씨티은행">씨티은행</option>
					        <option value="대구은행">대구은행</option>
					        <option value="부산은행">부산은행</option>
					        <option value="광주은행">광주은행</option>
					        <option value="제주은행">제주은행</option>
					        <option value="전북은행">전북은행</option>
					        <option value="경남은행">경남은행</option>
					        <option value="새마을금고">새마을금고</option>
					        <option value="신협은행">신협은행</option>
					        <option value="우체국은행">우체국은행</option>
					        <option value="하나은행">하나은행</option>
					        <option value="카카오뱅크">카카오뱅크</option>
					        

					    </select>
                   	</td>
                </tr>
                <tr class="tr-blank">
                	<td style="font-size : 12px; color:grey;">계좌번호</td>
                	<td class="second-td">
                    	<input id="account" name="account" type="text" placeholder="계좌번호 입력">
                   	</td>
                </tr>
                <tr class="tr-blank">
                	<td style="font-size : 12px; color:grey;">예금주</td>
                	<td class="second-td">
                    	<input id="accountName" name="accountName" type="text">
                   	</td>
                </tr>
                
                <tr>
                	<td>자격증 유무</td>
	                <td style="padding-left: 10%; line-height: 40px; margin-top:0px;">
						<input type="radio" name="certificate" id="certificate0" value="N">
						<label for="certificate0" style="font-size:14px">없음</label>
						<input type="radio"  name="certificate" id="certificate1" value="Y">
						<label for="certificate1" style="font-size:14px">있음</label>
					</td>
                </tr>
                
                <tr class="tr-blank">
                	<td>자격증 명</td>
                	<td class="second-td">
                    	<input id="certiName" name="certiName" type="text">
                   	</td>
                </tr>
                <tr class="tr-blank">
                	<td>인증 기관</td>
                	<td class="second-td">
                    	<input id="certiAgency" name="certiAgency" type="text">
                   	</td>
                </tr>
                
                <tr class="tr-blank">
                	<td>취득 일시</td>
                	<td class="second-td">
                    	<input type="date" id="certiday" name="certiday" min="1900-01-01" max="2020-12-31"/>
                   	</td>
                </tr>
                
                <tr class="tr-blank">
                	<td>만료 일시</td>
                	<td style="padding-left: 10%; line-height: 40px; margin-top:0px;">
						<input type="radio" name="expiration" id="expiration0" value="N">
						<label for="expiration0" style="font-size:14px">없음</label>
						<input type="radio"  name="expiration" id="expiration1" value="Y">
						<label for="expiration1" style="font-size:14px">있음</label>
					</td>
                </tr>
                <tr class="tr-blank">
                	<td></td>
                	<td class="second-td">
                		<input type="date" id="expireday" name="expireday" min="1900-01-01" max="2020-12-31"/>
                	</td>
                </tr>
                
                <tr class="tr-blank">
                	<td>이미지 첨부</td>
                	<td class="second-td">
           
                	<input style ="padding-left:5px; padding-top:5px;" type="file" id="liupload" name="liupload" required>
                	</td>
                </tr>
                <tr class="tr-blank">
                	<td></td>
                	<td class="second-td">
                		<p style = "font-size:10px; color : gray;">* 파일명이 영문, 숫자가 아닐경우 이미지가 안보일 수 있습니다.</p>
                    	<p style = "font-size:10px; color : gray;">* 자격증 이미지, 보인 인증 이미지 첨부.</p>
                    </td>
                </tr>
                
            </table>

            <br>
            <br>
            
			<div>
			<br>
			<br>
			
            <button id="enroll-btn" type="submit">다음</button>
            </div>
            
        </form>

    </article>

</section>
<%@ include file="/views/common/footer.jsp" %> 

<script>
/* --------------------------------------------------------------------------------------- */
	var sitterId = $("#sitterId").val();
	var email= $("#email").val();
	var userName = $("#user_name").val();
	var birth = $("#user_birth_day").val();
	var certificateYN = $("#certificate").val(); //자격증 보유 여부
	var certiName=$("#certiName").val(); //자격증 이름
	var certiAgency=$("#certiAgency").val(); //자격증 발급 기관
	var certiday=$("#certiday").val(); //자격증 취득 일시
	var expiration = $("#expiration").val(); //자격증 만료 기간
	var liupload = $("#liupload").val(); //자격증 이미지
	console.log(birth);
	
	
	function idChck(){
		var checkId=/^[a-zA-Z0-9_\-]{4,12}$/;
		$("#sitterId").ready(function(){
			if(!checkId.test(userId.value)){
				alert("아이디를 다시 입력해주세요.");
				$("#sitterId").val("");
				$("#sitterId").focus("");
				return false;
			}
		})
	}
		//아이디 유효성 검사(대소문자,-,_, 4~12글자 인지 확인)
		/* var checkId=RegExp(/^[a-zA-Z0-9_\-]{4,12}$/);
		$(document).ready(function(){
			$(document).keyup(function(){
				if(!checkId.test($("#user_id").val())){
					alert("아이디를 다시 입력해주세요.");
					$("#user_id").val("");
					$("#user_id").focus("");
					return false;
				}
			});
		}); */
		
		
		
		//패스워드 유효성 검사 (대소문자,특수문자 포함 8~15자리 인지 확인)
		var regPw=/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*]).*$/
		//패스워드, 패스워드 확인 일치하는지 확인(div영역에 메세지 출력)
		$(document).ready(function(){
			if(regPw.test($("#password").val())!=regPw.test($("#pwck").val())){
				alert("비밀번호가 일치하지 않습니다.")
			}else{
				$("#result").html("비밀번호가 일치합니다.");
			}
		});
		
		var pw = document.getElementById("password"); // 비밀번호
		var pwck = document.getElementById("pwck"); // 비밀번호 확인
		var span = document.getElementById("result"); // 메세지
		
		/* pw.onfocus= function() { span.innerHTML=''; } */
		
		//비밀번호가 일치하지 않을 시, 입력한 값이 전부 지워집니다.
		$("#password").change(function() {
			let idck = document.getElementById("sitterId");
			var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
			if(!reg.test(pw.value)) {
				span.innerHTML='비밀번호는 8자 이상! (숫자/영문자(대소)/특수문자 포함)';
				span.style.color= 'red';
				span.style.fontWeight='bolder';
				span.style.fontSize= '13px';
				span.style.visibility='visible';
				console.log("비밀번호 유효성 검사 값을 보여줘! 1 : "+reg.test(pw.value));
			}
			else {
				span.innerHTML='유효성 검사 확인 완료!';
				span.style.color= 'green';
				span.style.fontWeight='bolder';
				span.style.fontSize= '13px';
				span.style.visibility='visible';
				console.log("비밀번호 유효성 검사 값을 보여줘! 3 : "+reg.test(pw.value));
			}
		});
		
		 $("#pwck").change(function() {
			 var pwck = document.getElementById("pwck");
			 var pwckSpan = document.getElementById("resultPwck");
			 
	        if(pw.value==pwck.value && pw.value.trim()!='') {
	           pwckSpan.innerHTML='비밀번호가 일치합니다.';
	           pwckSpan.style.color='green';
	           pwckSpan.style.fontSize= '13px';
	           pwckSpan.style.fontWeight='bolder';
	           pwckSpan.style.visibility='visible';
	           
	           console.log(pwck.value);
	           console.log(typeof(pw.value));
	        }
	        else {
	           pwckSpan.innerHTML='비밀번호가 일치하지 않습니다.';
	           pwckSpan.style.color= 'red';
	           pwckSpan.style.fontSize= '13px';
	           pwckSpan.style.fontWeight= 'bolder';
	           pwckSpan.style.visibility='visible';
	           pw.value='';
	           pwck.value='';
	           pw.focus();
	           console.log(this);
	           console.log(pwck.value);
	        }
	     });
//-------------------------------------------------------	
	//자격증 유무에 따른 입력부분 활성 비활성
	$(document).ready(function(){
		$("input:radio[name=certificate]").click(function(){
			if($("input:radio[name=certificate]:checked").val()=='Y'){
				//자격증 유무 : 있음에 체크가 되어있다면
				$("input[name=certiName]").attr('disabled',false);
				$("input[name=certiAgency]").attr('disabled',false);
				$("input[name=certiday]").attr('disabled',false);
				$("input[name=expiration]").attr('disabled',false); 
				$("input[name=expireday]").attr('disabled',false);
				$("input[name=liupload]").attr('disabled',false);
				//활성화
			}else if($("input:radio[name=certificate]:checked").val()=='N'){
				//자격증 유무 : 없음에 체크가 되어있다면
				$("input[name=certiName]").attr('disabled',true);
				$("input[name=certiAgency]").attr('disabled',true);
				$("input[name=certiday]").attr('disabled',true);
				$("input[name=expiration]").attr('disabled',true); 
				$("input[name=expireday]").attr('disabled',true);
				$("input[name=liupload]").attr('disabled',true);
				//비활성화
			}
		});
	});
	
	
	//만료일시 유무에 따른 날짜 선택 활성 비활성 함수
	 $(document).ready(function(){
		$("input:radio[name=expiration]").click(function(){
	        if($("input:radio[name=expiration]:checked").val() == 'Y'){
	        	//만료일시 : 있음에  체크가 되었다면
	        	$("input[name=expireday]").attr('disabled',false);
	            // radio 버튼의 value 값이 1이라면 활성화
	 	
	        }else if($("input:radio[name=expiration]:checked").val() == 'N'){
	        	$("input[name=expireday]").attr('disabled',true);
	            // radio 버튼의 value 값이 0이라면 비활성화
	        }
	    });
	}); 
	
/*---------------------------------------------------------------*/	

	
	
	
	// 아이디가 입력되었는지 확인하는 함수
	function checkUserId(user_id) {
		if(!checkExistData(user_id, "아이디를")) {
			return false;
		}
		
		// 아이디 유효성 검사
		var idReg = /^[a-zA-z0-9]{5,12}$/g;
		if(!idReg.test(user_id)) {
			alert("아이디는 영문 대소문자와 숫자 5~12자리로 입력해야 한다.");
			form.user_id.value = ""; // 공백으로 초기화
			form.user_id.focus();
			return false;
		}
		return true; // 확인이 되었을 때
	}
	
	// 비밀번호가 입력되었는지 확인하는 함수
	// 비밀번호 만족 조건 3가지
	// 1. 영문 대/소문자와 숫자로 8~15자리 입력할 것
	// 2. 비밀번호 두 번 입력했을 때 두 번 다 일치할 것
	// 3. 아이디와 비밀번호는 불일치할 것
	/* function checkPassword(user_id, password, pwck) {
		if(!checkExistData(password, "비밀번호를 ")) {
			return false;
		}
		if(!checkExistData(pwck, "비밀번호 확인을 ")) {
			return false;
		}
		
		// 비밀번호 유효성 검사
		var pwReg = /^[a-zA-z0-9]{8,15}$/g;
		if(!pwReg.test(password)) {
			alert("비밀번호는 영문 대소문자와 숫자 8~15자리로 입력해야 합니다.");
			form.password.value="";
			form.password.focus();
			return false;
		}
		
		// 비밀번호와 비밀번호 확인이 일치하지 않다면?
		if(password != pwck) {
			alert("비밀번호가 일치하지 않습니다.");
			form.pwck.value="";
			form.pwck.focus();
			return false;
		}
		
		// 아이디와 비밀번호가 일치할 때
		if(user_id==password) {
			alert("아이디와 비밀번호는 일치할 수 없습니다.");
			form.password.value="";
			form.password.focus();
			form.pwck.value="";
			return false;
		}
		return true; // 확인이 완료되었을 때
	} */
	
	
	
	
	

	function checkEmail() {
		if(!checkExistData(email, "이메일을 ")) {
			return false;
		} 
		
		
		var emailReg = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/g;
		if(!emailReg.test(email)) {
			alert("이메일 형식이 올바르지 않습니다.");
			form.email.value="";
			form.email.focus();
			return false;
		}
		return true; // 확인이 완료되었을 때
	}
	
	
	
	/* --------------------------------------------------------------------------------------- */
	//아이디 중복확인 팝업창
	function duplicate() {	
		var sitterId=$("#sitterId").val();
		// 새 창을 띄워서 userId의 값을 비교하는 함수!
		var url = "<%=request.getContextPath()%>/SitterIdDuplicate?sitterId="+sitterId;
		var status = "height=420px, width=600px, top=200px, left=500px";
		window.open(url, "_blank", status);
	}
	
	// 휴대전화 중복확인 팝업창
	function duplicatePhone() {
		// 서블릿에 보낼 휴대번호값 불러오기
		var phone = $("#phone").val();
		
		// 새 창을 띄워서 phone의 값을 비교하는 함수!
		var url = "<%=request.getContextPath()%>/phoneDuplicate?phone="+phone;
		var status = "height=420px, width=600px, top=200px, left=500px";
		window.open(url, "_blank", status);
	}
	
	// 이메일 중복확인 팝업창
	function duplicateEmail() {
		// 서블릿에 보낼 이메일값 불러오기
		var email = document.getElementById("email").value; // input 태그 값 가져오기
		
		
		if( !(email==null || email.trim().length<4) ) {
			
			var url = "<%=request.getContextPath()%>/emailDuplicate?email="+email;
			var status = "height=420px, width=600px, top=200px, left=500px";
			window.open(url, "_blank", status);
		}
		else {
			alert("이메일 4글자 이상 입력하세요");
			$("#email").focus();
			return;
			
		}
		
	}
	
	/* --------------------------------------------------------------------------------------- */
	
	/* Daum 우편번호 로직 */
	function zip_code(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr ='';//
          

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("addressInput").value = extraAddr;
            
            } else {
                document.getElementById("addressInput").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postNum').value = data.zonecode;
            document.getElementById("streetAddress").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addressInput").focus();
        }
    }).open();	
}
	

</script>

