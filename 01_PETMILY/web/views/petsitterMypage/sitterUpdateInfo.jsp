<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.petmily.user.model.vo.User,
com.petmily.user.model.vo.PetSitter2" %>


<%
	User u = (User)request.getAttribute("user");
	PetSitter2 pss=(PetSitter2)request.getAttribute("ps");
	String sitterId = ((User)session.getAttribute("loginUser")).getUserId();
%> 
<%@ include file="/views/common/header.jsp" %>
<style>
   *{   
       
        box-sizing: border-box;
        font-family: 'Noto Sans KR', sans-serif;
    }
    html, body,section {
          height: auto;
      }
    .col-9{
        height: 100%;
        /* overflow: hidden; */
    }
 
    .container{
        height: 100%;
        padding: 0;
        width: 1366px;
        margin : 0 auto;
        /* margin-left: auto;
        margin-right: auto; */
        /* border: 1px solid red; */
 
    }
    .top-div{
    	overflow: hidden;
    }
    .row{
        padding: 0;
        margin: 0;
    }
    .menu{
            width: 230px;
            /* border: 1px solid yellow; */
            margin-top: 150px;

        }
    #menu{
        width: 230px;
        /* position : fixed; */
    }
    ul{
        padding-inline-start:0;
    }
    .title{
        font-size: 14px;
    }
    .content{
        font-size: 12px;
        margin-bottom: 5px;
    }
        a:link { color: black; text-decoration: none;}
        a:visited { color: gray; text-decoration: none;}
        a:hover { color: black; text-decoration: underline;}
    .vl {   width: 1px;
            margin-top: 0px;
            border-left: 1px solid lightgrey;
            height: auto;
        }
    .breadcrumb .active {
        color: white;
    }
    .breadcrumb{

        background-color: #ffcc33;
        /* z-index: 500px !important; */
        /* position: fixed; */
        height: 40px;
        width: 600px;
        border-radius: 0%;
        margin-left:200px;
    }
    .breadcrumb-item{
        line-height: 16px;
        font-size: 12px;
    }
    hr{
            margin-left: 0;
            width: 10%;
        }
    table{
        border-radius: 5px;
        /* margin-left: 50px; */
        /* margin-top: 60px; */
        width:600px;
        
    }
    td{
         width: 100px;
        font-size: 12px;
        padding: 5px;
    }
    .second-td{
        text-align: left;
        color: gray;
        line-height: 40px
    }
    .third-td{
        text-align: right;
    }

    table{
        border-collapse: collapse;
       	padding-left: 300px;
        
    }

    td{
    
        border-top: 1px solid gray;
        border-bottom: 1px solid gray;
        
    }

    input{
        border-radius: 5px;
        border: 1px solid rgb(179, 179, 179);
        background-color: rgb(228, 228, 228);
        height: 30px;
        padding: 10px;
    }
    #intro{
        height: 200px;
    }
    #inner{
        margin-top: 10px;
        border-collapse: collapse;
        border-color: white;
        padding: 100px;
        background-color: lightgray;
        
    }
    #inner td{
        padding: 10px 10px;
        text-align: center;
        border: 1px solid white;
    }
    #inner tr{
        border: 1px solid white;
    }
    #line{
        width: 770px;
    }
    .sub-title{
        font-size: 13px;
        font-weight: 500;
    }

.btn2{
    margin-left: 3px;
    font-size: 12px;
    padding: 0;
    width: 20px;
    height: 20px;

}
.btn1{
/* border: 3px solid #ffcc3383;
background-color: #ffcc33; */
	font-size: 12px;
	width: 110px;
	height: 35px;
	border-radius: 20.5px;
 
}
.btn1:hover{
    color: white;
    background-color: #ffcc33;
}
button{
	font-size: 12px;
	color: #ffcc33;
	width: 100px;
	height: 30px;
	border-radius: 20.5px;
	border: solid 1px #ffcc33;
	background-color: white;
}

button:hover{
    color: white;
    background-color: #ffcc33;
}
label.custom-file-label::after{
    height: 28px;
}

.hr-line {
    height: 2px;
    color: #ffcc33;
    background-color: #ffcc33;
    border: none;
}

