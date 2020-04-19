<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<section>
	<div id="SCDiv">
		<h2>고객 센터</h2>
		<div id="changeQA">
			<div id="userQA" class="QA">
				<h4>사용자 QnA</h4>
			</div>
			<div id="sitterQA" class="QA">
				<h4>펫 시터 QnA</h4>
			</div>
		</div>
		<div id="QAData">
			<div class="Data">
				<div class="qData">
					<p>저스트 웨이 유 알</p><p class="icon" alt="1">▼</p>
				</div>
				<hr class="centerHr"/>
				<div class="aData">
					<p>앤 웨얼 유얼 스마일~</p>
				</div>
			</div>
		</div>
		<button id="qeBtn" onclick="queOpen()">문의하기</button>
	</div>
</section>
<script>
	$(function(){
		showList({"type":"일반"});
	});
	
	$("#userQA").click(function(){
		showList({"type":"일반"});
	});
	
	$("#sitterQA").click(function(){
		showList({"type":"펫시터"});
	});
	
	function queOpen(){
		<%if(loginUser!=null){%>
		let url="<%=request.getContextPath()%>/scQuestion?userId=<%=loginUser.getUserId()%>";
		window.open(url,"_blank","width=500px; height=625px; top=100px; left=250px;");
		<%} else { %>
		alert("문의를 하시려면 로그인이 필요한 서비스입니다!");
		<% } %>
	}
	
	function showList(type){
		$.ajax({
			url:"<%=request.getContextPath()%>/scData",
			data:type,
			type:"post",
			success:data=>{
				
				if(type['type']=="일반"){
					$("#sitterQA").attr("style","background-color:white");
					$("#userQA").attr("style","background-color:lightgray");
					
				} else {
					$("#sitterQA").attr("style","background-color:lightgray");
					$("#userQA").attr("style","background-color:white");
					
				}
				
				$("#QAData").html("");
				for(let i=0;i<data.length;i++){
					let dataDiv = $("<div>");
					dataDiv.attr("class","Data");
					
					let qDiv = $("<div>");
					qDiv.attr("class","qData");
					let qP = $("<p>");
					qP.html(data[i]['scQtext']);
					let icon = $("<p>");
					icon.attr("class","icon");
					icon.attr("alt","1");
					icon.html("▼");
					qDiv.append(qP).append(icon);
					
					let hr = $("<hr>");
					hr.attr("class","centerHr");
					
					let aDiv = $("<div>");
					aDiv.attr('class',"aData");
					let aP = $("<p>");
					aP.html(data[i]['scAtext']);
					aDiv.append(aP);
					
					dataDiv.append(qDiv).append(hr).append(aDiv);
					$("#QAData").append(dataDiv);
					
				}
					
					$(".icon").click(function(){
						let type = $(event.target).attr("alt");
						if(type==1){
							$(event.target).attr("alt","2");
							$(event.target).text("▲");
							$(event.target).attr("style","color:lightblue");
						} else {
							$(event.target).attr("alt","1");
							$(event.target).text("▼");
							$(event.target).attr("style","color:black");
						}
						$(event.target).parent().parent().find(".aData").slideToggle();
					})
				
				
			},
			error:data=>{
				alert("페이지 오류입니다.");
			}
		})
	}

	
</script>
<style>
	div#SCDiv{
		display:flex;
		flex-direction:column;
		justify-content:center;
		align-items: center;
	}
	h2{
		text-align:center;
		margin-top:50px;
		margin-bottom:50px;
	}
	h4{
		text-align:center;
		margin:0px;
	}
	div#changeQA{
		display:flex;
		flex-direction:row;
		justify-content:center;
		align-items: center;
	}
	div.QA{
		display:flex;
		flex-direction:column;
		justify-content:center;
		align-items: center;
		width:500px;
		height:80px;
		border:1px solid lightgray;
	}
	div.QA:hover{
		cursor:pointer;
	}
	div#QAData{
		display:flex;
		flex-direction:column;
		width:1000px;
		height:550px;
		border:1px solid black;
		overflow:scroll;
		overflow-x:hidden;
		margin-bottom:50px;
	}
	div#QAData::-webkit-scrollbar{
		width:15px;
		background-color:yellow;
		border-radius:10px;
		border:1px solid lightgray;
	}
	div#QAData p{
		margin:0px;
		margin-top:20px;
		margin-bottom:20px;
		margin-left:20px;
	}
	hr.centerHr{
		border-color:gray;
		margin-top:5px;
		margin-bottom:5px;
		width:100%;
		height:2px;
	}
	p.icon{
		font-size:30px;
		text-align:right;
		padding-right:20px;
	}
	p.icon:hover{
		color:lightblue;
		cursor:pointer;
	}
	div.qData{
		display:flex;
		flex-direction:row;
		justify-content:space-between;
	}
	div.qData>p:nth-of-type(1){
		font-size:25px;
	}
	div.aData{
		display:none;
		padding:20px;
		background-color:lightgray;
		background-clip:content-box;
		height:200px;
		border-bottom:1px solid gray;
	}
	button#qeBtn{
		margin-bottom:70px;
		width:200px;
		height:60px;
		font-size:30px;
		border-radius:24px;
		font-weight:bolder;
	}
</style>
<%@ include file="/views/common/footer.jsp" %>