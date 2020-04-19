<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ page import="java.util.List, com.petmily.calculator.model.vo.Calculator" %>

<%
	int count = 1;
	List<Calculator> list = (List)request.getAttribute("list");
	int total=0;
	int sum = 0;
	int fee = 0;
	int isum = 0;
%>
<%@ include file="/views/common/header.jsp" %>


<style>
  *{   
        box-sizing: border-box;
        font-family: 'Noto Sans KR', sans-serif;
    }
    html, body,section{
          height: auto;
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
    	height: 100%;
        padding: 0;
        margin: 0;
        height: 100%;
    }
    .menu{
            height: 100%;
            width: 230px;
            /* border: 1px solid yellow; */
            margin-top: 50px;

        }
    #menu{
    height: 100%;
        width: 230px;
        /* position : fixed; */
    }
    ul{
        padding-inline-start:0;
    }
    .title{
        font-size: 14px;
    }
    .content{
    height: 100%;
        font-size: 12px;
        margin-bottom: 5px;
    }
        a:link { color: black; text-decoration: none;}
        a:visited { color: gray; text-decoration: none;}
        a:hover { color: black; text-decoration: underline;}
    .vl {   width: 1px;
            margin-top: 0px;
            border-left: 1px solid lightgrey;
            height: auto;
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
    height: 100%;
            margin-left: 0;
            width: 10%;
        }
    table{
    display:flex;
        border-radius: 5px;
        margin-left: 50px;
        margin-top: 30px;
    }
 .notice{
    margin: 20px;
     font-size: 12px;
     background-color: rgb(196, 196, 196);
     padding:10px;
     border: 1px solid rgb(71, 71, 71);
 }
 .btn{
    padding-top: 5px;
    padding-bottom: 20px;
    font-size: 12px;
    border-radius: 25px;
	width: 100px;
	height: 30px;
 }
 
 select {
 	margin-left: 20px;
 	font-size: 10px;
 }
 
     table{
        border-radius: 5px;
        margin-left: auto;
        margin-right: auto;
        border-collapse: collapse;
 	}
    td{
    	font-size : 12px;
        border-top: 1px solid grey;
        border-bottom: 1px solid grey;
		text-align: center;
		line-height: 30px;
		vertical-align:middle; 
    }

    th{
    	font-weight: 500;
        width: 150px;
        font-size: 14px;
        text-align: center;
        line-height: 25px;
        background-color: rgb(189, 188, 188);
        color: grey;
        border-right: 1px solid white;
    }
    .txt_line {
    display: block;
    text-align : left;
    width:200px;
    padding:0 10px;
    overflow:hidden;
    text-overflow:ellipsis; white-space:nowrap; }
    
    button{
    line-height: 0px;
    font-size: 10px;
	color: #ffcc33;
	  width: 80px;
	  height: 20px;
	  border-radius: 20.5px;
	  border: solid 1px #ffcc33;
	  background-color: white;
	  vertical-align:middle; 
	  margin-bottom:3px;
	}

	button:hover{
	    color: white;
	    background-color: #ffcc33;
	}

</style>

<!-- 회원탈퇴 화면 -->
    <section>
        <div class="container">
            <div class="row">
            <%@ include file="/views/petsitterMypage/petSitterSideBar.jsp" %>
            <div class="vl"></div>
            <div class="col-9" style="padding:0;">
                <div class="row top-div" style="height: 200px;overflow: hidden;">
                    <img class="top-img" style="width: 100%; margin-top: -230px;" src="https://images.unsplash.com/flagged/photo-1548245643-7b805f2f93d5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80">
                </div>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item">정산</li>
                    <li class="breadcrumb-item active">이번 달 정산 현황</li>
                </ul>
                   <!-- 콘텐츠 영역 -->
                    <div class="notice">
                       
                        <p>* 정산은 매달 5일에 이루어 집니다.</p>
						<p>* 매달 1일부터 말일까지 결제 완료된 금액에 대해서 정산을 진행합니다.</p>
						<p>* 건당 수수료 10%가 (주)펫 밀리로 지급됩니다.</p>
						<p>* 정산된 금액은 회원정보에 등록된 계좌로 입금됩니다.</p>
                    </div>     
               		<select id="month" name="month" onchange="end();">
						<option>날짜를 선택해주세요.</option>
						<option value="01">01</option>
						<option value="02">02</option>
						<option value="03">03</option>
						<option value="04">04</option>
						<option value="05">05</option>
						<option value="06">06</option>
						<option value="07">07</option>
						<option value="08">08</option>
						<option value="09">09</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>	
					</select>
				

                        <table>
                        <tr class="tr-blank">
                        <th>No</th>
            			<th>체크 인</th>
            			<th>체크 아웃</th>
                        <th>요청자 명</th>
                        <th>최종 결제 금액</th>
                        <th>수수료</th>
                        <th>결제 날짜</th>
                    </tr>
					
                    <%for(Calculator c:list){ %>
                    	<tr>
                    	<td><%= count++%></td>
                    	<%String chkin =  c.getCheckIn();%>
	                    <%String str = chkin.substring(0, 10);%>
                    	<td><%=str%></td>
                    	<%String chkout =  c.getCheckOut();%>
	                    <%String str2 = chkout.substring(0, 10);%>
                    	<td><%= str2%></td>
                    	<td><%= c.getUserName()%></td>
                    	<td><%= c.getPrice()%></td>
                    	<% int money= c.getPrice();%>
                    	<td><%= Math.round(money*0.1)%></td>
                    	<%if(c.getPriceEndDate()!=null){
                    		String mdate =  c.getPriceEndDate();
	                    	String str3 = mdate.substring(0, 10);%>
                    	<td><%= str3%></td>
	                    <%}else{
	                    	String str4 = "-";%>
	                    <td><%= str4%></td>
	                    	<%}%>
                    	</tr>
                    <%} %>
                    </table>
                        <br/>
                        <br/>
						<div style="text-align:right;'">
						<%for(Calculator c:list){ 

							total = c.getPrice();
							sum += total;
							fee = c.getPrice();
							int minus = (int)Math.round(fee*0.1);
							isum += minus;
							
						} %>
						<div style="margin-bottom:50px;">
						<span>이번 달 총 정산 금액 : <span> <%=sum-isum %><span>원</span>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
<div style="bottom:0;">
<%@ include file="/views/common/footer.jsp" %>
</div>
    
<script>
	function end(){
		
		location.replace('<%=request.getContextPath()%>/sitter/calculatorEnd?month='+event.target.value);
	}
	</script>

    <!-- Optional JavaScript -->
    <!— jQuery first, then Popper.js, then Bootstrap JS —>
   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
