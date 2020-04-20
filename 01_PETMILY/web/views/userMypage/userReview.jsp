<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@page import="java.util.List,com.petmily.userReview.model.vo.UserReview,java.util.*" %>
<%@ include file="/views/common/header.jsp" %>

<%
	List<UserReview> list=(List)request.getAttribute("list");
	int count=1;
%>

<style>
   *{   
       
        box-sizing: border-box;
        font-family: 'Noto Sans KR', sans-serif;
    }
    html, body,section,form {
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
        padding: 0;
        margin: 0;
        height: 100%;
    }
    .menu{
            width: 230px;
            /* border: 1px solid yellow; */
            margin-top: 50px;
            height: 100%;
            
        }
    #menu{
        width: 230px;
        /* position : fixed; */
        height: 100%;
    }
    ul{
        padding-inline-start:0;
    }
    .title{
        font-size: 14px;
    }
    .content{
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
            margin-left: 0;
            width: 10%;
        }
    table{
        border-radius: 5px;
        margin-left: auto;
        margin-right: auto;
        border-collapse: collapse;
 	}
    td{
        border-top: 1px solid grey;
        border-bottom: 1px solid grey;
		text-align: center;
    }

    th{
        width: 150px;
        font-size: 12px;
        text-align: center;
        background-color: rgb(189, 188, 188);
        color: grey;
        border-right: 1px solid white;
    }

</style>

    <section>
        <div class="container">
            <form action="<%=request.getContextPath()%>" method="post" onsubmit="return test();" enctype="multipart/form-data">
            <div class="row">
            
            <%@ include file="/views/user/userSideBar.jsp"  %>
            
            <div class="vl"></div>
            <div class="col-9" style="padding:0;">
                <div class="row top-div" style="height: 200px;overflow: hidden;">
                    <img class="top-img" style="width: 100%; margin-top: -230px;" src="https://images.unsplash.com/flagged/photo-1548245643-7b805f2f93d5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80">
                </div>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item">회원 정보</li>
                    <li class="breadcrumb-item active">작성 후기</li>
                </ul>
                   <!-- 콘텐츠 영역 -->
                   <table id="enrollTB">
					
                    <tr class="tr-blank">
                        <th class="no">No</th>
            			<th class="star">별점</th>
            			<th class="reviewText">내용</th>
            			<th class="name">펫시터 이름</th>
                        <th class="ckDate">체크 인</th>
                        <th class="ckDate">체크 아웃</th>
                        <th>작성 후기</th>
                    </tr>
                   <%for(UserReview ur:list){ %>
                   	<tr style="font-size: 12px;">
                   		<td><%=count++ %></td>
                   		<td class="starR on"><%for(int i=0;i<ur.getReviewStar();i++){%><span>⭐</span><%}%></td>
                   		<td><%=ur.getReviewText() %></td>
                   		<td><%=ur.getPetsitterName() %></td>
                   		<td><%=ur.getCheckIn() %></td>
                   		<td><%=ur.getCheckOut() %></td>
                   		<td><a href="javascript:void(0);" 
                   		onclick="location.replace('<%=request.getContextPath()%>/BoardList.do?boardCode=<%=ur.getBoardCode() %>')" style="color: gray;" >작성글 보기</a></td>
                   	</tr>
                   <%} %>
						
                </table>
<br><br><br><br><br>
                    </div>
                </div>
            </div>
        </form>
        </div>
    </section>
    
    
    
<style>
	.no{
		width:40px;
	}
	.star{
		width:150px;
	}
	.reviewText{
		width: 250px;
	}
	.name{
		width:100px;
	}


</style>

<script>
	
</script>


<%@ include file="/views/common/footer.jsp" %>