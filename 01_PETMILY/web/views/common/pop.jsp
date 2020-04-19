<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
<style>
	div{
		display:flex;
		flex-direction: column;
		margin-right:auto;
		margin-left:auto;
	}
	
	#container{
		background-color: rgb(218, 218, 218);
		border-radius:15px;
	}
	#tp{
		margin-top:120px;
	
	}
	
	

	
	button{
				margin-right:auto;
		margin-left:auto;
		text-align:center;
		padding: 7px 15px;
		width: 100px;
		
	    background-color: black; /* 버튼 배경 */
	    border-radius:25px; /* 버튼을 둥글게! */
	    border: 0; /* 박스 선 없애기! */
	    font-size: small; /* 폰트 사이즈 */
	    color: white; /* 폰트 컬러 */
	}
	button:hover {
		text-align:center;
		cursor: pointer;
	    background-color: rgb(98, 98, 98);
	}
	
	
	#hr2{
		margin-top:70px;
		width: 550px;
	}
	
	input{
		width: 200px;
		height: 30px;
	}
	
	#bttm2{
		
		padding: 7px 15px;
		width: 100px;

	    background-color: black; /* 버튼 배경 */
	    border-radius:25px; /* 버튼을 둥글게! */
	    border: 0; /* 박스 선 없애기! */
	    font-size: small; /* 폰트 사이즈 */
	    color: white; /* 폰트 컬러 */
	}
	
	#row{
		display:flex;
		flex-direction: row;
		margin-right:auto;
		margin-left:auto;
	}
	#checkid-container{
		text-align:center;
		margin-right:auto;
		margin-left:auto;
		
	}
</style>


<section>
	<article>
		
		<div id="checkid-container">
			
			<p style="text-align:center; font-size:12px;">창을 닫아주세요.</p>
			<hr style="width:100%;"/>
			<button onclick="setEmail();">창 닫기</button>
	</div>
	
	<script>

	alert("<%=request.getAttribute("msg")%>");

		function setEmail() {
			
			self.close();	
		}	
	</script>
	</article>
</section>

