<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page  import="com.petmily.user.model.vo.User"  %>
<%
	User u = (User)session.getAttribute("loginUser");
%>

<style>
	.menu{
            width: 230px;
            /* border: 1px solid yellow; */
            margin-top: 50px;
            height: 100%;
            
        }
    #menu{
        width: 230px;
        
        height: 100%;
    }
     .content{
        font-size: 12px;
        margin-bottom: 5px;
    }
</style>


	 	<div class="col-2 menu">
                    <div id="menu">
                        <ul type="none">
                            <li class="title">회원정보</li>
                            <hr class="hr-line"/>
                            <li class="content"><a href="<%=request.getContextPath()%>/user/Update?userId=<%=u.getUserId()%>"> - 회원정보 수정</a></li>
                            <li class="content"><a href="<%=request.getContextPath()%>/user/Delete?userId=<%=u.getUserId()%>"> - 회원 탈퇴</a></li>
                            <li class="content"><a href="<%=request.getContextPath()%>/user/BookMarkList?userId=<%=u.getUserId()%>"> - 북마크</a></li>
                            <li class="content"><a href="<%=request.getContextPath()%>/user/Review?userId=<%=u.getUserId()%>"> - 작성 후기</a></li>
                            <br/>
        
                            <li class="title">펫 프로필</li>
                            <hr class="hr-line"/>
                            <li class="content"><a href="<%=request.getContextPath()%>/user/petprofile?userId=<%=u.getUserId()%>"> - 펫 프로필</a></li>
                            <br/>
                            
                            <li class="title">예약</li>
                            <hr class="hr-line"/>
                            <li class="content"><a href="<%=request.getContextPath()%>/user/request?userId=<%=u.getUserId()%>"> - 요청한 예약</a></li>
                            <li class="content"><a href="<%=request.getContextPath()%>/user/reservationing?userId=<%=u.getUserId()%>"> - 진행중인 예약</a></li>
                            <li class="content"><a href="<%=request.getContextPath()%>/user/reservationEnd?userId=<%=u.getUserId()%>"> - 종료된 예약</a></li>
                            <br/>
                            
                            <li class="title">결제</li>
                            <hr class="hr-line"/>
                            <li class="content"><a href="<%=request.getContextPath()%>/user/paymentHistory?userId=<%=u.getUserId()%>"> - 결제 내역</a></li>
                            <br/>
                            
                            
                        </ul>
                    </div>
                </div>
