<%@page import="java.util.Date"%>
<%@page import="com.petmily.common.filter.LoginUserFilter"%>
<%@page import="java.util.ArrayList"%>
<%@page import=" com.petmily.reservation.model.vo.ReservationPetCode"%>
<%@page import=" com.petmily.reservation.model.vo.PetReservation"%>
<%@page import="javafx.geometry.Pos"%>
<%@page import=" com.petmily.pet.model.vo.PetInfo"%>
<%@page import=" com.petmily.review.model.vo.ReviewPetSitter"%>
<%@page import=" com.petmily.board.model.vo.boardImg"%>
<%@page import=" com.petmily.petsitter.model.vo.PetSitterCertificate"%>
<%@page import=" com.petmily.board.model.vo.PlusOptionService"%>
<%@page import="java.util.List"%>
<%@page import="com.petmily.user.model.vo.User"%>
<%@page import=" com.petmily.petsitter.model.vo.PetSitter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
      pageEncoding="UTF-8"%>

<%@ page import="com.petmily.board.model.vo.PetSitterBoard" %>
      
<%@include file="/views/common/header.jsp" %>
      
<%

	/* String bFlag = ""; */
	String userId = (String)request.getAttribute("userId");
	List<String> dsList = (List)request.getAttribute("dsList");
	PetSitterBoard boardT = (PetSitterBoard)request.getAttribute("boardT");
	boolean certificateFlag = (boolean)request.getAttribute("certificateFlag");
	PetSitter sitterT = (PetSitter)request.getAttribute("sitterT");
	User userT = (User)request.getAttribute("userInfoT");
	List<PlusOptionService> pOServiceList = (List)request.getAttribute("pOServiceList");
	List<PetSitterCertificate> certificateT = (List)request.getAttribute("certificateT");
	List<String> BoardImgs = (List)request.getAttribute("boardImgs");
	boolean bookmarkFlag = (boolean)request.getAttribute("bookmark");
	List<ReviewPetSitter> reviews = (List)request.getAttribute("reviews");
	List<PetInfo> petsInfos = (List)request.getAttribute("petsInfo");
	PetReservation reservation = new PetReservation();
	List<ReservationPetCode> rPetCodeT = new ArrayList<ReservationPetCode>();
	User uInfoT = (User)request.getAttribute("uInfoT");
	List<String> scheduleT = (List)request.getAttribute("scheduleT");
	
	int count = 0;
	int countBath=0;
	int dogC = 0;
	boolean oldDog = false;
	boolean receipt = false;
	
	
	/* ---- 슬기 ↓ 연관 jsp : userInfo.jsp */
	
	String pstId = request.getParameter("PetsitterId");
	

%>


<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=21457534dfe681cc96c51d32694dc5a9&libraries=services"></script>

