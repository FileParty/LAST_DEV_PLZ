<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
    
<%@ page import="com.petmily.user.model.vo.User"%>
<!-- īī�� �α��� API ���� -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- ���� �α��� API ���� -->
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="306171897820-rnu74sp5127hhcvfqqdd3qu06sc2n5d3.apps.googleusercontent.com">
<script src="https://apis.google.com/js/api:client.js"></script>
<%@ include file="/views/common/header.jsp" %>

<!-- ���� ������ CSS : �α��� -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/yskCss/loginForm.css">
<!-- ���� ������ Jquery ���� -->
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script> 
<script>
//���� �α���
var googleUser = {};
$(function(){
  gapi.load('auth2', function(){
	 console.log("123");
    // Retrieve the singleton for the GoogleAuth library and set up the client.
    auth2 = gapi.auth2.init({
      client_id: '306171897820-rnu74sp5127hhcvfqqdd3qu06sc2n5d3.apps.googleusercontent.com',
      cookiepolicy: 'single_host_origin',
      // Request scopes in addition to 'profile' and 'email'
      // scope: 'additional_scope'
    });
    console.log(document.getElementById('google'));
    attachSignin(document.getElementById('google'));
  });
});

function attachSignin(element) {
  console.log(element.id);
  auth2.attachClickHandler(element, {},
	    	function(googleUser){
			var profile = googleUser.getBasicProfile();
			location.replace('<%=request.getContextPath()%>/APIlogin.do?userEmail='+profile.getEmail());
			var auth2 = gapi.auth2.getAuthInstance();
		    auth2.signOut().then(function () {console.log("�α׾ƿ�����")});
		},function(error) {
	          alert(JSON.stringify(error, undefined, 2));
	      });
}
</script>
<section>

	<!-- �α��� Ÿ��Ʋ -->
     <p id="loginTitle">�α���</p>

     <!-- ù��° article : �α��� �� -->
     <article>
         <form id="loginForm" action="<%=request.getContextPath()%>/log-in.do" method="post" > 
             <table id="loginTB" >

                 <tr id="firstTr">
                     <td class="idForm" id="idTitle"> <p id="idTitle">���̵�</p> </td>
                     <td class="idForm"> 
                     	<input type="text" autofocus name="userId" id="userId" required placeholder="���̵� �Է�"  >
                     	<!-- value="loginUser.getUser_id()" -->
                   	 </td>
                     <td rowspan="2" id="login-td" class="idForm">
                         <button type="submit" name="login-btn" id="login-btn" onclick="log_in(); msg_div();">login</button>
                     </td>
                 </tr>

                 <tr>
                     <td class="pwForm" id="pwTitle"> ��й�ȣ </td>
                     <td class="pwForm"> 
                     	<input type="password" name="userPw" id="userPw" required placeholder="��й�ȣ �Է�" >
                     </td>
                 </tr>

             </table>

			
			<!-- ����� ��¿ �� ���� �κ� -->
			<%-- <% if((boolean)request.getAttribute("flag")==false) { %>
	             <!-- �޼����� : ���̵� Ȥ�� ��й�ȣ�� �߸� �Ǿ����ϴ�. -->
	           	 <p id="idpwMistake" style="display:block;">���̵� Ȥ�� ��й�ȣ�� �߸� �Ǿ����ϴ�.</p>
           	 <% } %> --%> 
           	 
           	 
             <br>
             
             <!-- idã��, pwã��, ȸ������ �±� -->
             <a id="first_find_enroll" class="find_enroll" href="javascript:void(0);" onclick="findId();">���̵� ã��</a>
             <a class="find_enroll" href="javascript:void(0);" onclick="findPw();">��й�ȣ ã��</a>
             <a class="find_enroll" href="javascript:void(0);" onclick="location.replace('<%=request.getContextPath()%>/join')">ȸ������</a>
             
         </form>
         
     </article>

     <!-- �α��� ���� sns�α��� ���� ���� ���� -->
     <div id="blank"></div>

     <!-- �ι�° article : sns �α���(API �ʿ�) -->
     <!-- ���� API�� ��� �ؾ� ���� ���� form �±� ���, div�θ� �����ص���! -->
     <!-- ���̽��� �α����� ���� �α��� ��ư�� ����ؾ߸� �� -->
     <article id="second-article">
         <div id="gSignInWrapper">
         	<div id="google" class="customGPlusSignIn SNS_BG">���۷� �α���</div>
         </div>
         <div id="kakao" class="SNS_BG kakao" onclick="kakaoLogin()">īī�������� �α���</div>
     </article>

</section>


<script>
	

	// īī���� �α���
	 Kakao.init('21457534dfe681cc96c51d32694dc5a9');
        // īī�� �α��� ��ư�� �����մϴ�.
        function kakaoLogin(){
        	
	        Kakao.Auth.loginForm({
	            success: function (res) {
	            	Kakao.API.request({
	                    url: '/v2/user/me',
	                    success: function(res) {
	                     console.log(res);
	                     var userID = res.id;      //������ īī���� ���� id
	                     var userEmail = res.kakao_account.email;   //������ �̸���
	                     var userNickName = res.properties.nickname; //������ ����� ����
	                     /* document.getElementById("profileID").value=userID;
	                     document.getElementById("profileEMAIL").value=userEmail;
	                     document.getElementById("profileNICKNAME").value=userNickName;
	                     document.getElementById("profileGENDER").value=gender;
	                     $("#profileImg").attr('src',userImg);  */
	                     console.log(userID);
	                     console.log(userEmail);
	                     console.log(userNickName);
	                     alert("�α��� ����");
	                     Kakao.Auth.logout();
	                     location.replace('<%=request.getContextPath()%>/APIlogin.do?userEmail='+userEmail);
	                    },
	                    fail: function(error) {
	                     alert(JSON.stringify(error));
	                    }
	                   });
	            	
	            },
	            fail: function (err) {
	                alert(JSON.stringify(err));
	            }
	        });
        }
        
        

	// ���̵� �Է��ϼ���. ��й�ȣ�� �Է��ϼ���. ��Ʈ
	function log_in() { 
		var userId = $("#userId").val();
		var userPw = $("#userPw").val();
		
		// ���̵��� ������ �����ϰ�, ���̵��� ���̰� 0�� ���� ��
		if(userId!=null && userId.trim().length==0) {
			alert('���̵� �Է��ϼ���.');
			$("#userId").focus();
			return false;
			
		}
		// ��й�ȣ�� ������ �����ϰ�, ��й�ȣ���� ���̰� 0�� ���� ��
		if(userPw.trim().length==0) {
			alert('��й�ȣ�� �Է��ϼ���.');
			$("#userPw").focus();
			return false;
		}
		return true;
		
	}

	
	// ���̵�ã��, ��й�ȣã�� ����(�˾�â)
	function findId() { // ���̵� ã��
		// �� â�� ����� userId�� ���� ���ϴ� �Լ�!
		var url = "<%=request.getContextPath()%>/idFind";
		var status = "height=420px, width=600px, top=200px, left=500px";
		window.open(url, "_blank", status);
	};
	
	function findPw() { // ��й�ȣ ã��
		var url = "<%=request.getContextPath()%>/pwFind";
		var status = "height=420px, width=600px, top=200px, left=500px";
		window.open(url, "_blank", status);
	}
	
	
	
</script>










<%@ include file="/views/common/footer.jsp" %>