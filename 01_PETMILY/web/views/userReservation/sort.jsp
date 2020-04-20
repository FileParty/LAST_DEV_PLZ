<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List,com.petmily.reservation.model.vo.PetReservation" %>
    <%
    List<PetReservation> list = (List)request.getAttribute("list");
    System.out.println("테스트jsp:" + list);
    %>
<!DOCTYPE html>
<html>

<body>

    <table class="table table-hover">

                    <tr style="border-bottom:1px solid lightgray;" class="tr-blank">
                        <th>no</th>
            			<th>선택</th>
            			<th>체크인</th>
                        <th>체크 아웃</th>
                        <th>펫시터 명</th>
                        <th>제목</th>
                        <th>요청 상세</th>
                        <th>상태</th>
                        <th>총 금액</th>
                     
                    </tr>
                    <%for(PetReservation pr : list) {%>
                   	
	                    <tr align="center">
	                    
	                    	
	                    	<td><%=pr.getReservationCode() %></td> 
	                    	
	                    	<td><input type="checkbox" class="choose" name="choose" value="<%=pr.getReservationCode()%>"></td>	                    	                    	
	                    	
	                    	<td style="width:250px;"><%=pr.getCheckIn().substring(2,11)%></td>
	                    	
	                    	<td style="width:250px;"><%=pr.getCheckOut().substring(2,11)%></td>
	                    	
							<td style="width:280px;"><%=pr.getSitterName() %></td>
							
							<td style="width:600px;"><%=pr.getBoardTitle() %></td>
							
							<td><input style="border-radius:20px;font-size:13px;"class="btn btn-outline-secondary" style="width:100px;"onclick="requestCheck()" type="button" id="request" value="상세 요청 확인"></td>
							<td><%=pr.getResType() %></td> 
							
							<td><%=pr.getPrice() %></td> 
							
							
						
	                    </tr>
	                   
	             <%} %>
    					
                    
                </table>
            
</html>