<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@page import="java.util.List,com.petmily.petsitterMyPage.reservation.model.vo.PetsitterMypageReservation" %>

<%@ include file="/views/common/header.jsp" %>


<%
	int count=1;
	List<PetsitterMypageReservation> list=(List)request.getAttribute("list");
%>

<style>
   *{   
       
        box-sizing: border-box;
        font-family: 'Noto Sans KR', sans-serif;
    }
    html, body,section,form {
          height: 100%;
      }
    .col-9{
        height: 100%;
        /* overflow: hidden; */
        
    }

    .container{
        height: 100%;
        padding: 0;
        width: 1366px;
        margin-left: auto;
        margin-right: auto;
        /* border: 1px solid red; */
 
    }
    .top-div{
    	overflow: hidden;
    }
    .row{
        padding: 0;
        margin: 0;
        height: 100%;
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
            height: 100%;
        }
    .breadcrumb .active {
        color: white;
    }
    .breadcrumb{

        background-color: #ffcc33;
        /* z-index: 500px !important; */
        /* position: fixed; */
        height: 40px;
        width: 100%;
        border-radius: 0%;
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
        margin-left: auto;
        margin-right: auto;
        border-collapse: collapse;
 	}
    td{
    	font-size: 12px;
        border-top: 1px solid grey;
        border-bottom: 1px solid grey;
		text-align: center;
    }

    th{
        width: 150px;
        font-size: 12px;
        text-align: center;
        background-color: rgb(189, 188, 188);
        color: grey;
        border-right: 1px solid white;
    }
    .col-2{
    	margin-top:50px;
    }