<link href="<%=request.getContextPath() %>/css/PST.css" rel="stylesheet">



    <section>
    

    
    <input type="hidden" name="sitterId" value="<%=sitterT.getPetSitterId()%>">
    <input type="hidden" name="boardCode" value="<%=boardT.getBoardNo()%>">


    
    <div class="row no-gutters" id="main_img">
    
    	<%if(BoardImgs.size()==1) {%>


            <div class="col-lg-12" style="height: 100%;">

                <div style="width: 100%; height: 100%; overflow: hidden;">

                    <img onclick="main_img_view();" src="<%=request.getContextPath()%>/img/boardMain/<%=BoardImgs.get(0) %>" alt="" width="100%">

                </div>

            </div>

		<%} else if(BoardImgs.size()==2) {%>
		
			<div class="col-lg-8" style="height: 100%;">

                <div style="width: 100%; height: 100%; overflow: hidden;">

                    <img onclick="main_img_view();" src="<%=request.getContextPath()%>/img/boardMain/<%=BoardImgs.get(0) %>" alt="" width="100%">

                </div>

            </div>
		
			<div class="col-lg-4" style="height: 100%;">
                <div style="width: 100%; height: 100%; overflow: hidden;">
              
                   	<img onclick="main_img_view();" src="<%=request.getContextPath()%>/img/boardMain/<%=BoardImgs.get(1) %>" alt="" width="100%">
                   
                </div>
			</div>
		
		<%} else if(BoardImgs.size()>2) {%>
		
			<div class="col-lg-8" style="height: 100%;">

                <div style="width: 100%; height: 100%; overflow: hidden;">

                    <img onclick="main_img_view();" src="<%=request.getContextPath()%>/img/boardMain/<%=BoardImgs.get(0) %>" alt="" width="100%">

                </div>

            </div>
		
			<div class="col-lg-4" style="height: 100%;">
                <div style="width: 100%; height: 50%; overflow: hidden;">
              
                   	<img onclick="main_img_view();" src="<%=request.getContextPath()%>/img/boardMain/<%=BoardImgs.get(1) %>" alt="" width="100%">
                   
                </div>
                
      			<div style="width: 100%; height: 50%; overflow: hidden;">

                    	<img onclick="main_img_view();" src="<%=request.getContextPath()%>/img/boardMain/<%=BoardImgs.get(2) %>" alt="" width="100%">
					
                </div>
			</div>
		
		<%} %>

        </div>

        <div style="height: 10px;"></div>

        <div class="row" id="main_content">

            <div class="col-lg-6 main_content_01">
            
            	<%if(userId=="null") {%>
            		<img id="bookmark" src="<%=request.getContextPath()%>/img/bookmark/icons8-bookmark-off.png" alt=""
	                width="50px" height="50px">
            	<%}else{ %>
					<%if(!bookmarkFlag){%>
		                <img id="bookmark" onclick="bookmark();"src="<%=request.getContextPath()%>/img/bookmark/icons8-bookmark-off.png" alt=""
		                width="50px" height="50px">
	                <%} else{%>
	                <img id="bookmark" onclick="bookmark();"src="<%=request.getContextPath()%>/img/bookmark/icons8-bookmark-on.png" alt=""
		                width="50px" height="50px">
	               	<% }%>
	               	
               	<%} %>
	               	
                <p style="display: inline;margin-left: 50px; font-size:24px; vertical-align: middle;"><%=boardT.getBoardTitle() %></p>


            </div>

            <div class="col-lg-6 main_content_01">

				
                <button id="bline_process" class="btn btn-secondary button_radius" style="margin-left: 70%;">블라인드 처리</button>

            </div>

			<div class="col-lg-6 main_content_02" >
                <div id="main_content_02_info" class="row no-gutters" style="width:100%; height:100%">
                
                	<div class="col-lg-4" style="width:120px; height:120px">
                	
	                	<div id="profile">
	                		<%if(sitterT.getPetSitterImg()!=null){%>
	                			<img src="<%=request.getContextPath() %>/img/profile/<%=sitterT.getPetSitterImg() %>" alt=""
	                        	width="100%" height="100%">
	                        <%}else{ %>
	                        	<img src="<%=request.getContextPath() %>/img/profile/default.jpg" alt=""
	                        	width="100%" height="100%">
	                        <%} %>
                        </div>
                	
                	</div>
                	
                	<div class="col-lg-8" style="height: 100%;">
                	
                		<table style="width:250px; height:50%; margin-left: 50%;transform: translateX(-50%); margin-top: 50px;">
                            <tr>
                            	<%if(certificateFlag) {%>
	                                <td><h4 style="color:navy">프로 펫시터</h4></td>
	                                <td> <%=userT.getUserName().substring(0,1)%>*<%=userT.getUserName().substring(2)%> 펫시터</td>
                                <%} else{%>
                                	<td colspan="2"><%=userT.getUserName().substring(0,1)%>*<%=userT.getUserName().substring(2)%></td>
                                <%} %>
                                
                            </tr>
                            <tr>
                                <td colspan="2"><%=userT.getAddress() %></td>
                            </tr>
                        </table>
                	
                	</div>
                
                </div>
            </div>

            <div class="col-lg-6 main_content_02">

                <div id="main_content_02_calendar">

                    <p class="sub_title">예약 가능 날짜 / 회색처리: 예약 불가</p>


					    <table id="calendar" border="none" align="center" style="width:100%">
					    <tr><!-- label은 마우스로 클릭을 편하게 해줌 -->
					        <td><label onclick="prevCalendar()"><</label></td>
					        <td align="center" id="tbCalendarYM" colspan="5">
					        yyyy년 m월</td>
					        <td><label onclick="nextCalendar()">>
					            
					        </label></td>
					    </tr>
					    <tr>
					        <td align="center"><font color ="#F79DC2">일</td>
					        <td align="center">월</td>
					        <td align="center">화</td>
					        <td align="center">수</td>
					        <td align="center">목</td>
					        <td align="center">금</td>
					        <td align="center"><font color ="skyblue">토</td>
					    </tr> 
					</table>
					
					<style>
					
					#calendar td{
		width: 50px;
		height: 15px;
		text-align: center;
		font-size: 15px;
		font-family: 굴림;
		border:2px border-color:#3333FF;
		border-radius: 8px;/*모서리 둥글게*/
}
					</style>

                </div>
                
            </div>

            <div class="row col-lg-12 no-gutters" style="height: 30px; margin-top: 30px;">

                <div class="col-lg-6 no-gutters main_content_03">

                    <button onclick="info();">
                        <p class="sub_title">펫시터 정보</p>
                    </button>

                </div>

                <div class="col-lg-6 no-gutters main_content_03">

                    <button onclick="review();">
                        <p class="sub_title">후기</p>
                    </button>

                </div>

            </div>


            <div class="col-lg-6 main_content_04 info" style="border-right: 1px solid black;">

                <div class="main_content_04_sub">

                    <p class="sub_title"><%=userT.getUserName().substring(0,1)%>*<%=userT.getUserName().substring(2)%> 펫 시터 님을 소개합니다.</p>                    
                    <div class="write_space" style=""overflow:hidden; word-break:break-all"><%=boardT.getBoardInfo() %></div>

					<%if(certificateFlag){%>
                    	<p class="sub_title">자격증 및 교육 수료</p>

	                    <table id="certificate">
	
	                        <tr>
	                            <td rowspan="3"><img src="<%=request.getContextPath() %>/img/certificate/<%=certificateT.get(0).getCertificateFilename()%>" width="200px" height="130px;"></td>
	                            <td><%=certificateT.get(0).getCertificateName() %></td>                            
	                        </tr>
	
	                        <tr>                            
	                            <td><%=certificateT.get(0).getCertificationNmae() %>에서 발급</td>
	                        </tr>
	
	                        <tr>
	                            <td><%=certificateT.get(0).getDateOfAcquisition() %> 발급</td>
	                        </tr>
	
	
	                    </table>
					<%}else{ %>
                    	<p class="sub_title">자격증 및 교육 수료</p>
                    	<table id="certificate" >
	
	                        <tr>                            
	                            <td><h4 style="margin-top: 30px; text-align:center;">해당 사항이 없습니다.</h4></td>
	                        </tr>
	
	                    </table>
                    <%} %>
                    

                </div>

            </div>

            <div class="col-lg-6 main_content_04 info" style="margin-bottom:100px;">

                <div class="main_content_04_sub">

                    <p class="sub_title">이용 요금</p>

                    <table id="price">
                        <tr>
                            <th>반려 동물 유형</th>
                            <th>1박 케어</th>
                        </tr>
                        <tr>
                            <td>소형견</td>
                            <td><%=boardT.getSmallPrice() %>원</td>
                        </tr>
                        <tr>
                            <td>중형견</td>
                            <td><%=boardT.getMiddlePrice() %>원</td>
                        </tr>
                        <tr>
                            <td>대형견</td>
                            <td><%=boardT.getBigPrice() %>원</td>
                        </tr>
                    </table>
                    
                    <table id="price_discription">
                        <tr>
                            <td>반려동물추가비</td>
                            <td style="text-align: right;">10,000원 할인</td>
                        </tr>
                        <tr><td></td></tr>
                        <tr><td></td></tr>
                        <tr><td></td></tr>
                        <tr>
                            <td>공휴일 연휴 할증비</td>
                            <td style="text-align: right;">기본 요금에서 10,000원 할증</td>
                        </tr>
                    </table>

                    <table id="location">
                        <tr>
                            <td style="text-align: center;"><p class="sub_title">펫시터 위치</p></td>
                            <td rowspan="2" style="text-align: right;"><div id="map_container" style="margin-left:10px; width:280px; height:100px;"></div></td>
                            <!-- <td rowspan="2" style="text-align: right;"><img src="https://www.hanchao.com/company/kr/img/map_img01.jpg" width="200px" height="100px"></td> -->
                        </tr>
                        <tr>
                            <td style="text-align: center;"><%=boardT.getBoardAddress() %><br><%=boardT.getBoardAddressContent() %></td>
                        </tr>
                    </table>

                </div>

            </div>
        

            <div class="col-lg-12 info"><p class="sub_title">기본 제공 서비스</p></div>
            <div class="col-lg-1 info"></div>

            <div class="row col-lg-10 info" id="default_service">

                

                    
                <!-- <table style="display: inline;">
                    
                    <tr>
                        <td rowspan="2">

                            <img style="vertical-align: middle;" src="https://cdns.iconmonstr.com/wp-content/assets/preview/2017/240/iconmonstr-medical-11.png" width="40px" height="30px" style="margin-top: 20px">

                        </td>
                        <td>실내 놀이</td>
                    </tr>

                    <tr>
                        <td>터그놀이, 노즈워크 등</td>
                    </tr>

                </table> -->
                
                <div class="col-lg-1 info" ></div>

				<%for(String s : dsList){%>
	                <div class="service_sub col-lg-2">
	                    <table>
	
	                        <tr>
	                            <td>
	    							<%if(s.equals("실내놀이")) {%>
	                                	<img src="<%=request.getContextPath()%>/img/service/play.png" width="40px" height="30px">
	                                <%}else { //매일산책%>
	                                	<img src="<%=request.getContextPath()%>/img/service/walk.png" width="40px" height="30px">
	                                <%} %>
	    
	                            </td>
	                            <td style="text-align: right;"><%=s %></td>
	                        </tr>
	  
	    
	                    </table>
	                </div>
                <%} %>
                
                <div class="col-lg-1 info" ></div>
                
            </div>

            <div class="col-lg-1 info" ></div>


            <div class="col-lg-12 info"><p class="sub_title">이용 가능한 추가 옵션</p></div>
            <div class="col-lg-1 info"></div>

            <div class="row col-lg-10 info" id="add_service">
            
            	<div class="col-lg-1"></div>

				<%for(PlusOptionService pos : pOServiceList){%>
	                <div class="service_sub col-lg-2">
	                    <table>
	
	                        <tr>
	                            <td>
	    							<%if(pos.getPlusOptionType().equals("추가할인")){%>
	    								<img src="<%=request.getContextPath()%>/img/service/sale.png" width="40px" height="30px">
	    							<%} else if(pos.getPlusOptionType().equals("노견케어")){%>
	    								<img src="<%=request.getContextPath()%>/img/service/old.png" width="40px" height="30px">
	    							<%} else if(pos.getPlusOptionType().equals("목욕가능")){%>
	    								<img src="<%=request.getContextPath()%>/img/service/bath.png" width="40px" height="30px">
	    							<%} else if(pos.getPlusOptionType().equals("약물복용")){%>
	    								<img src="<%=request.getContextPath()%>/img/service/medicine.png" width="40px" height="30px">
	    							<%} else {//집앞픽업%>
	    								<img src="<%=request.getContextPath()%>/img/service/pickup.png" width="40px" height="30px">
	    							<%} %>
	                                
	    
	                            </td>
	                            <td style="text-align: right;"><%=pos.getPlusOptionType() %></td>
	                        </tr>
	                    </table>
	                </div>  
                <%} %>
                
                <div class="col-lg-1"></div>

            </div>

            <div class="col-lg-1 info"></div>

        </div>

        <div class="row" id="review_con" style="display:none;">
        <%for(ReviewPetSitter review : reviews) {%>    
            <div class="col-lg-1"></div>
            
            

            <div class="col-lg-10 row review">
                
                	<div class="col-lg-1"></div>
                
	                <div class="col-lg-11">
	
	                    <style>
	                        #review tbody{
	                            width:100%;
	                        }    
	                        #review td{
	                            width:300px;
	                        }
	                    </style>
	
	                    <table style="margin-top: 20px; width:100%; word-break:break-all">
	                        <tr>
	                        
	                        	<td>
	                        		<!-- userId 계정 탈퇴 시 다른 테이블에 해당 값 다 없애는거 설정바꿔야댐 -->
	                        		<%if(review.getUserId()!=null){%>
		                        		<%=review.getUserId().substring(0,4) %>****<br><%=review.getReviewDate() %>
		                        	<%} %>
	                        	</td>
	                        	
