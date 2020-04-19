<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.petmily.admin.model.vo.AdminPetsitter" %>
<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/psNewCer.css" type = "text/css">
<% 
	ArrayList<AdminPetsitter> list = new ArrayList();
	if(request.getAttribute("psList")!=null){
		list = (ArrayList<AdminPetsitter>)request.getAttribute("psList");
	}
	int AuCount = 1;
	String type = "DATE_OF_ACQUISITION";
	if(request.getAttribute("type")!=null){
		type = (String)request.getAttribute("type");
	}
%>
<section id="adminMainMenu">
<%@ include file="/views/admin/adminSideBar.jsp" %>
	<section id="adminUserList">
		<h4>펫 시터 자격증 신청 목록</h4>
		<hr/>
		<div class="adminUserInfo">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>아이디</th>
						<th>발급기관명</th>
						<th>자격증명</th>
						<th>취득일</th>
						<th>만료일</th>
						<th>자격증 사진</th>
						<th>상태</th>
						<th>확인</th>
					</tr>
				</thead>
				<tbody>
					<%for(AdminPetsitter ap : list){ %>
						<tr>
							<td><%=ap.getUserId()%></td>
							<td><%=ap.getCERTIFICATE_NAME()%></td>
							<td><%=ap.getCERTIFICATION_NAME()%></td>
							<td><%=ap.getDATE_OF_ACQUISITION()!=null?ap.getDATE_OF_ACQUISITION().substring(0, 11):"취득일자없음"%></td>
							<td><%=ap.getEXPIRATION_DATE()!=null?ap.getEXPIRATION_DATE().substring(0, 11):"만료일자없음"%></td>
							<td>
							<% if(ap.getCERTIFICATE_FILENAME()!=null){%>
								<button class="Abtns" onclick="CerImg('<%=ap.getCERTIFICATE_FILENAME()%>')">보기</button>
							<% } else { %>
								<p> 사진이 없습니다 </p>
							<% } %>
							</td>
							<td>
								<select class="Asele" name="selectType">
									<option value="반려">반려</option>
									<option value="허가">허가</option>
								</select>
							</td>
							<td><button class="Abtns" onclick="CerTypeChange()">선택</button></td>
						</tr>
					<% } %>
				</tbody>
			</table>
			<div id="pageBar">
				<%= request.getAttribute("pageBar") %>
			</div>
		</div>
	</section>
</section>
<script>
	function CerImg(fileName){
		console.log(fileName);
		window.open("<%=request.getContextPath()%>/admin/psCerImg?file="+fileName,"_blank","width=500px; height=500px");
	}
	
	function CerTypeChange(){
		let userId = $(event.target.parentElement.parentElement.children[0]).text();
		let centerName = $(event.target.parentElement.parentElement.children[1]).text();
		let cerName = $(event.target.parentElement.parentElement.children[2]).text();
		let type = $(event.target.parentElement.parentElement.children[6].children).val();
		console.log(userId,centerName,cerName,type);
		location.replace('<%=request.getContextPath()%>/admin/cerChange?userId='+userId+"&centerName="+centerName+"&cerName="+cerName+"&type="+type);
	}
</script>
<%@ include file="/views/common/footer.jsp" %>