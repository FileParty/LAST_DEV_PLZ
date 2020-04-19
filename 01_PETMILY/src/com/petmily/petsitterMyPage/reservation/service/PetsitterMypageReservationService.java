package com.petmily.petsitterMyPage.reservation.service;

import static com.petmily.common.JDBCTemplate.close;
import static com.petmily.common.JDBCTemplate.commit;
import static com.petmily.common.JDBCTemplate.getConnection;
import static com.petmily.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.petmily.petsitterMyPage.reservation.model.dao.PetsitterMypageReservationDao;
import com.petmily.petsitterMyPage.reservation.model.vo.PetsitterMypageDetail;
import com.petmily.petsitterMyPage.reservation.model.vo.PetsitterMypageExtraFee;
import com.petmily.petsitterMyPage.reservation.model.vo.PetsitterMypagePetprofile;
import com.petmily.petsitterMyPage.reservation.model.vo.PetsitterMypageReservation;
import com.petmily.petsitterMyPage.reservation.model.vo.PetsitterMypageUserReview;
import com.petmily.petsitterReview.model.vo.PetSitterReview;

public class PetsitterMypageReservationService {

	// 펫시터 마이페이지의 예약신청 리스트가 담긴 dao
	private PetsitterMypageReservationDao dao=new PetsitterMypageReservationDao();
	
	
	
	public PetsitterMypageReservation afterPaymentSecret(String sitterId,int rsCode) {
		Connection conn=getConnection();
		
		PetsitterMypageReservation pmr = dao.afterPaymentSecret(conn,sitterId,rsCode);
		
		close(conn);
		
		System.out.println("pmr값"+pmr);
		return pmr;
		
		
	}
	
	public PetSitterReview selectSecret(int rsCode) {
		
		Connection conn=getConnection();
		
		PetSitterReview psr = dao.selectSecret(conn,rsCode);
		
		close(conn);
		
		return psr;
		
	}
	
	public int insertSecret(PetSitterReview psr) {
		
		Connection conn = getConnection();
		
		int result = dao.insertSecret(conn,psr);
		
		if(result>0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		System.out.println("결과"+result);
		return result;
		
		
	}
	
	public List<PetsitterMypageReservation> selectBeforePaymentRerservarion(String sitterId){
		
		Connection conn=getConnection();
		
		List<PetsitterMypageReservation> list=dao.selectBeforePaymentRerservation(conn,sitterId);
		
		close(conn);
		
		return list;
		
	}
	
	
	public PetsitterMypageExtraFee extraFee(String sitterId){
		Connection conn=getConnection();
		
		PetsitterMypageExtraFee pme = dao.extraFee(conn,sitterId);
		
		close(conn);
		
		return pme;
	}
	
	public PetsitterMypageExtraFee extraFeeDetail(int rsCode) {
		Connection conn=getConnection();
		
		PetsitterMypageExtraFee pme = dao.extraFeeDetail(conn,rsCode);
		
		close(conn);
		
		return pme;		
	}
	
	public List<PetsitterMypageReservation> selectAfterPaymentRerservarion(String sitterId){
		
		Connection conn=getConnection();
		
		List<PetsitterMypageReservation> list=dao.selectAfterPaymentRerservation(conn,sitterId);
		
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
	
	public int end(int[] pcodes) {
		
		Connection conn=getConnection();
		int result=0;
		for(int pcode : pcodes) {
			result+=dao.end(conn,pcode);
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