<%-- 	                        	<%if(userId.equals(sitterT.getPetSitterId())){%>
	                            	<td style="text-align: right;"><button id="bline_request" style="width:150px; height:30px; margin-bottom: 50px;">블라인드 요청</button></td>
	                            <%} else{%>
	                            	<td style="text-align: right;"><button id="bline_request" style="display:none; width:150px; height:30px; margin-bottom: 50px;">블라인드 요청</button></td>
	                            <%} %> --%>
	                            
	                        </tr>
	                        <tr>
	                            <td colspan="2"><%=review.getReviewText() %></td>
	                        </tr>
	                    </table>
	
	                </div>
	
					<%if(review.getReviewSend()!=null) {%>			
					
						<div class="col-lg-1"></div>			
						
		                <div class="col-lg-2" style="height: 200px;">
		
							<%if(sitterT.getPetSitterImg()==null){ %>
							
								<div class="review_profile" style="margin-left: auto;">
			                        <img src="<%=request.getContextPath() %>/img/profile/default.jpg" alt="" width="100%" height="100%">
			                    </div>
							
							<%}else{ %>
							
			                    <div class="review_profile" style="margin-left: auto;">
			                        <img src="<%=request.getContextPath() %>/img/profile/<%=sitterT.getPetSitterImg() %>" alt="" width="100%" height="100%">
			                    </div>
		                    
		   					<%} %>
		
		                </div>
		    
		                    
		                <div class="col-lg-9">
		
		                    <div style="overflow:hidden; width:100%; height: 100px; margin-top: 50px;"><%=review.getReviewSend()%></div>
		
		                </div>
		                
		                
		       		<%} else{%>
		       		
		                <%-- <div id="reply1_<%=review.getUserReviewNo()%>" class="col-lg-2" style="height: 200px; display:none">
		
		                    <div class="review_profile">
		                        <img src="<%=request.getContextPath() %>/img/profile/<%=sitterT.getPetSitterImg() %>" alt=""
		                        width="100%" height="100%">
		                    </div>
		
		                </div>
		    
		                    
		                <div id="reply2_<%=review.getUserReviewNo()%>" class="col-lg-10" style="display:none">
		
		                    <div id="reply_reCon_<%=review.getUserReviewNo() %>" style="border:1px solid gray; width:100%; height: 100px; margin-top: 50px;"><%=review.getReviewSend()%></div>
		
		                </div> --%>
		       		
		       			<%if(userId.equals(sitterT.getPetSitterId())) {%>
		       			
		       				<div class="col-lg-2"></div>
		                	
		                	<div id="replyIn1_<%=review.getUserReviewNo() %>" class="col-lg-8">
		                		<textarea id="reply_con_<%=review.getUserReviewNo()%>" cols="68" rows="4" style=" margin-top: 20px; margin-left: 20px;"></textarea>
		                	</div>
		                	
							<div id="replyIn2_<%=review.getUserReviewNo() %>" class="col-lg-2"><button id="reply_<%=review.getUserReviewNo() %>" style="margin-top: 20px;" onclick="replyUpdate('<%=review.getUserReviewNo()%>')">답글 입력</button></div>		                	
		                <%} %>
		       		
		       		<%} %>
	                
	                
	            </div>
	            
	
	            <div class="col-lg-1"></div>
	            <%} %>
	    	
        </div>
        
        <%if(userId!="null") {%>
        
	    <div class="row" id="section_end1" style="z-index:999;">
	        <div class="col-lg-10" style="height: 100%;">
	            
	        </div>
	
	        <div class="col-lg-2" style="height: 100%;">
	            <button id="reservation" class="btn btn-secondary button_radius" style="width: 150px; height: 60%; margin-top: 12.5px;">예약 하기</button>
	        </div>
	    </div>
	
	
	    <div class="row" id="section_end2">
	        <div class="col-lg-10" style="height: 100%;">
	            <div id="reservation_end_con" style="position: absolute; top:50%; transform: translateY(-50%); margin-left:30px;">날짜: ~~~~~~   소형견: 2 중형견: 0 대형견 0    추가옵션: 목욕, 약물복용, 등 합계금액: xxxx원</div>
	        </div>
	
	        <div class="col-lg-2" style="height: 100%;">
	             <button id="reservation_end" class="btn btn-secondary button_radius" style="width: 150px; height: 60%; margin-top: 12.5px;">예약 완료</button>
	        </div>
	 
	    </div>
	    <%}%>

    </section>






