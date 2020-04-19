<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.petmily.admin.model.vo.AdminQuestion"%>
<%
	AdminQuestion aq = null;
	if(request.getAttribute("question")!=null){
		aq = (AdminQuestion)request.getAttribute("question");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변작성 팝업창</title>
</head>
<body>
	<h3>문의 내역</h3>
	<form action="<%=request.getContextPath()%>/admin/questionEmail" method="post">
		<fieldset>
		<legend>이메일 답변작성</legend>
			<input type="hidden" name="userId" value="<%=aq.getUserId()%>">
			<input type="hidden" name="email" value="<%=aq.getSendEmail()%>">
			<input type="hidden" name="qData" value="<%=aq.getEmailTitle()%>">
			<input type="hidden" name="scNum" value="<%=aq.getScNum()%>">
			<p>문의내용 : <%=aq.getEmailTitle()%></p>
			<textarea name="aData" cols="60" rows="8" required style="resize:none"></textarea>
			<br/>
			<button type="submit">전송</button>
		</fieldset>
	</form>
</body>
<style>
	form{
		display:flex;
		flex-direction:column;
		text-align:center;
		justify-content:center;
		align-items: center;
	}
	form fieldset{
		background-color:lightgreen;
	}
	form legend{
		background-color:lightblue;
	}
	h3{
		text-align:center;
		border:1px solid white;
		font-size:25px;
	}
	button{
		width:120px;
		height:60px;
		border:1px solid black;
		background-color: white;
	}
</style>
</html>