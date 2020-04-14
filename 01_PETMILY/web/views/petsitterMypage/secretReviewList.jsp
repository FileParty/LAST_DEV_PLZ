<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>

	<div class="container">
		<div class="col-5">
			<br>
			<br>
			<div class="row justify-content-between">
			
				<div>총 3건</div> 
				<div>평점 4점</div>	
			</div>
			<hr>
			
			
			<div class="row justify-content-between">
				<div class="colum">ㅇㅇㅇ펫시터 님의 후기</div>
				<div class="colum">별점 <i class="far fa-star"></i></div>
			</div>
			
			<div class="balloon"> 후기 들어갈 공간 </div>
			
			
		</div>
	</div>

<style>

	.balloon {
	
	 position:relative;
	 margin: 50px;
	 width:400px;
	 height:200px;
	 
	 background: #ececec;
	 border-radius: 10px;
	 padding:20px;
	 
	}
	.balloon:after {
	 border-top:15px solid #ececec;
	 border-left: 15px solid transparent;
	 border-right: 0px solid transparent;
	 border-bottom: 0px solid transparent;
	 
	 content:"";
	 position:absolute;
	 top:10px;
	 left:-15px;
	}
	
	.talk-bubble {
	
		margin: 40px;
	  	display: inline-block;
	  	position: relative;
		width: 200px;
		height: auto;
		background-color: lightyellow;
	}
	
	.tri-right.border.left-in:before {
		content: ' ';
		position: absolute;
		width: 0;
		height: 0;
	  left: -40px;
		right: auto;
	  top: 30px;
		bottom: auto;
		border: 20px solid;
		border-color: #666 #666 transparent transparent;
	}
	.tri-right.left-in:after{
		content: ' ';
		position: absolute;
		width: 0;
		height: 0;
	  left: -20px;
		right: auto;
	  top: 38px;
		bottom: auto;
		border: 12px solid;
		border-color: lightyellow lightyellow transparent transparent;
	}
	
	.tri-right.border.btm-left:before {
		content: ' ';
		position: absolute;
		width: 0;
		height: 0;
		left: -8px;
	  	right: auto;
	  	top: auto;
		bottom: -40px;
		border: 32px solid;
		border-color: transparent transparent transparent #666;
	}
	.tri-right.btm-left:after{
		content: ' ';
		position: absolute;
		width: 0;
		height: 0;
		left: 0px;
	  	right: auto;
	  	top: auto;
		bottom: -20px;
		border: 22px solid;
		border-color: transparent transparent transparent lightyellow;
	}

/*Right triangle, placed bottom left side slightly in*/
	.tri-right.border.btm-left-in:before {
		content: ' ';
		position: absolute;
		width: 0;
		height: 0;
		left: 30px;
	  right: auto;
	  top: auto;
		bottom: -40px;
		border: 20px solid;
		border-color: #666 transparent transparent #666;
	}
	.tri-right.btm-left-in:after{
		content: ' ';
		position: absolute;
		width: 0;
		height: 0;
		left: 38px;
	  right: auto;
	  top: auto;
		bottom: -20px;
		border: 12px solid;
		border-color: lightyellow transparent transparent lightyellow;
	}
	
	.border{
	  border: 8px solid #666;
	}

	
</style>
<%@ include file="/views/common/footer.jsp" %>