<%if(userId!="null"){ %>
    <div id="reservation_modal" class="modal">
 
        <!-- Modal content -->
        <div class="modal-content" style="width:30%">

            <table>
                <tr>
                    <td style="width: 70px"></td>
                    <td style="text-align: center;">예약하기</td>
                    <td><span class="close">&times;</span></td>
                </tr>
            </table>

            <hr>

            <br>

            <div>체크 인 - 체크 아웃</div>
            <hr>
            <!-- 달력 api 완성 이후 작업 -->
            <div><input name="checkIn" style="width:40%; margin-right: 12px; margin-left: 12px;" type="date" onchange="checkInC();" id="checkIn"> ~ <input name="checkOut" style="width:40%; margin-right: 12px; margin-left: 12px;" type="date" id="checkOut" onchange="checkOutC();"></div>
            
            <br>
            
            <table>
                <tr>
                    <td>반려견 선택</td>
                   	<%for(PlusOptionService pos: pOServiceList) {%>
	                    <%if(pos.getPlusOptionType().equals("노견케어")) {
	                    	oldDog = true;
	                    break;} %>
                    <%} %>
                    <%if(!oldDog){ %>
                    	<td style="text-align: right;">노견케어는 지원하지 않습니다.</td>
                    <%} %>
                </tr>
            </table>
            <hr style="margin-top: 1px;">
            <div class="row" style="height:100%; margin-left:50%; transform: translateX(-50%);">
            	<%for(PetInfo petInfo : petsInfos) {%>
                	<div class="col-md-6"><button onclick="petDisplay('<%=petInfo.getPetCode()%>','<%=petInfo.getPetWeight() %>');"; style=" margin-top: 10px; background-color:lightgray; width: 80%;margin-left: 50%;transform: translateX(-50%);"><%=petInfo.getPetName() %></button></div>
                	<%if(dogC%2==1) {%>
                		<div class="col-md-12" style="height:3px"></div>
                	<%} %>
                <%dogC++;} %>
            </div>
            
            <br>
            
            
            <!-- <div id="addS" style="width:100%; height:100%;"> -->
            
            <div style="display:none">추가 옵션 선택</div>
		    <hr>
		    
		    

			<%for(PetInfo petInfo : petsInfos) {%>
				<div id="<%=petInfo.getPetCode()%>" style="display :none;">
		            
		            <table style="width:100%">
		            	<%for(PlusOptionService pos : pOServiceList) {%>
		            		<%if(pos.getPlusOptionType().equals("목욕가능")){ %>
		            			<%if(petInfo.getPetWeight().equals("소형")) {%>
				            		<tr>
					                    <td>목욕 / <%=petInfo.getPetName() %></td>
					                    <td style="text-align: right; margin-right: 30px; "><%=pos.getSmallPrice() %>원 <input onclick="bath_con('<%=-petInfo.getPetCode() %>','<%=petInfo.getPetWeight() %>', 'bath_<%=petInfo.getPetCode() %>');" id="-<%=petInfo.getPetCode() %>" type="checkbox"></td>
					                </tr>
					                <tr id='bath_<%=petInfo.getPetCode() %>' style="display:none;">
					                	<td style='width:75%'>
					                		<input id="bath_text_<%=petInfo.getPetCode() %>" type='text' placeholder='ex)산책 후 목욕 부탁드립니다. 50자 이내' style='width:100%'>
					                	</td>
					                	<td style='text-align:right; width:25%'>
					                		<input type='number' id='path_<%=-petInfo.getPetCode() %>' onchange="bath_change();" minlength="0" placeholder='일 횟수' style='width:100%'>
					                	</td>
					                </tr>
					                <tr><td><br></td></tr>
					         	<%}else if(petInfo.getPetWeight().equals("중형")) {%>
					         		<tr>
					                    <td>목욕 / <%=petInfo.getPetName() %></td>
					                    <td style="text-align: right; margin-right: 30px; "><%=pos.getMiddlePrice() %>원 <input onclick="bath_con('<%=-petInfo.getPetCode() %>','<%=petInfo.getPetWeight() %>', 'bath_<%=petInfo.getPetCode() %>');" id="<%=-petInfo.getPetCode() %>" type="checkbox"></td>
					                </tr>
					                <tr id='bath_<%=petInfo.getPetCode() %>' style="display:none;">
					                	<td style='width:75%'>
					                		<input id="bath_text_<%=petInfo.getPetCode() %>" type='text' placeholder='ex)산책 후 목욕 부탁드립니다. 50자 이내' style='width:100%'>
					                	</td>
					                	<td style='text-align:right; width:25%'>
					                		<input type='number' id='path_<%=-petInfo.getPetCode() %>' onchange="bath_change();" minlength="0" placeholder='일 횟수' style='width:100%'>
					                	</td>
					                </tr>
					                <tr><td><br></td></tr>
					         	<%} else{ %>
					         		<tr>
					                    <td>목욕 / <%=petInfo.getPetName() %></td>
					                    <td style="text-align: right; margin-right: 30px; "><%=pos.getBigPrice() %>원 <input onclick="bath_con('<%=-petInfo.getPetCode() %>','<%=petInfo.getPetWeight() %>', 'bath_<%=petInfo.getPetCode() %>');" id="<%=-petInfo.getPetCode() %>" type="checkbox"></td>
					                </tr>
					                <tr id='bath_<%=petInfo.getPetCode() %>' style="display:none;">
					                	<td style='width:75%'>
					                		<input id="bath_text_<%=petInfo.getPetCode() %>" type='text' placeholder='ex)산책 후 목욕 부탁드립니다. 50자 이내' style='width:100%'>
					                	</td>
					                	<td style='text-align:right; width:25%'>
					                		<input type='number' id='path_<%=-petInfo.getPetCode() %>' onchange="bath_change();" minlength="0" placeholder='일 횟수' style='width:100%'>
					                	</td>
					                </tr>
					                <tr><td><br></td></tr>
					         	<%} %>
			                <%break;} %>
			                
			                
		            	<%} %>
		            	
	            	</table>
            	</div>
            <%} %>

            
            
            
            	<div style="height:100%">
            		<table style="width:100%">
		            	<%for(PlusOptionService pos : pOServiceList) {%>
		            		<%if(pos.getPlusOptionType().equals("약물복용")){ %>
			            		<tr id="medication1" style="display:none">
				                    <td>약물 복용</td>
				                    <td style="width: 294px; 
				                    text-align: right; margin-right: 30px;"><input onclick="medication_con();" id="Medication" type="checkbox"></td>
				                </tr>
				                <tr><td><br></td></tr>
			                <%break;} %>
		            	<%} %>		          
		            	
		            	      
		
 						<%for(PlusOptionService pos : pOServiceList) {%>
							<%if(pos.getPlusOptionType().equals("집앞픽업")){ %>
				                <tr id="pickup" style="display:none">
				                    <td style="width:30%;">집 앞 픽업</td>
				                    <td style="width:260px; text-align: right; margin-right: 30px;">편도 <%=pos.getOneWayPrice() %>원 왕복 <%=pos.getAllWayPrice() %>원 <input onclick="pickup_con();" type="checkbox"></td>
				                </tr>
				                <tr id="pickup2" style="display:none">
				                    <td colspan="2">펫 시터에게 갈 때 <input class="pickup" type="radio" name="move"> &nbsp;&nbsp;&nbsp;집으로 돌아 갈 때 <input class="pickup" type="radio" name="move">&nbsp;&nbsp;&nbsp; 왕복 <input class="pickup" type="radio" name="move"></td>
				                </tr>
				                <tr id="pickup3" style="display:none">
				                	<td><br></td>
				                </tr>
			                <%} %>
		                <%} %>
		            </table>
	            </div>
            
            <!-- </div> -->

            <div>추가 요청 및 문의 사항</div>
            <input id="plusQuestions" type="text" placeholder="300자 이내" style="width: 100%; line-height: 100px;">
            
            <br>

            <div><button onclick="receipt();" style="margin-left: 50%; transform: translateX(-50%);">영수증 확인</button></div>
            
            <hr class="receiptAfter" style="display:none;">

            <table id="receipt_con" style="display:none;">
                
                <tr id="weight_tr">
                    <td id="t_weight">대중소</td>
                    <td style="text-align: right;" id="p_weight">해당금액</td>
                </tr>
                <%for(PlusOptionService pos : pOServiceList) {%>
					<%if(pos.getPlusOptionType().equals("목욕가능")){ %>
		                <tr id="pos_bath" style="display:none"> <!-- display-cell -->
		                    <td id="t_bath">목욕</td>
		                    <td style="text-align: right;" id="p_bath">해당금액</td>
		                </tr>
                	<%} %>
                
	                <%if(pos.getPlusOptionType().equals("집앞픽업")){ %>
		                <tr id="pos_pickup" style="display:none">
		                    <td id="t_pickup">집앞픽업</td>
		                    <td style="text-align: right;" id="p_pickup">해당금액</td>
		                </tr>
		           	<%} %>
		           	
		           	<%if(pos.getPlusOptionType().equals("추가할인")){ %>
		                <tr id="pos_sale" style="display:none">
		                    <td id="t_sale">추가할인</td>
		                    <td style="text-align: right;" id="p_sale">해당금액</td>
		                </tr>
		           	<%} %>
                <%} %>
                
                <tr>
                    <!-- <td id="t_date">날짜</td> -->
                    <td colspan="2" style="text-align: center;" id="p_date">*?</td>
                </tr>
            </table>

            <hr class="receiptAfter" style="display:none;">

            <table id="receiptAfterT" id="receipt_total" style="display:none;">
                <tr>
                    <td>합계금액</td>
                    <td colspan="2" id="total_price" style="text-align: right;">해당금액</td>
                </tr>
            </table>

           
            <div class="receiptAfter" style="display:none;"><button style="margin-left: 50%; transform: translateX(-50%);" id="select_end">선택완료</button></div>
		
            
      </div>

    </div>
<%} %>

    <!-- The Modal -->
    <div id="bline_process_modal" class="modal">

        <!-- Modal content -->
        <div class="modal-content" style="height: 230px; margin-top: 15%; width:500px;">
            <table>
                <tr>
                    <td style="width: 70px"></td>
                    <td style="text-align: center;">블라인드 처리</td>
                    <td><span class="close">&times;</span></td>
                </tr>
            </table>

            <hr>

            <div class="row" style="height: 85px; margin-top:20px;">

                <div class="col-md-2"></div>
                <div class="col-md-8">사유<br>
                    <input id="bline_con" type="text" list="reason" style="width:110%" placeholder="사유 입력">
                    <datalist id="reason">
                        <option value="부적절한 게시글 기재"></option>
                        <option value="지속적으로 낮은 서비스 제공"></option>
                        <option value="기타"></option>
                    </datalist></div>                    
                <div class="col-md-2"></div>

            </div>

            <hr>

            <button onclick="bline_request_insert();" style="width:40%; margin-left: 50%; transform: translateX(-50%);">블라인드 처리</button>

        </div>

    </div>


    <!-- The Modal -->
    <div id="bline_request_modal" class="modal">

        <!-- Modal content -->
        <div class="modal-content" style="height: 230px; margin-top: 15%; width:500px;">
            <table>
                <tr>
                    <td style="width: 70px"></td>
                    <td style="text-align: center;">블라인드 요청</td>
                    <td><span class="close">&times;</span></td>
                </tr>
            </table>

            <hr>

            <div class="row" style="height: 85px; margin-top:20px;">

                <div class="col-md-2"></div>
                <div class="col-md-8">사유<br>
                    <input type="text" list="reason" style="width:110%" placeholder="사유 선택">
                    <datalist id="reason">
                        <option value="인신 공격 및 모욕"></option>
                        <option value="개인정보 유출"></option>
                        <option value="부적절한 내용"></option>
                        <option value="허위 사실 유포"></option>
                        <option value="기타"></option>
                    </datalist></div>                    
                <div class="col-md-2"></div>

            </div>

            <hr>

            <input type="button" value="블라인드 요청" style="width:40%; margin-left: 50%; transform: translateX(-50%);">

        </div>

    </div>

    <!-- The Modal -->
    <div id="reservation_end_modal" class="modal">

        <!-- Modal content -->
        <div class="modal-content" style="width: 30%;">
            <table>
                <tr>
                    <td style="width: 70px"></td>
                    <td style="text-align: center;">결제 수락 대기</td>
                    <td><span class="close">&times;</span></td>
                </tr>
            </table>

            <hr>

            <table style="text-align: center; margin-top: 70px;">
                <tr><td>총 결제 금액</td></tr>
                <tr><td id="re_end_price">xx0,000원</td></tr>
            </table>

            <hr style="margin-top: 75px">

            <div class="row no-gutters" id="end_modal">

                <div class="col-md-6"><button onclick="resulvation_cancel();">예약 취소</button></div>
                <div class="col-md-6"><button onclick="resulvation_complete()">결제 진행</button></div>

            </div>

        </div>

    </div>

        <!-- The Modal -->
        <div id="img_modal" class="modal" >

            <!-- Modal content -->
            <div class="modal-content" style="width: 100%; height: 100%; margin: 0 0;">


                <div class="row" style="height: 100%; margin-top:50px;">

                    
                    <div class="col-lg-2" style="height: 100%;">
                    
                        <svg onclick="front_img();" class="bi bi-chevron-left" width="70px" height="70px" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="margin-left:28px; margin-top:300px;"> 
                            <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 010 .708L5.707 8l5.647 5.646a.5.5 0 01-.708.708l-6-6a.5.5 0 010-.708l6-6a.5.5 0 01.708 0z" clip-rule="evenodd"/>
                        </svg>

                    </div>
                

                    
                    <div class="col-lg-8" style="height: 100%; margin-top: 60px">

                        <div style="width: 100%; height: 400px; ">
                            
                            <img id="modal_img" src="" width="100%" height="100%" >
                            
                        </div>

                        <div class="row no-gutters" style="height: 150px; margin-top: 50px; margin-left: 13px; margin-top:25px;">
                        
                            <div class="col-lg-12 row " style="height: 100%;">
                            
                            	<%for(String boardImg : BoardImgs) {%>
                            	
	                            		<%if(count==0) {%>
	                            			<div class="col-lg-3 modal_sub_img_none" style="height:100%; "><img id="firstImg" data-index="0" onclick="small_image();" class="modal_sub_img" src="<%=request.getContextPath()%>/img/boardMain/<%=boardImg%>" width="100%" height="100%"></div>
	                            		<%} else{%>
	                            			<div class="col-lg-3 modal_sub_img_none" style="height:100%" ><img data-index=<%=count+1 %> onclick="small_image();" class="modal_sub_img" src="<%=request.getContextPath()%>/img/boardMain/<%=boardImg%>" width="100%" height="100%"></div>
	                            		<%} %>
                            	<%} %>

                                <!-- <div class="col-lg-3 modal_sub_img_none" style="height:100%"><img id="firstImg" data-index="0" onclick="small_image();" class="modal_sub_img" src="https://d1cd60iwvuzqnn.cloudfront.net/page/fd37e21adee1436c8b9341758eafe5d5.jpg" width="100%" height="100%"></div>
                                <div class="col-lg-3 modal_sub_img_none" style="height:100%"><img data-index="1" onclick="small_image();" class="modal_sub_img" src="https://d1cd60iwvuzqnn.cloudfront.net/page/cc06070da695433f92721c1c7ec4f08d.jpg" width="100%" height="100%"></div>
                                <div class="col-lg-3 modal_sub_img_none" style="height:100%"><img data-index="2" onclick="small_image();" class="modal_sub_img" src="https://d1cd60iwvuzqnn.cloudfront.net/page/fdd7ce476cb1458c88e67ea1ac5873c4.jpg" width="100%" height="100%"></div>
                                <div class="col-lg-3 modal_sub_img_none" style="height:100%"><img data-index="3" onclick="small_image();" class="modal_sub_img" src="https://d1cd60iwvuzqnn.cloudfront.net/page/83cf124a05ca4b2aad158d95c0f4d577.jpg" width="100%" height="100%"></div>
                                <div class="col-lg-3 modal_sub_img_none" style="height:100%"><img data-index="4" onclick="small_image();" class="modal_sub_img" src="https://d1cd60iwvuzqnn.cloudfront.net/page/6feeb5a1ed5741b8b196a746e8ccf38f.jpg" width="100%" height="100%"></div>
                                <div class="col-lg-3 modal_sub_img_none" style="height:100%"><img data-index="5" onclick="small_image();" class="modal_sub_img" src="https://d1cd60iwvuzqnn.cloudfront.net/page/6e95dd0cb42e424691c11461f2d5c58c.jpg" width="100%" height="100%"></div>
                                <div class="col-lg-3 modal_sub_img_none" style="height:100%"><img data-index="6" onclick="small_image();" class="modal_sub_img" src="https://d1cd60iwvuzqnn.cloudfront.net/page/c5cd9b95324142e7b023a2f0ce3a121c.jpg" width="100%" height="100%"></div>
 -->
                            </div>
                        
                        </div>

                    </div>

                    <div class="col-lg-2" style="height: 100%;">

                        <span class="close" style="text-align: right; font-size: 60px; margin-top:50px;">
                            &times;
                        </span>

                        <svg onclick="end_img();" class="bi bi-chevron-right" width="70px" height="70px" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="margin-left:130px; margin-top:240px;">
                            <path fill-rule="evenodd" d="   M4.646 1.646a.5.5 0 01.708 0l6 6a.5.5 0 010 .708l-6 6a.5.5 0 01-.708-.708L10.293 8 4.646 2.354a.5.5 0 010-.708z" clip-rule="evenodd"/>
                        </svg>

                    </div>

                </div>
    
            </div>

    
        </div>
        
       
        

