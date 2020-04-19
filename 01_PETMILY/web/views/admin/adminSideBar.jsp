<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int pageType = 0;
	if(request.getAttribute("pageType")!=null){
		pageType = Integer.parseInt((String)request.getAttribute("pageType"));
	}
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/adminSideBar.css" type = "text/css">
<aside id="sideBar">
		<div id="sideBar1" class="side">
			<h2>일반 회원</h2>
			<hr/>
			<% if(pageType==1){ %>
				<a href="<%=request.getContextPath()%>/admin/user_list">
					▷  일반 회원 목록
				</a>
			<% } else { %>
				<a href="<%=request.getContextPath()%>/admin/user_list">
					-  일반 회원 목록
				</a>
			<% } %>
		</div>
		<div id="sideBar2" class="side">
			<h2>펫 시터</h2>
			<hr/>
			<% if(pageType==2){ %>
				<a href="<%=request.getContextPath()%>/admin/apply">
					▷  펫 시터 지원 목록
					<img class="alertApply" alt="" src="<%=request.getContextPath()%>/img/common/alertIcon.png" width="20px" height="20px">
				</a>
			<% } else { %>
				<a href="<%=request.getContextPath()%>/admin/apply">
					- 펫 시터 지원 목록
					<img class="alertApply" alt="" src="<%=request.getContextPath()%>/img/common/alertIcon.png" width="20px" height="20px">
				</a>
			<% } %>
			<% if(pageType==3){ %>
				<a href="<%=request.getContextPath()%>/admin/cancel">▷  이전 펫 시터 지원 목록</a>
			<% } else { %>
				<a href="<%=request.getContextPath()%>/admin/cancel">-  이전 펫 시터 지원 목록</a>
			<% } %>
			<% if(pageType==4){ %>
				<a href="<%=request.getContextPath()%>/admin/petsitterList">▷   펫 시터 목록</a>
			<% } else { %>
				<a href="<%=request.getContextPath()%>/admin/petsitterList">-  펫 시터 목록</a>
			<% } %>
		</div>
		<div id="sideBar3" class="side">
			<h2>펫시터 자격증</h2>
			<hr/>
			<% if(pageType==5){ %>
				<a href="<%=request.getContextPath()%>/admin/petsitterCerApply">
					▷   펫 시터 자격증 신청 목록
					<img class="alertCer" alt="" src="<%=request.getContextPath()%>/img/common/alertIcon.png" width="20px" height="20px">
				</a>
			<% } else { %>
				<a href="<%=request.getContextPath()%>/admin/petsitterCerApply">
					-  펫 시터 자격증 신청 목록
					<img class="alertCer" alt="" src="<%=request.getContextPath()%>/img/common/alertIcon.png" width="20px" height="20px">
				</a>
			<% } %>
			<% if(pageType==6){ %>
				<a href="<%=request.getContextPath()%>/admin/petsitterCerYList">▷   허가된 펫 시터 자격증 목록</a>
			<% } else { %>
				<a href="<%=request.getContextPath()%>/admin/petsitterCerYList">-  허가된 펫 시터 자격증 목록</a>
			<% } %>
		</div>
		<div id="sideBar4" class="side">
			<h2>관리자 기능</h2>
			<hr/>
			<% if(pageType==7){ %>
				<a href="<%=request.getContextPath()%>/admin/question">
					▷   고객 문의
					<img class="alertQue" alt="" src="<%=request.getContextPath()%>/img/common/alertIcon.png" width="20px" height="20px">
				</a>
			<% } else { %>
				<a href="<%=request.getContextPath()%>/admin/question">
					-  고객 문의
					<img class="alertQue" alt="" src="<%=request.getContextPath()%>/img/common/alertIcon.png" width="20px" height="20px">
				</a>
			<% } %>
			<% if(pageType==8){ %>
				<a href="<%=request.getContextPath()%>/admin/scMain">▷   QnA 관리</a>
			<% } else { %>
				<a href="<%=request.getContextPath()%>/admin/scMain">-  QnA 관리</a>
			<% } %>
		</div>
	</aside>
<script>
		$.ajax({
			url:"<%=request.getContextPath()%>/admin/alert",
			dataType:"json",
			type:"post",
			success:data=>{
				console.log("data : ",data);
				if(data[0]<=0){
					$(".alertApply").hide();
				}
				
				if(data[1]<=0){
					$(".alertCer").hide();
				}
				
				if(data[2]<=0){
					$(".alertQue").hide();
				}
			}
		})
</script>