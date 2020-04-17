<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.List,com.petmily.petsitterMyPage.reservation.model.vo.PetsitterMypagePetprofile" %>
<%
	
	List<PetsitterMypagePetprofile> list = (List)request.getAttribute("list");
	int count =1;
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청 상세 내용.</title>
<style>
   table{
        border-radius: 5px;
        margin-left: auto;
        margin-right: auto;
        border-collapse: collapse;
 	}
    td{
    	font-size : 12px;
        border-top: 1px solid rgb(189, 188, 188);
        border-bottom: 1px solid rgb(189, 188, 188);
        background-color: snow;
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
   h3,p{
   	text-align: center;
   }
</style>
</head>
<body>

<div>
	<h3>펫 프로필 정보</h3>
	<hr/>
	<br/>
	<%if(!list.isEmpty()) {%>
		<%for(PetsitterMypagePetprofile pmp:list){ %>
			<table>
			<tr>
			<th>no</th>
			<td><%=count++ %></td>
			</tr>
			<tr>
			<th>사진</th>
			<%if(pmp.getPetImg()!=null) {%>
			<td><img src="<%=request.getContextPath()%>/upload/pet/<%=pmp.getPetImg()%>" width="200px"/></td>
			<%}else{ %>
			<td><p>없음</p></td>
			<%} %>
			</tr>
			<tr>
			<th>강아지 이름</th>
			<td><%=pmp.getPetName()%></td>
			</tr>
			<tr>
			<th>성별</th>
			<td><%=pmp.getPetGender()%></td>
			</tr>
			<tr>
			<th>품종</th>
			<td><%=pmp.getPetKind()%></td>
			</tr>
			<tr>
			<th>생년월일</th>
				<%String birth = pmp.getPetAge();
	            String str = birth.substring(0, 10); %>
			<td><%=str%></td>
			</tr>
			<tr>
			<th>무게</th>
			<td><%=pmp.getPetWeight()%></td>
			</tr>
			<tr>
			<th>반려동물 등록 유무</th>
			<td><%=pmp.getRegistration()%></td>
			</tr>
			
			<tr>
			<th>친화적인지?</th>
			<td><%=pmp.getPetAffinity()%></td>
			</tr>
			<tr>
			<th>중성화 수술 여부</th>
			<td><%=pmp.getPetNeutralization()%></td>
			</tr>
			<tr>
			<th>지병 유무</th>
			<td><%=pmp.getPetDisease()%></td>
			</tr>
			<%if(pmp.getPetDiseaseTxt()!=null) {%>
			<tr>
				<th>지병 관련 멘트</th>
				<td><%=pmp.getPetDiseaseTxt()%></td>
				</tr>
			<%} %>
			<tr>
			<th>분리불안 유무</th>
			<td><%=pmp.getPetSeparation()%></td>
			</tr>
			<%if(pmp.getPetSeparationTxt()!=null) {%>
				<tr>
				<th>분리불안 관련 멘트</th>
				<td><%=pmp.getPetSeparationTxt()%></td>
				</tr>
			<%} %>
			<tr>
			<th>대소변을 가리는지?</th>
			<td><%=pmp.getPetUrine()%></td>
			</tr>
			<%if(pmp.getPetUrineTxt()!=null) {%>
				<tr>
				<th>대소변 관련 멘트</th>
				<td><%=pmp.getPetUrineTxt()%></td>
				</tr>
			<%} %>
			<tr>
			<th>실내 마킹 유무</th>
			<td><%=pmp.getPetIndoor()%></td>
			</tr>
			<%if(pmp.getPetIndoorTxt()!=null) {%>
				<tr>
				<th>실내 마킹 멘트</th>
				<td><%=pmp.getPetIndoorTxt()%></td>
				</tr>
			<%} %>		
			<tr>
			<th>잘 짖나요?</th>
			<td><%=pmp.getPetHowling()%></td>
			</tr>
			<%if(pmp.getPetHowlingTxt()!=null) {%>
				<tr>
				<th>짖음 관련 멘트</th>
				<td><%=pmp.getPetHowlingTxt()%></td>
				</tr>
			<%} %>	
			<tr>
			<th>심장사상충 약 복용여부</th>
			<td><%=pmp.getHeartDisease()%></td>
			</tr>
			<tr>
			<th>종합 7종 백신 여부</th>
			<td><%=pmp.getVaccine()%></td>
			</tr>
			<tr>
			<th>켄넬코프 접종 여부</th>
			<td><%=pmp.getKennel()%></td>
			</tr>
			<tr>
			<th>동물병원명</th>
			<td><%=pmp.getHospitalName()%></td>
			</tr>
			<tr>
			<th>동물병원 우편번호</th>
			<td><%=pmp.getHospitalZip()%></td>
			</tr>
			<tr>
			<th>동물병원 주소</th>
			<td><%=pmp.getHospitalAddress()%></td>
			</tr>
			<tr>
			<th>동물병원 상세주소</th>
			<td><%=pmp.getDetail()%></td>
			</tr>
			</table>
			
			<br/>
		<%} %>
		
	<%}else{ %>
	
		<p>내용이 없습니다.</p>
		
	<%} %>
</div>


</body>
</html>