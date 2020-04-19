<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.petmily.admin.model.vo.ServiceData" %>
<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/adminSCMain.css" type = "text/css">
<% 
	ArrayList<ServiceData> aqList = new ArrayList();
	if(request.getAttribute("SDList")!=null){
		aqList = (ArrayList<ServiceData>)request.getAttribute("SDList");
	}
	int qCount = 1;
%>
<section id="adminMainMenu">
<%@ include file="/views/admin/adminSideBar.jsp" %>
	<section id="adminUserList">
		<h4>QnA 관리</h4>
		<hr/>
		<div class="adminUserInfo">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>대상</th>
						<th>질문내용</th>
						<th>답변내용</th>
						<th>삭제하기</th>
					</tr>
				</thead>
				<tbody>
					<% for(ServiceData sd : aqList){ %>
					<tr>
						<td><%=sd.getScType()%></td>
						<td><%=sd.getScQtext() %></td>
						<td><%=sd.getScAtext() %></td>
						<td><button class="Asele" onclick="delSD()">삭제하기</button></td>
					</tr>
					<% } %>
				</tbody>
			</table>
			<div id="pageBar">
				<%= request.getAttribute("pageBar") %>
			</div>
		</div>
		<div id="newQnADiv">
			<button class="Asele" onclick="newQnA()">QnA 작성하기</button>
		</div>
	</section>
</section>
<script>
	function delSD(){
		var flag = confirm("정말로 삭제하시겠습니까?");
		if(flag){
			let qd = $(event.target).parent().parent().find("td:nth-of-type(2)").text();
			location.replace("<%=request.getContextPath()%>/admin/delSD?qd="+qd);
		} else {
			return;
		}
	}
	
	function newQnA(){
		location.replace("<%=request.getContextPath()%>/admin/newSD");
	}
	

</script>
<%@ include file="/views/common/footer.jsp" %>