<script>

var flag = <%=bookmarkFlag%>;
var petWeightCodes = new Array();
var petWeights = new Array();
var big = 0;
var middle = 0;
var small = 0;

var b_big = 0;
var b_middle = 0;
var b_small = 0;


var weightCode = "";
var weightPrice = 0;
var bathCode = "";
var bathPrice = 0;
var pickupCode = "";
var pickupPrice = 0;
var pickup;
var petCodes = new Array();
var petSizes = new Array();
var petBaths = new Array();
var petBathTexts = new Array();
var s=0;
var m=0;
var b=0;

var posCount=0;







function bookmark(){
		
    	$.ajax({
    		type: "POST",
    		url: "<%=request.getContextPath()%>/BookmarkChange.do",
    		data: {"userId": "<%=request.getParameter("userId")%>", "sitterId": "<%=sitterT.getPetSitterId()%>", "bookmarkFlag": flag},
    		success: function(data){
    			flag = !flag;
    			
    		},
    		error: function(){
    			// jsp의 전역변수
    		}
    	});
    	
    	if(flag)
			event.target.src = "<%=request.getContextPath()%>/img/bookmark/icons8-bookmark-off.png";
		else
			event.target.src = "<%=request.getContextPath()%>/img/bookmark/icons8-bookmark-on.png";
}

bline_process.onclick = function() {
    bline_process_modal.style.display = "block";
    $('body').css("overflow", "hidden");
}

function petDisplay(petCode, weight){
	
	event.target.style.backgroundColor = "gray"; 
	
	if(document.getElementById(petCode).style.display=="block"){
		event.target.style.backgroundColor = "lightgray";
		var countBath=0;
		$("#" + petCode).attr("style", "display :none;");
		petWeightCodes.splice(petWeightCodes.indexOf(petCode), 1);
		if(weight=="소형")
			small--;
		else if(weight=="중형")
			middle--;
		else
			big--;
		<%if(userId!="null"){%>
	 		<%for(PetInfo petInfo : petsInfos){%>
				if(document.getElementById("<%=petInfo.getPetCode()%>").style.display=="block"){
					countBath++;
				}
			<%}%>
		<%}%>
		
		if(countBath==0){
			$("#addS").attr("style", "display :none;");
			$("#medication1").attr("style", "display :none");
			$("#pickup").attr("style", "display :none");
			$("#pickup3").attr("style", "display :none");
		}
		
		
		return;
	}
	
	if(weight=="소형")
		small++;
	else if(weight=="중형")
		middle++;
	else
		big++;
	
	petWeightCodes.push(petCode);
	
	
	
<%-- 	<%
		ReservationPetCode rPetCode = new ReservationPetCode();
		rPetCode.setPetCode(petInfo.getPetCode());
		rPetCode.setPetSize(petInfo.getPetWeight());
 	%> --%>
	
	
	$("#" + petCode).attr("style", "display :block; width:100%; height:100%;");
	
	
	$("#addS").attr("style", "display :table-row;");
	$("#medication1").attr("style", "display :table-row;");
	$("#pickup").attr("style", "display :table-row;");
	$("#pickup3").attr("style", "display :table-row;");
	
	
}



function bath_con(data, weight, id){
	/* var code = "<tr id='bath_content'><td style='width:80%'><input type='text' placeholder='ex)산책 후 목욕 부탁드립니다. 50자 이내' style='width:100%'></td><td style='text-align:right; width:20%'><input type='number' id='path_" + -data + "' placeholder='횟수' style='width:100%'></td></tr>";
	
	/* $("#" + data).parent().parent().after(code); */
	/* $("#" + data).parent().parent().after(code); */
	
	
	if(document.getElementById(data).checked==false){
		
		if(weight=="소형"){
			
		}
			/* console.log($("#path_" + -data).val()); */
			/* b_small--; */
			/* console.log($("#path_" + -data).val()); */
			/* console.log(document.getElementById("path_" + -data).innerHTML); */
		else if(weight=="중형")
			b_middle--;
		else
			b_big--;
		$("#" +id).attr("style", "display:none");
		return;
		
	}
	

	
	
	$("#" + id).attr("style", "display:table-row; width:100%;");
	
	if(weight=="소형")
		 b_small++;
	else if(weight=="중형")
		b_middle++;
	else
		b_big++;
	

	
}

function medication_con(){
	var code = "<tr id='medication_content'><td colspan='2'><input id='medication_con' style='width: 100%; type='text'; placeholder='ex) 포포에게 감기약(알약) 복용 부탁드립니다.'></td></tr>";

	$("#Medication").parent().parent().after(code);
	
	if(document.getElementById("Medication")!=null && document.getElementById("Medication").checked==false)
		$("tr").remove("#medication_content");
	
}