</style>

	    <section>
	        <div class="container">
	            <form name="reFrm" method="post">
		            <div class="row">
		            	<%@ include file="/views/petsitterMypage/petSitterSideBar.jsp" %>
	            		<div class="vl"></div>
		            	<div class="col-9" style="padding:0;">
		                <div class="row top-div" style="height: 200px;overflow: hidden;">
		                    <img class="top-img" style="width: 100%; margin-top: -230px;" src="https://images.unsplash.com/flagged/photo-1548245643-7b805f2f93d5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80">
		                </div>
		                <ul class="breadcrumb">
		                    <li class="breadcrumb-item">결제 전 예약</li>
		                </ul>
		                   <!-- 콘텐츠 영역 -->
			                   <table id="enrollTB">
								
			                    <tr class="tr-blank">
			                        <th class="no">No</th>
			            			<th class="cho">선택</th>
			                        <th class="ckDate">체크 인</th>
			                        <th class="ckDate">체크 아웃</th>
			                        <th class="name">요청자 명</th>
			                        <th class="read">펫 프로필 열람</th>
			                        <th class="read">비밀 후기 열람</th>
			                        <th>요청 상세</th>
			                        <th class="state">상태</th>
			                    </tr>
								<%if(list!=null){ %>
			                    <%for(PetsitterMypageReservation pmr:list){ %>
			                    <tr>
			                    	<td class="no"><%=count++ %></td>
			                    	<td class="cho"><input type="checkbox" name="reservationCode" value=<%=pmr.getReservationCode() %>></td>
			                    	<td class="ckDate"><%=pmr.getCheckInDate() %></td>
			                    	<td class="ckDate"><%=pmr.getCheckOutDate() %></td>
			                    	<td class="name"><%=pmr.getUserName() %></td>
			                    	<td class="read">
			                    		<div class="p-1">
			                    			<input type="hidden" name="rsCode" value="<%=pmr.getReservationCode()%>" />
			                    			<button type="button" class="btn petProfile" >열람</button>
			                    		</div>
			                    	</td>
			                    	<td><div class="p-1"><button class="btn secretReview" type="button" data-toggle="modal" data-target="#secretReviewModal" value=<%=pmr.getUserId() %>>열람</button></div></td>
			                    	<td>
			                    		<div class="p-1">
			                    			<input type="hidden" name="rsCode" value="<%=pmr.getReservationCode()%>" />
			                    			<button type="button" class="btn requestDetail"> 상세 요청 확인</button>
			                    		</div>
			                    	</td>
			                    	<td class="state"><%=pmr.getResType() %></td>
			                    	
			                    </tr>
			                 	<%} }%>
			                </table>
		                	
		                	
		                	<!-- 비밀후기 모달 -->
		                	  <div class="modal" id="secretReviewModal">
							    <div class="modal-dialog">
							      <div class="modal-content">
							      
							        <!-- Modal Header -->
							        <div class="modal-header">
							          <h4 class="modal-title ">비밀 후기 열람</h4>
							          <button type="button" class="close" data-dismiss="modal">&times;</button>
							        </div>
							        
							        <!-- Modal body -->
							        <div class="modal-body" id="secretReviewModalBody">
							          
							        </div>
							        
							        <!-- Modal footer -->
							        <div class="modal-footer">
							          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
							        </div>
							        
							      </div>
							    </div>
							  </div>
							  
							  <!-- 상세요청 모달 -->
		                	  <div class="modal" id="requestDetailModal">
							    <div class="modal-dialog">
							      <div class="modal-content">
							      
							        <!-- Modal Header -->
							        <div class="modal-header">
							          <h4 class="modal-title ">요청 상세</h4>
							          <button type="button" class="close" data-dismiss="modal">&times;</button>
							        </div>
							        
							        <!-- Modal body -->
							        <div class="modal-body" id="requestDetailModalBody">
							         
							        </div>
							        
							        <!-- Modal footer -->
							        <div class="modal-footer">
							          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
							        </div>
							        
							      </div>
							    </div>
							  </div>
		                	
			                	<br>
			                	<br>
			                	<br>
			                <div class="row justify-content-center" >
				                <input type="submit" value="예약 진행" onclick="return rego();" class="btn" style="margin-right:15px;">
				                <br>
				                <br>
				                <input type="submit" value="예약 거절" class="btn"  onclick="return reStop();">
							</div>
		                </div>
	            </div>
	        </form>
        </div>
    </section>
    
    <style>
	.no{
		width:40px;
	}
	
	.name{
		width:100px;
	}
	.state{
		width:80px;
	}
	.read{
		width:100px;
	}
	.ckDate{
		width:130px;
	}
	.cho{
		width:60px;
	}
	.btn {
	  
	  border-radius: 29.5px;
	  border: solid 1px #808080;
	  background-color: #f0f0f0;
	  font-size:13px;
	  height:30px;
	}
	
</style>

<script>
	function rego(){
		document.reFrm.action="<%=request.getContextPath()%>/petsitter/mypage/statusAccept";		
	}
	function reStop(){
		document.reFrm.action="<%=request.getContextPath()%>/petsitter/mypage/statusRefusal"; 
	}
	$(function(){
		
		$(".secretReview").click((e)=>{
			//console.log($(this).val());
			$.ajax({
				url:"<%=request.getContextPath()%>/petsitter/mypage/userReviewList",
				data:{userId:$(e.target).val()},
				error:function(){
	  				alert("실패");
	  				console.log($(this).val());
	  			},
	  			success:data=>{
	  				$("#secretReviewModalBody").html(data);
	  			}
			});
		});
	});
	
	$(function(){
		
		$(".requestDetail").click((e)=>{
		
			var rsCode = $(e.target).prev().val();
			var url = "<%=request.getContextPath()%>/sitter/beforePaymentDetail?rsCode="+rsCode;
			var status = "height=420px, width=600px, top=200px, left=500px";
			
			window.open(url, "_blank", status);
			
			});
			
		});

	$(function(){
		
		$(".petProfile").click((e)=>{
		
			var rsCode = $(e.target).prev().val();
			var url = "<%=request.getContextPath()%>/sitter/beforePaymentPetprofile?rsCode="+rsCode;
			var status = "height=420px, width=600px, top=200px, left=500px";
			
			window.open(url, "_blank", status);
			
			});
			
		});
	
	
	
</script>

<%@ include file="/views/common/footer.jsp" %>