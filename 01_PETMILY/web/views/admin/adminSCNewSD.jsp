<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.petmily.admin.model.vo.AdminQuestion" %>
<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/adminSCNewSD.css" type = "text/css">
<% 
	ArrayList<AdminQuestion> aqList = new ArrayList();
	if(request.getAttribute("aqList")!=null){
		aqList = (ArrayList<AdminQuestion>)request.getAttribute("aqList");
	}
	int qCount = 1;
%>
<section id="adminMainMenu">
<%@ include file="/views/admin/adminSideBar.jsp" %>
	<section id="adminUserList">
		<h4>QnA 작성</h4>
		<hr/>
		<form action="<%=request.getContextPath()%>/admin/newSDEnd" method="post">
			<div id="newSD">
				<div id="newType" class="newSCs">
					<h5>대상 : </h5>	
					<select class="Asele" name="scType">
						<option value="일반">일반</option>
						<option value="펫시터">펫시터</option>
					</select>
				</div>
				<div id="newQ" class="newSCs">
					<h2>질문 : </h2><textarea name="qData" cols="60" rows="4" required></textarea>
				</div>
				<div id="newA" class="newSCs">
					<h2>답변 : </h2><textarea name="aData" cols="60" rows="4" required></textarea>
				</div>
				<input type="submit" value="작성하기" id="sbm">
			</div>
		</form>
		<div class="adminUserInfo">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>대상</th>
						<th>질문내용</th>
						<th>답변내용</th>
						<th>추가하기</th>
					</tr>
				</thead>
				<tbody>
					<% for(AdminQuestion aq : aqList){ %>
					<tr>
						<td><%=aq.getType()%></td>
						<td><%=aq.getEmailTitle()%></td>
						<td><%=aq.getSend()%></td>
						<td><button class="Asele" onclick="addSD()">추가하기</button></td>
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
	function addSD(){
		let type = $(event.target).parent().parent().find("td:nth-of-type(1)").text();
		let aqQ = $(event.target).parent().parent().find("td:nth-of-type(2)").text();
		let aqA = $(event.target).parent().parent().find("td:nth-of-type(3)").text();
		$(".Asele").val(type);
		$("textarea[name=qData]").val(aqQ);
		$("textarea[name=aData]").val(aqA);
	}
	

</script>
<%@ include file="/views/common/footer.jsp" %>