function receipt(){
	
	var temp_s = 0;
	var temp_m = 0;
	var temp_b = 0;
	
	if(document.getElementById("checkOut").value=="" || document.getElementById("checkIn").value==""){
    	alert("날짜를 지정해주세요");
    	return;
    }else if((big+middle+small)==0){
    	alert("반려견을 선택해주세요");
    	return;
    }
	
	if(document.getElementById("receipt_con").style.display=="table"){
		weightCode="";
		bathCode = "";
		pickupCode = "";
	}
	
	$("#receipt_con").attr("style", "display:table");
	$("#receipt_total").attr("style", "display:table");
	
	var receiptAfter = document.getElementsByClassName("receiptAfter");
	
	for(let i=0; i<receiptAfter.length; i++){
		receiptAfter[i].style.display="block";
	}
	document.getElementById("receiptAfterT").style.display="table";
	
	if(small>0)
		weightCode += "소형견 * " + small + " ";
	
	if(middle>0)
		weightCode += "중형견 * " + middle + " ";
	
	if(big>0)
		weightCode += "대형견 * " + big + " ";
	
	weightPrice = (<%=boardT.getBigPrice()%> * big) + (<%=boardT.getMiddlePrice()%> * middle) + (<%=boardT.getSmallPrice()%> * small);
	
	if(weightCode == ""){
		$("#weight_tr").attr("style", "display: none");
	}else{
		$("#weight_tr").attr("style", "display: table-row");
	}
	
	document.getElementById("t_weight").innerHTML = weightCode;
	document.getElementById("p_weight").innerHTML = numberWithCommas(weightPrice) + "원";
	
	<%if(petsInfos!=null){%>

		<%for(PlusOptionService pos : pOServiceList){%>
	
			<%if(pos.getPlusOptionType().equals("목욕가능")){%>
				<%for(PetInfo pet : petsInfos){%>
					if(document.getElementById("-<%=pet.getPetCode()%>").checked==true){
						if("<%=pet.getPetWeight()%>"=="소형"){
							temp_s += document.getElementById("path_-<%=pet.getPetCode()%>").value*1;
						}else if("<%=pet.getPetWeight()%>"=="중형"){
							temp_m += document.getElementById("path_-<%=pet.getPetCode()%>").value*1;
						}else{
							temp_b += document.getElementById("path_-<%=pet.getPetCode()%>").value*1;
						}
					}
				<%}%>
				bathPrice = (<%=pos.getBigPrice()%> * temp_b) + (<%=pos.getMiddlePrice()%> * temp_m) + (<%=pos.getSmallPrice()%> * temp_s);
				
			<%break;}%>
		
		<%}%>
	<%}%>
	
 	if(temp_s>0){
 		bathCode += "목욕(소) * " + temp_s + " ";
 		s = temp_s;
 	}
 	
	
	if(temp_m>0){
		bathCode += "목욕(중) * " + temp_m + " ";
		m = temp_m;
	}
	
	if(temp_b>0){
		bathCode += "목욕(대) * " + temp_b + " ";
		b = temp_b;
	}
	
	
	/* -petCode.checked==true => path_-petcode.value */
	
	if(bathCode!=""){
		document.getElementById("pos_bath").style.display = "table-row";
		document.getElementById("t_bath").innerHTML = bathCode;
	}
	
	if(bathPrice!=0){
		document.getElementById("p_bath").innerHTML = numberWithCommas(bathPrice) + "원";
	}
	
	
	<%for(PlusOptionService pos : pOServiceList){%>
	
		<%if(pos.getPlusOptionType().equals("집앞픽업")){%>
		
			if(document.getElementById("pickup2").style.display=="table-row"){
			
				if(document.getElementsByClassName("pickup")[0].checked==true){
					pickupPrice = <%=pos.getOneWayPrice()%>;
					pickupCode = "*편도";
					pickup="편도";
				}else if(document.getElementsByClassName("pickup")[1].checked==true){
					pickupPrice = <%=pos.getOneWayPrice()%>;
					pickupCode = "*편도";
					pickup="편도";
				}else if(document.getElementsByClassName("pickup")[2].checked==true){
					pickupPrice = <%=pos.getAllWayPrice()%>;
					pickupCode = "*왕복";
					pickup="왕복";
				}
			}
					
		<%break;}%>
	
	<%}%>
	
	if(pickupCode!=""){
		document.getElementById("t_pickup").innerHTML = "집앞픽업 " + pickupCode;
	}
	
	document.getElementById("p_date").innerHTML = document.getElementById("checkIn").value + " ~ " + document.getElementById("checkOut").value;
	
	if(pickupPrice!=0){
		$("#pos_pickup").attr("style", "display:table-row");
		document.getElementById("p_pickup").innerHTML = numberWithCommas(pickupPrice) + "원";
	}
	
	if((big+middle+small)>1){
		if(document.getElementById("pos_sale")!=null)
			document.getElementById("pos_sale").style.display = "table-row";
		if(document.getElementById("t_sale")!=null){
			document.getElementById("t_sale").innerHTML = "추가할인 * " + (big+middle+small-1);
			document.getElementById("p_sale").innerHTML = numberWithCommas(((big+middle+small)-1)*10000) + "원";
		}
	}
	
	document.getElementById("total_price").innerHTML = numberWithCommas(((weightPrice + pickupPrice + bathPrice-(((big+middle+small)-1)*10000)) * dateDiff(document.getElementById("checkOut").value, document.getElementById("checkIn").value))) + "원";
			
	
		
<%-- 	path_<%=petInfo.getPetCode()%>
	 --%>
	 
	<%-- <%rPetCodeT = new ArrayList<ReservationPetCode>();%> --%>
	 
<%--  	<%for(PetInfo petInfo : petsInfos) {%>
		if(document.getElementById('<%=petInfo.getPetCode()%>').style.display!='none'){
			<%ReservationPetCode rp = new ReservationPetCode();%>
			if(<%=petInfo.getPetWeight()%>.equals("소형")){
				b_small += (document.getElementById(path_<%=petInfo.getPetCode()%>));
				console.log(document.getElementById(path_<%=petInfo.getPetCode()%>));
			}else if(<%=petInfo.getPetWeight()%>.equals("중형"){
				
			}else{
			/* 이부분고치자 */	
			}
			<%rp.setPetCode(petInfo.getPetCode());%>
			<%rp.setPetSize(petInfo.getPetWeight());%>
			<%rp.setPetBath(petBath);%>
			<%rPetCodeT.add(rp);%>
		}
	
	<%}%> --%>
	
	
	
	

	

	
	
	
	
	
}

function pickup_con(){
	
	if(document.getElementById("pickup2").style.display=="table-row"){
		$("#pickup2").attr("style", "display :none;");	
		return;
	}
	
	$("#pickup2").attr("style", "display :table-row;");
	
}

<%if(userId!="null"){%>

select_end.onclick = function(){
    var select_end1 = document.getElementById("section_end1");
    var select_end2 = document.getElementById("section_end2");

        
    
    if(document.getElementById("checkOut").value=="" || document.getElementById("checkIn").value==""){
    	alert("날짜를 지정해주세요");
    	return;
    }else if((big+middle+small)==0){
    	alert("반려견을 선택해주세요");
    	return;
    }
    else if(!isNaN(((weightPrice + pickupPrice + bathPrice-(((big+middle+small)-1)*10000))    
    		* dateDiff(document.getElementById("checkOut").value, document.getElementById("checkIn").value)))){
	    $("#section_end2").attr("style", "display:flex; z-index:999;");
	    
	    reservation_modal.style.display = "none";
	    $('body').css("overflow", "scroll");
    }
    
    
    
    if(select_end1.display != "none")
        select_end1.style.display = "none";
    
    receipt();
    
    var payment_content = "날짜: " + document.getElementById("checkIn").value + " ~ " + document.getElementById("checkOut").value + " / 소형견: " + small + " 중형견: " + middle + " 대형견: " + big;
    
    	if(bathCode!= "" || pickupCode!= ""){
    		payment_content += " / 추가옵션: ";
    	}
    
    	if(bathCode!= ""){
    		if(s>0)
    			payment_content += " 목욕(소) * " + s;
    		if(m>0)
    			payment_content += " 목욕(중) * " + m;
    		if(b>0)
    			payment_content += " 목욕(대) * " + b;
    	}
    	if(pickupCode!= ""){
    		if(document.getElementsByClassName("pickup")[2].checked==true)
    			payment_content += " 픽업(왕복)";
    		if(document.getElementsByClassName("pickup")[2].checked==true)
    			payment_content += " 픽업(편도)";
    	}

   	payment_content += " / 합계금액: " + numberWithCommas(((weightPrice + pickupPrice + bathPrice-(((big+middle+small)-1)*10000)) * dateDiff(document.getElementById("checkOut").value, document.getElementById("checkIn").value))) + "원";

   	
   	
   	
    document.getElementById("reservation_end_con").innerHTML=payment_content;
    
    document.getElementById("re_end_price").innerHTML = numberWithCommas(((weightPrice + pickupPrice + bathPrice-(((big+middle+small)-1)*10000)) * dateDiff(document.getElementById("checkOut").value, document.getElementById("checkIn").value))) + "원";
}

<%}%>

function dateDiff(_date1, _date2) {
	
	var dateString1 = _date1;   
	var dateString2 = _date2;  
	  
	var dateArray1 = dateString1.split("-");
	var dateArray2 = dateString2.split("-");
	  
	var dateObj1 = new Date(dateArray1[0], Number(dateArray1[1])-1, dateArray1[2]);
	var dateObj2 = new Date(dateArray2[0], Number(dateArray2[1])-1, dateArray2[2]);  
	  
	var betweenDay = (dateObj1.getTime() - dateObj2.getTime())/1000/60/60/24;

	return betweenDay;
}

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}