.duplicate{
        font-size: 12px;
        color: white;
        width: 80px;
        height: 30px;
        border-radius: 20.5px;
        border: solid 1px grey;
        background-color: grey;
    }

    .duplicate:hover{
    color: white;
    background-color: #ffcc33;
    border: solid 1px #ffcc33;
    }

    .subrow{

        border-bottom: 1px solid white;
    }
    .subrow2{
        
        border-top: 1px solid white;
        border-bottom: 1px solid white;
    }
    .subrow3{
        
        border-top: 1px solid white;
    }


</style>
</head>
<body>
<body>
    <section>
        <div class="container">
            <form action="<%=request.getContextPath()%>/sitter/updateEnd" method="post" onsubmit="return test();">
            <% if(pss!=null){%>
            <!-- form을 넘기기 위해 hidden 처리한 input을 만듦. -->
            <input type="hidden" id="userId" name="userId" value="<%= loginUser.getUserId() %>" >
            
            <div class="row">
            <%-- <%@ include file="/views/petsitterMypage/petSitterSideBar.jsp"  %> --%>
                <!-- 메뉴 영역 -->
             <div class="col-2 menu">
                    <div id="menu">
                        <ul type="none">
                            <li class="title"><a href="<%=request.getContextPath()%>/sitterInfo">회원정보</a></li>
                            <hr class="hr-line"/>
                            <li class="content"><a href="<%=request.getContextPath()%>/sitter/Update?userId=<%=loginUser.getUserId()%>"> - 회원정보 수정</a></li>
                            <li class="content"><a href="<%=request.getContextPath()%>/sitter/Delete?userId=<%=loginUser.getUserId()%>"> - 회원 탈퇴</a></li>
                            <li class="content"><a href=""> - 북마크</a></li>
                            <li class="content"><a href=""> - 작성 후기</a></li>
                            <br/>
        
                            <li class="title">펫 프로필</li>
                            <hr class="hr-line"/>
                            <li class="content"><a href=""> - 펫 프로필</a></li>
                            <br/>
                            
                            <li class="title">예약</li>
                            <hr class="hr-line"/>
                            <li class="content"><a href=""> - 요청한 예약</a></li>
                            <li class="content"><a href=""> - 진행중인 예약</a></li>
                            <li class="content"><a href=""> - 종료된 예약</a></li>
                            <li class="content"><a href=""> - 채팅</a></li>
                            <br/>
                            
                            <li class="title">결제</li>
                            <hr class="hr-line"/>
                            <li class="content"><a href=""> - 결제 내역</a></li>
                            <li class="content"><a href=""> - 추가 요금 내역</a></li>
                            <br/>
                            
                        </ul>
                    </div>
                </div> 
            <div class="vl">
            <div class="col-9" style="padding:0;">
                <div class="row top-div" style="height: 200px;overflow: hidden;">
                    <img class="top-img" style="width: 100%; margin-top: -230px;" src="https://images.unsplash.com/flagged/photo-1548245643-7b805f2f93d5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80">
                </div>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item">회원 정보</li>
                    <li class="breadcrumb-item active">회원 정보 수정</li>
                </ul>
                   <!-- 콘텐츠 영역 -->
                    <table style="margin-left: 200px;">
                    	<tr>  
                            <td class="sub-title">프로필 이미지</td> 
                            <td class="second-td"><%=pss.getSitterImg()%> </td>
                            <td class="third-td"><button type="button" onclick="toggle1();">수정하기</button></td>
                        </tr>
                        <div>
                        <tr class="row1" style="display: none;">
                            <td></td>
                            <td style="/* line-height:40px; */ padding-left:50px;"><input type="file" id="profileImg" name="profileImg" style="height:40px; width: 230px;"/> </td> 
                            <!-- <td><button class="duplicate" type="button" style="height:25px;">확인</button></td> -->
                            <p></p>
                        </tr>
                        </div>
                        <tr>
                            <td class="sub-title" style="width: 150px;">이름</td> 
                            <td colspan="2" class="second-td" style="width: 400px;"><%=pss.getSitterName()%></td>
                        </tr>
                        <tr>  
                            <td class="sub-title">이메일</td> 
                            <td class="second-td"><%= pss.getSitterEmail() %></td>
                            <td class="third-td"><button type="button" onclick="toggle2();">수정하기</button></td>
                        </tr>
                        <div>
                        <tr class="row2" style="display: none;">
                            <td></td>
                            <td style="line-height:40px; padding-left:50px;"><input type="email" id="email" name="email" style="height:25px; width: 230px;"/> </td> 
                            <td><button class="duplicate" type="button" style="height:25px;" onclick="duplicateEmail();">중복확인</button></td>
                            <p></p>
                        </tr>
                        </div>
                        <tr>
                        	<% String birthday = pss.getSitterBday();%>
                            <td class="sub-title">생년월일</td> 
                            <td colspan="2" class="second-td"><%=birthday.substring(0,11) %></td>
                        </tr>
                        <tr>
                            <td class="sub-title">성별</td> 
                            <td colspan="2" class="second-td"><%= pss.getSitterGender() %></td>
                        </tr>
                         <tr>
                            <td class="sub-title">휴대폰 번호</td> 
                            <td class="second-td"><%= pss.getSitterPhone() %></td>
                            <td class="third-td"><button type="button" onclick="toggle3();">수정하기</button></td>
                        </tr>
                        <tr class="row3" style="display: none;">
                            <td></td>
                            <td style="line-height:40px; padding-left:50px;"><input type="text" id="phone" name="phone" style="height:25px; width: 230px;"/> </td> 
                            <td><button class="duplicate" type="button" style="height:25px;" onclick="duplicatePhone();">중복확인</button></td>
                            <p></p>
                        </tr>
                        <tr>
                            <td class="sub-title">주소</td> 
                            <td class="second-td"> <%=pss.getPostCode()%> <%=pss.getSitterAddress()%> <%=pss.getAddressDetail() %> </td>
                            <td class="third-td"><button type="button" onclick="toggle4();">수정하기</button></td>
                        </tr>
                        <tr class="row4" style="display: none; border:1px solid white">
                            <td class="subrow"></td>
                            <td colspan = "2" class="subrow"style= "padding-left:50px;" >
                                <input style="line-height: 40px;" type="text" id="postNum" name="postNum" value="<%=pss.getPostCode() %>" placeholder="우편번호">&nbsp;&nbsp;&nbsp;<button class="duplicate" type="button" style="height:25px; width: 100px; " onclick="zip_code();" >우편번호 찾기</button></td> 
                            <!-- <td class="subrow" ></td> -->
                        </tr>
                        <tr class="row4" style="display: none;">
                            <td class="subrow2"></td>
                            <td class="subrow2" style= "padding-left:50px;">
                                <input style="line-height: 40px; width: 250px;" id="streetAddress" name="address" type="text" value="<%=pss.getSitterAddress() %>" placeholder="도로명주소"/>
                            </td>
                            <td class="subrow2"></td>
                        </tr>
                        <tr class="row4" style="display: none;">
                            <td class="subrow3"></td>
                            <td class="subrow3" style = "padding-left:50px; padding-bottom: 10px;">
                                <input style="line-height: 40px; width: 250px;" id="addressInput" name="detail" type="text" value="<%=pss.getAddressDetail() %>"  placeholder="상세주소 입력"/>
                            </td>
                            <td class="subrow3"></td>
                        </tr>
                        <tr>
                            <td class="sub-title">정산 계좌 등록</td> 
                            <td class="second-td"><%=pss.getBankName()%> <%=pss.getAccountNo()%>  <%= pss.getAccountOwner()%>  </td>                
                            <td class="third-td"><button type="button" onclick="toggle5();">수정하기</button></td>    
                        </tr>
                        <tr class="row5" style="display: none;">
                            <td class="subrow2"></td>
                            <td class="subrow2" style= "padding-left:50px;">
                                <select style="line-height: 40px; width: 250px;" id="bankName" name="bankName" type="text" placeholder="은행이름">
					     
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
                            <td class="subrow2"></td>
                        </tr>
                        <tr class="row5" style="display: none;">
                            <td class="subrow2"></td>
                            <td class="subrow2" style = "padding-left:50px;">
                                <input style="line-height: 40px; width: 250px;" id="accountNo" name="accountNo" type="text" placeholder="계좌 번호"/>
                            </td>
                            <td class="subrow2"></td>
                        </tr>
                        <tr class="row5" style="display: none;">
                            <td class="subrow3"></td>
                            <td class="subrow3" style = "padding-left:50px; padding-bottom: 10px;">
                                <input style="line-height: 40px; width: 250px;" id="accountName" name="accountName" type="text" placeholder="예금주 이름"/>
                            </td>
                            <td class="subrow3"></td>
                        </tr>
                        <tr>
                            <td class="sub-title">비밀번호</td> 
                            <td class="second-td">비공개</td>
                            <td class="third-td"><button type="button" onclick="toggle6();">수정하기</button></td>    
                        </tr>
                        <tr class="row6" style="display: none;">
                            <td class="subrow2"></td>
                            <td class="subrow2" style= "padding-left:50px;">
                                <input style="line-height: 40px; width: 250px;" id="nowpw" name="nowpw" type="password" placeholder="현재 비밀번호"/>
                            </td>
                            <td class="subrow2"></td>
                        </tr>
                        <tr class="row6" style="display: none;">
                            <td class="subrow2"></td>
                            <td class="subrow2" style = "padding-left:50px;">
                                <input style="line-height: 40px; width: 250px;" id="newpw" name="newpw" type="password" placeholder="새 비밀번호"/>
                            </td>
                            <td class="subrow2"></td>
                        </tr>
                        <tr class="row6" style="display: none;">
                            <td class="subrow3"></td>
                            <td class="subrow3" style = "padding-left:50px; padding-bottom: 10px;">
                                <input style="line-height: 40px; width: 250px;" id="pwck" name="pwck" type="password" placeholder="새 비밀번호 확인"/>
                            </td>
                            <td class="subrow3"></td>
                        </tr>
                                         
                      
                        </table>
                        <br/>
                        <br/>
                        <div>
                        <button style="display:flex; /* margin-right: auto; */ margin-left: 450px; color:white; border: solid 1px black; padding-left:33px; background-color :black; text-align: center;" type="submit">수정</button>
                        </div>
                        <br/>
                        <br/>

                    </div>
                </div>
            </div>
            <%} %>
        </form>
        </div>
    </section>
   <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
   
   
