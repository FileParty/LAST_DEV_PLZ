package com.petmily.petsitterMyPage.reservation.service;

import static com.petmily.common.JDBCTemplate.close;
import static com.petmily.common.JDBCTemplate.commit;
import static com.petmily.common.JDBCTemplate.getConnection;
import static com.petmily.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.petmily.petsitterMyPage.reservation.model.dao.PetsitterMypageReservationDao;
import com.petmily.petsitterMyPage.reservation.model.vo.PetsitterMypageDetail;
import com.petmily.petsitterMyPage.reservation.model.vo.PetsitterMypagePetprofile;
import com.petmily.petsitterMyPage.reservation.model.vo.PetsitterMypageReservation;
import com.petmily.petsitterMyPage.reservation.model.vo.PetsitterMypageUserReview;

public class PetsitterMypageReservationService {

	// 펫시터 마이페이지의 예약신청 리스트가 담긴 dao
	private PetsitterMypageReservationDao dao=new PetsitterMypageReservationDao();
	
	
	public List<PetsitterMypageReservation> selectBeforePaymentRerservarion(String sitterId){
		
		Connection conn=getConnection();
		
		List<PetsitterMypageReservation> list=dao.selectBeforePaymentRerservation(conn,sitterId);
		
		close(conn);
		
		return list;
		
	}
	
	// 펫시터 마이페이지 안에 예약 신청한 유저에 대한 펫시터가 남긴 후기들
	public List<PetsitterMypageUserReview> selectPetsitterMypageUserReview(String userId){
		
		Connection conn=getConnection();
		
		List<PetsitterMypageUserReview> list=dao.selectPetsitterMypageUserReview(conn,userId);
		
		close(conn);
		
		return list;
		
	}
	
	public List<PetsitterMypageDetail> selectBeforePaymentDetail(int rsCode) {
		Connection conn=getConnection();
		List<PetsitterMypageDetail> list = dao.selectBeforePaymentDetail(conn,rsCode);
		close(conn);
		return list;
	}
	
	
	public int updateStatus(int[] pcodes) {
		
		Connection conn=getConnection();
		int result=0;
		for(int pcode : pcodes) {
			result+=dao.updateStatus(conn,pcode);
		}
		if(result==pcodes.length) {
			commit(conn); close(conn);
		}
		else {
			rollback(conn);
			close(conn);
		}
		return result;
	}
	
	public int updateStatusRefusal(int[] pcodes) {
		
		Connection conn=getConnection();
		int result=0;
		for(int pcode : pcodes) {
			result+=dao.updateStatusRefusal(conn,pcode);
		}
		if(result==pcodes.length) {
			commit(conn); close(conn);
		}
		else {
			rollback(conn);
			close(conn);
		}
		return result;
	}
	
	public List<PetsitterMypagePetprofile> selectPetprofile(int rsCode){
		Connection conn=getConnection();
		List<PetsitterMypagePetprofile> list = dao.selectPetprofile(conn,rsCode);
		close(conn);
		return list;
		
	}
	
}