function checkOutC(){
	if(dateDiff(document.getElementById("checkOut").value, document.getElementById("checkIn").value)<1){
		document.getElementById("checkOut").value = "";
	}
}

function checkInC(){
	
	if(dateDiff(document.getElementById("checkOut").value, document.getElementById("checkIn").value)<1){
		document.getElementById("checkIn").value = "";
	}
}

var reservation_end_close = document.getElementsByClassName("close")[3];

<%if(userId!="null"){%>
var price = ((weightPrice + pickupPrice + bathPrice-(((big+middle+small)-1)*10000)) * dateDiff(document.getElementById("checkOut").value, document.getElementById("checkIn").value));
<%} else{%>
var price = 0;
<%}%>



reservation_end_close.onclick = function() {
	
    reservation_end_modal.style.display = "none";
    $('body').css("overflow", "scroll");
 	
}

function resulvation_cancel(){
	
	reservation_end_modal.style.display = "none";
	$('body').css("overflow", "scroll");
	
}

function resulvation_complete(){
	
	
    reservation_end_modal.style.display = "none";
    $('body').css("overflow", "scroll");
    <%if(petsInfos!=null){%>
		<%for(PetInfo pet : petsInfos){%>
		
			if(document.getElementById("<%=pet.getPetCode()%>").style.display!="none"){
				petCodes.push(<%=pet.getPetCode()%>);
				petSizes.push("<%=pet.getPetWeight()%>");
				console.log("push 실행");
				
				if(document.getElementById("-<%=pet.getPetCode()%>")!=null && (document.getElementById("-<%=pet.getPetCode()%>").checked==true || (document.getElementById("path_-<%=pet.getPetCode()%>").value!=""))){
					if(document.getElementById("path_-<%=pet.getPetCode()%>").value>0){
						petBaths.push(document.getElementById("path_-<%=pet.getPetCode()%>").value);
					}else{
						petBaths.push(0);
					}
					if(document.getElementById("bath_text_<%=pet.getPetCode()%>").value.length>0){
						console.log(document.getElementById("bath_text_<%=pet.getPetCode()%>").value.length);
						console.log(document.getElementById("bath_text_<%=pet.getPetCode()%>").value);
						petBathTexts.push(document.getElementById("bath_text_<%=pet.getPetCode()%>").value);
					}
					else{
						petBathTexts.push("");
					}
				}else{
					petBaths.push(0);
					petBathTexts.push("");
				}
				
			}
			
		<%}%>
	<%}%>
	
	console.log(petBathTexts);
	
	if(document.getElementById('Medication')!=null){
		if(document.getElementById('Medication').checked==false){
			medicine = "";
		}else{
			medicine = document.getElementById('medication_con').value;
		}
	}else{
		medicine = "";
	}
	
	

	payment();
	

 
<%--  	$.ajax({
		type: "POST",
		url: "<%=request.getContextPath()%>/insertReservation.do",
		data: {"sitterId": "<%=sitterT.getPetSitterId()%>", "boardCode": <%=boardT.getBoardNo()%>,
			"checkIn": document.getElementById('checkIn').value, "checkOut": document.getElementById('checkOut').value,
			"plusQuestions": document.getElementById('plusQuestions').value, "price": ((weightPrice + pickupPrice + bathPrice-(((big+middle+small)-1)*10000)) * dateDiff(document.getElementById("checkOut").value, document.getElementById("checkIn").value)),
			"medicine": medicine, "pickup": pickup, "petBathTexts": petBathTexts,
			"petCodes": petCodes, "petSizes": petSizes, "petBaths": petBaths},
		success: function(data){
			
			if(data=="t"){
				alert("예약 성공");
				location.replace("<%=request.getContextPath()%>/user/request?userId=<%=userId%>");
			}else{
				alert("예약 실패");
			}
			
			
		},
		error: function(){
			// jsp의 전역변수
			petCodes = new Array();
			petSizes = new Array();
			petBaths = new Array();
			petBathTexts = new Array();
			
			alert("예약에 실패하였습니다");
			
	        reservation_end_modal.style.display = "none";
	        $('body').css("overflow", "scroll");
	        
	        $('#section_end1').attr("style", "display:flex");
	        $('#section_end2').attr("style", "display:none");
	        
	        
	        
		}
	}); --%>
 	
}

function replyUpdate(reviewNo){
	
	
	
 	$.ajax({
		type: "POST",
		url: "<%=request.getContextPath()%>/replyUpdate.do",
		data: {"reply_con": document.getElementById("reply_con_" + reviewNo).value,
				"review_no": reviewNo},
		success: function(data){
			
			if(data=="t"){
				
				
				
				$("#reply_"+reviewNo).parent().attr("style", "display:none");
				$("#reply_con_"+reviewNo).parent().attr("style", "display:none");
				
				/* $("#reply1_"+reviewNo).attr("style", "display:block");
				$("#reply2_"+reviewNo).attr("style", "display:block"); */
				
				let codeT = "";
				
				codeT += "<div class='col-lg-1'></div>";
					
				codeT += "<div class='col-lg-2' style='height: 200px;'>";
	
				<%if(sitterT.getPetSitterImg()==null){ %>
				
					codeT += "<div class='review_profile' style='margin-left: auto;'>";
					codeT += "<img src='<%=request.getContextPath() %>/img/profile/default.jpg' alt='' width='100%' height='100%'>";
					codeT += "</div>";
				
				<%}else{ %>
						
					codeT += "<div class='review_profile' style='margin-left: auto;'>";
					codeT += "<img src='<%=request.getContextPath() %>/img/profile/<%=sitterT.getPetSitterImg() %>' alt='' width='100%' height='100%'>";
					codeT += "</div>";
	                    
				<%} %>
	
				codeT += "</div>";	    
				codeT += "<div class='col-lg-9'>";	
				codeT += "<div style='overflow:hidden; width:100%; height: 100px; margin-top: 50px;'>" + document.getElementById("reply_con_" + reviewNo).value + "</div>";	
				codeT += "</div>"
					
				console.log($("#replyIn1_"+reviewNo).prev().prev());
				
				
				
				
	                
				$("#replyIn1_"+reviewNo).prev().prev().after(codeT);
				
				
				/* document.getElementById("reply_reCon_" + reviewNo).innerHTML = document.getElementById("reply_con_" + reviewNo).value; */
				

				
			}else{
				alert("답글입력에 실패하였습니다.");
			}
			
			
		},
		error: function(){
	        
			alert("답글입력에 실패하였습니다.");
	        
		}
		
	}); 
}

function bline_request_insert(){
	$.ajax({
		type: "POST",
		url: "<%=request.getContextPath()%>/blineRequestInsert.do",
		data: {"userId": "<%=userId%>", "boardCode": <%=boardT.getBoardNo()%>,
			"blineText": document.getElementById("bline_con").value},
		success: function(data){
			
			if(data=="t"){
				alert("블라인드 요청이 완료되었습니다.");
			}else if(data=="f"){
				alert("블라인드 요청이 실패하였습니다.");
			}else if(data=="c"){
				alert("이미 블라인드 요청한 글입니다.");
			}
			
		},
		error: function(){
			alert("블라인드 요청이 실패하였습니다.");
	        
		}
	});
	
	$("#bline_process_modal").attr("style", "display:none");
	$('body').css("overflow", "scroll");
	
} 

function bath_change(){
	if(event.target.value<0){
		alert("0이하의 수는 입력하실 수 없습니다");
		event.target.value = "";
	}
}

var reservation_modal = document.getElementById('reservation_modal');
var reservation = document.getElementById("reservation");
<%if(userId!="null"){%>
reservation.onclick = function() {
	<%if(petsInfos==null){%>
		alert("펫을 등록하셔야 사용할 수 있는 서비스입니다.");
		return;
	<%}%>
    reservation_modal.style.display = "block";
    $('body').css("overflow", "hidden");
}
<%}%>