</body>
<%@ include file="/views/common/footer.jsp" %> 
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

// 토글 버튼
    
function toggle1(){ //on/off하나의 버튼으로 가능.

    $('.row1').slideToggle(100); //시간 부여
    
}

function toggle2(){ //on/off하나의 버튼으로 가능.
 
    $('.row2').slideToggle(100); //시간 부여
    };

function toggle3(){ //on/off하나의 버튼으로 가능.

    $('.row3').slideToggle(100); //시간 부여
    };

function toggle4(){ //on/off하나의 버튼으로 가능.

$('.row4').slideToggle(100); //시간 부여
};

function toggle5(){ //on/off하나의 버튼으로 가능.

	$('.row5').slideToggle(100); //시간 부여
	};
	
function toggle6(){ //on/off하나의 버튼으로 가능.

	$('.row6').slideToggle(100); //시간 부여
	};	

	// 이메일 중복확인 팝업창
	function duplicateEmail() {
		// 서블릿에 보낼 이메일값 불러오기
		var email = document.getElementById("email").value; // input 태그 값 가져오기
		// var optionValue = $("#email option:selected").val(); // select 태그에서 선택된 option 값 가져오기
		// var emailId = emailInput+optionValue;
		
		if( !(email==null || email.trim().length<4) ) {
			// 새 창을 띄워서 emailInput, email의 값을 비교하는 함수!
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
	
	// 휴대전화 중복확인 팝업창
	function duplicatePhone() {
		// 서블릿에 보낼 휴대번호값 불러오기
		var phone = $("#phone").val();
		
		// 새 창을 띄워서 phone의 값을 비교하는 함수!
		var url = "<%=request.getContextPath()%>/phoneDuplicate?phone="+phone;
		var status = "height=420px, width=600px, top=200px, left=500px";
		
		/* 유효성검사에 맞게 틀린 값을 입력했을 때 팝업창이 띄워지지 않게 설정한다. */
		/* if(phone.length<11 && phone.length>11 && phone.value==" "){ // 휴대번호 숫자가 11개가 아니면 팝업창을 띄우지 않는다.
			return;
		} */
		window.open(url, "_blank", status);
	}


                 
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
