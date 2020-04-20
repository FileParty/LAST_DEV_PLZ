package com.petmily.board.service;

import static com.petmily.common.JDBCTemplate.close;
import static com.petmily.common.JDBCTemplate.commit;
import static com.petmily.common.JDBCTemplate.getConnection;
import static com.petmily.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.petmily.board.model.dao.BoardDao2;
import com.petmily.board.model.vo.PetSitterBoard;

public class BoardService2 {
   private BoardDao2 dao = new BoardDao2();
   
   public int boardInsert(PetSitterBoard  pb) {
      //게시글 등록
      Connection conn = getConnection();
      
     
      int setting = dao.setting(conn,pb.getUserId());
      
    
      
 
	     int result = dao.boardInsert(conn, pb);
	     System.out.println("dao1 res :" +pb.getBoardNo());
	     int boardNo = dao.boardNo(conn,pb.getUserId());
	     System.out.println("service넘버:"+boardNo);
	      pb.setBoardNo(boardNo);
	      if(result>0) {
	    	  
	         for(String img : pb.getBoardImages()) {
	        	 if(img!=null) {
	            result = dao.boardImg(conn, pb,img);
	        	 }
	         }
	         if(result>0) {
	            for(String plus : pb.getPlus()) {
	            	if(plus!=null) { 
	            	if(plus.equals("추가할인")) {
	               result = dao.addSale(conn,plus,pb,pb.getBoardNo());
	            	}else if(plus.equals("노견케어")) {	            		
	            		 result = dao.oldCare(conn,plus,pb.getBoardNo());
	            	}else if(plus.equals("목욕가능")) {
	            		 result = dao.showerOn(conn,plus,pb,pb.getBoardNo());
	            	}else if(plus.equals("약물복용")) {
	            		 result = dao.drug(conn,plus,pb.getBoardNo());
	            	}else if(plus.equals("집앞픽업")) {
	            		 result = dao.pickUp(conn,plus,pb,pb.getBoardNo());
	            	}
	            }
	            }
	         }else {
	            rollback(conn);
	         }
	         if(result>0) {
	            for(String defaults : pb.getServiceTypes()) {
	            	System.out.println("서비스 기본타입 : "+defaults);
	            	 if(defaults!=null) {
	            		
	            		 result = dao.defaultOption(conn,defaults,pb.getBoardNo());
	            	
	            	 }else {
	            rollback(conn);
	         }
	      }
	         }
	      }
	      commit(conn);
        close(conn);
      return result;
   }
   
   public PetSitterBoard boardDetail(String userId,int no) {
      Connection conn = getConnection();
      PetSitterBoard pb = new PetSitterBoard();
      pb = dao.boardDetail(conn,userId,no);
      pb = dao.imgDetail(conn,pb,no);     
      pb= dao.defaultOptionDetail(conn,pb,no);   
      pb = dao.plusOptionDetail(conn,pb,no);
      
         close(conn);
      
      return pb;
   }
   
   
   public PetSitterBoard boardUpdate(String userId) {
	   Connection conn = getConnection();
	   PetSitterBoard pb = new PetSitterBoard();
	   	  pb = dao.boardUpdate(conn,userId);
	  
	      pb = dao.imgUpdate(conn,pb);
	    
	      pb = dao.plusOptionUpdate(conn,pb);
	      
	      pb= dao.defaultOptionUpdate(conn,pb);
	    
	      close(conn);
	      return pb;
   }
   
   public List<PetSitterBoard> selectList(String userId,int cPage,int numPerPage) {
	   
	   Connection conn = getConnection();
	   List<PetSitterBoard> list = dao.selectList(conn,userId,cPage,numPerPage);
	   close(conn);
	   return list;
   }
   
   public int mainButton(String userId) {
	   Connection conn = getConnection();
	   int result = dao.mainButton(conn, userId);
	   close(conn);
	   return result;
   }
   
   public int boardCount(String userId) {
	   Connection conn = getConnection();
	   int count = dao.boardCount(conn,userId);
	   close(conn);
	   return count;
   }
   
   
}