function payment(){
	
	<%if(userId!="null"){%>
	
	var IMP = window.IMP; // 생략해도 괜찮습니다.
  	IMP.init("imp70587231"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
  	IMP.request_pay({ // param
  	    pg: "inicis",
  	    pay_method: "card",
  	    merchant_uid: 'petMily_' + new Date().getTime(),
  	    name: "결제테스트_펫시터예약(실제금액: "+((weightPrice + pickupPrice + bathPrice-(((big+middle+small)-1)*10000)) * dateDiff(document.getElementById("checkOut").value, document.getElementById("checkIn").value)) +")",
  	    amount: 100,
  	    buyer_email: "<%=uInfoT.getEmail()%>",
  	    buyer_name: "<%=uInfoT.getUserName()%>",
  	    buyer_tel: "<%=uInfoT.getPhone()%>",
  	    buyer_addr: "<%=uInfoT.getAddress()%>",
  	  }, function (rsp) { // callback
  	    if (rsp.success) {
  	        
	  	   	$.ajax({
	  			type: "POST",
	  			url: "<%=request.getContextPath()%>/insertReservation.do",
	  			data: {"sitterId": "<%=sitterT.getPetSitterId()%>", "boardCode": <%=boardT.getBoardNo()%>,
	  				"checkIn": document.getElementById('checkIn').value, "checkOut": document.getElementById('checkOut').value,
	  				"plusQuestions": document.getElementById('plusQuestions').value, "price": ((weightPrice + pickupPrice + bathPrice-(((big+middle+small)-1)*10000)) * dateDiff(document.getElementById("checkOut").value, document.getElementById("checkIn").value)),
	  				"medicine": medicine, "pickup": pickup, "petBathTexts": petBathTexts,
	  				"petCodes": petCodes, "petSizes": petSizes, "petBaths": petBaths},
	  			success: function(data){
	  				
	  				if(data=="t"){
	  					alert("결제가 완료되었습니다.");
	  					location.replace("<%=request.getContextPath()%>/user/request?userId=<%=userId%>");
	  				}else{
	  					alert("결제 중 오류가 발생하였습니다. 관리자에게 문의하세요");
	  				}
	  				
	  				
	  			},
	  			error: function(){
	  				// jsp의 전역변수
	  				petCodes = new Array();
	  				petSizes = new Array();
	  				petBaths = new Array();
	  				petBathTexts = new Array();
	  				
	  				alert("결제 중 오류가 발생하였습니다. 관리자에게 문의하세요");
	  				
	  		        reservation_end_modal.style.display = "none";
	  		        $('body').css("overflow", "scroll");
	  		        
	  		        $('#section_end1').attr("style", "display:flex; z-index:999");
	  		        $('#section_end2').attr("style", "display:none");
	  		        
	  		        
	  		        
	  			}
	  		});
  	       
  	    } else {
  	        
  	    	console.log(rsp.error_code);
  	    	console.log(rsp.error_msg);
  	    	
  	    	alert("결제 중 오류가 발생하였습니다. 관리자에게 문의하세요");
  	    	
  	       
  	    }
  	  });
	
  	<%}%>
	
	
}

<%if(userId!="null"){%>

	var reservation_end_modal = document.getElementById('reservation_end_modal');
	var reservation_end = document.getElementById("reservation_end");
	
	reservation_end.onclick = function() {
	    reservation_end_modal.style.display = "block";
	    $('body').css("overflow", "hidden");
	}
<%}%>

$(document).ready(function(){
	var container = document.getElementById('map_container'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 5 //지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	var geocoder = new kakao.maps.services.Geocoder();
	
	geocoder.addressSearch('<%=boardT.getBoardAddress()%>', function(result, status) {
		
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">펫시터 주소지 인근</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	
	});
	
});

/*  */

var today = new Date();//오늘 날짜//내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
var date = new Date();//today의 Date를 세어주는 역할
var cFlag = true;
var cIndex = 0; 
function prevCalendar() {//이전 달
// 이전 달을 today에 값을 저장하고 달력에 today를 넣어줌
//today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
//getMonth()는 현재 달을 받아 오므로 이전달을 출력하려면 -1을 해줘야함

	 today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
	 buildCalendar(); //달력 cell 만들어 출력 
}

function nextCalendar() {//다음 달
    // 다음 달을 today에 값을 저장하고 달력에 today 넣어줌
    //today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
    //getMonth()는 현재 달을 받아 오므로 다음달을 출력하려면 +1을 해줘야함
     today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
     buildCalendar();//달력 cell 만들어 출력
}
function buildCalendar(){//현재 달 달력 만들기
	cFlag = true;
	cIndex = 0;
    var doMonth = new Date(today.getFullYear(),today.getMonth(),1);
    //이번 달의 첫째 날,
    //new를 쓰는 이유 : new를 쓰면 이번달의 로컬 월을 정확하게 받아온다.     
    //new를 쓰지 않았을때 이번달을 받아오려면 +1을 해줘야한다. 
    //왜냐면 getMonth()는 0~11을 반환하기 때문
    var lastDate = new Date(today.getFullYear(),today.getMonth()+1,0);
    //이번 달의 마지막 날
    //new를 써주면 정확한 월을 가져옴, getMonth()+1을 해주면 다음달로 넘어가는데
    //day를 1부터 시작하는게 아니라 0부터 시작하기 때문에 
    //대로 된 다음달 시작일(1일)은 못가져오고 1 전인 0, 즉 전달 마지막일 을 가져오게 된다
    var tbCalendar = document.getElementById("calendar");
    //날짜를 찍을 테이블 변수 만듬, 일 까지 다 찍힘
    var tbCalendarYM = document.getElementById("tbCalendarYM");
    //테이블에 정확한 날짜 찍는 변수
    //innerHTML : js 언어를 HTML의 권장 표준 언어로 바꾼다
    //new를 찍지 않아서 month는 +1을 더해줘야 한다. 
     tbCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월"; 

     /*while은 이번달이 끝나면 다음달로 넘겨주는 역할*/
    while (tbCalendar.rows.length > 2) {
    //열을 지워줌
    //기본 열 크기는 body 부분에서 2로 고정되어 있다.
          tbCalendar.deleteRow(tbCalendar.rows.length-1);
          //테이블의 tr 갯수 만큼의 열 묶음은 -1칸 해줘야지 
        //30일 이후로 담을달에 순서대로 열이 계속 이어진다.
     }
     var row = null;
     row = tbCalendar.insertRow();
     //테이블에 새로운 열 삽입//즉, 초기화
     var cnt = 0;// count, 셀의 갯수를 세어주는 역할
    // 1일이 시작되는 칸을 맞추어 줌
     for (i=0; i<doMonth.getDay(); i++) {
     /*이번달의 day만큼 돌림*/
          cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
          cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
     }
    /*달력 출력*/
     for (i=1; i<=lastDate.getDate(); i++) { 
    	 cIndex++;
     //1일부터 마지막 일까지 돌림
          cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
          cell.innerHTML = i;//셀을 1부터 마지막 day까지 HTML 문법에 넣어줌
          cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
      if (cnt % 7 == 1) {/*일요일 계산*/
          //1주일이 7일 이므로 일요일 구하기
          //월화수목금토일을 7로 나눴을때 나머지가 1이면 cnt가 1번째에 위치함을 의미한다
        cell.innerHTML = "<font color=#F79DC2>" + i
        //1번째의 cell에만 색칠
    }    
      if (cnt%7 == 0){/* 1주일이 7일 이므로 토요일 구하기*/
          //월화수목금토일을 7로 나눴을때 나머지가 0이면 cnt가 7번째에 위치함을 의미한다
          cell.innerHTML = "<font color=skyblue>" + i
          //7번째의 cell에만 색칠
           row = calendar.insertRow();
           //토요일 다음에 올 셀을 추가
      }
      
      /*오늘 날짜 이전 회색처리*/
       if (today.getFullYear() == date.getFullYear()
         && today.getMonth() == date.getMonth()
         && cIndex == date.getDate()) {
	        cFlag = false; 
       }
      
       if(cFlag){
     	  cell.bgColor = "lightgray";//셀의 배경색을 노랑으로   
       }
      
      
      <%for(String schedule : scheduleT){%>
      
      
      if (<%=schedule.substring(0,4)%> == date.getFullYear()
        && <%=schedule.substring(5,7)%> == date.getMonth()+1
      	 && <%=schedule.substring(8,10)%> == i) {
         //달력에 있는 년,달과 내 컴퓨터의 로컬 년,달이 같고, 일이 오늘의 일과 같으면
         console.log("<%=schedule.substring(0,4)%>");
         console.log(date.getFullYear());
         console.log("<%=schedule.substring(5,7)%>");
         console.log(date.getMonth()+1);
         console.log("<%=schedule.substring(8,10)%>");
         /* console.log(i); */
       cell.bgColor = "lightgray";//셀의 배경색을 노랑으로 
      }
      
      <%}%>
      console.log(i);
      
     }
    
}

window.onload = function () {
	buildCalendar();
}


/*  */

</script>

<%@include file="/views/common/footer.jsp" %>

<script src="js/PST.js"></script>