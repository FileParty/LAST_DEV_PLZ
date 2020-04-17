package com.petmily.petsitterMyPage.reservation.model.dao;

import static com.petmily.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.petmily.petsitterMyPage.reservation.model.vo.PetsitterMypageDetail;
import com.petmily.petsitterMyPage.reservation.model.vo.PetsitterMypagePetprofile;
import com.petmily.petsitterMyPage.reservation.model.vo.PetsitterMypageReservation;
import com.petmily.petsitterMyPage.reservation.model.vo.PetsitterMypageUserReview;
import com.petmily.userReview.model.dao.UserReviewDao;

public class PetsitterMypageReservationDao {

	private Properties prop=new Properties();
	
public PetsitterMypageReservationDao() {
		
		try {
			String path=UserReviewDao.class.getResource("/sql/petsitterMypageReservation/petsitterMypageReservation-properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

public List<PetsitterMypageReservation> selectBeforePaymentRerservation(Connection conn,String sitterId){
	
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	List<PetsitterMypageReservation> list=new ArrayList<PetsitterMypageReservation>();
	
	String sql=prop.getProperty("selectBeforePaymentRerservation");
	
	try {
		
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, sitterId);
		
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
			
			PetsitterMypageReservation pmr=new PetsitterMypageReservation();
			
			pmr.setReservationCode(rs.getInt("reservation_code"));
			pmr.setUserId(rs.getString("user_id"));
			pmr.setPetsitterId(rs.getString("pet_setter_id"));
			pmr.setBoardCode(rs.getInt("board_code"));
			pmr.setCheckInDate(rs.getDate("checkin_date"));
			pmr.setCheckOutDate(rs.getDate("checkout_date"));
			pmr.setPlusQuestions(rs.getString("plus_questions"));
			pmr.setPriceEndDate(rs.getDate("price_end_date"));
			pmr.setPrice(rs.getInt("price"));
			pmr.setResType(rs.getString("res_type"));
			pmr.setPetMedication(rs.getString("pet_mdeication"));
			pmr.setPetPickUp(rs.getString("pet_pick_up"));
			pmr.setUserName(rs.getString("user_name"));
			
			list.add(pmr);
		}
	}catch(SQLException e) {
		e.printStackTrace();
	}finally {
		close(rs);
		close(pstmt);
	}
	return list;
}
	
	
	// 펫시터 마이페이지 안에 예약 신청한 유저에 대한 펫시터가 남긴 후기들
	public List<PetsitterMypageUserReview> selectPetsitterMypageUserReview(Connection conn,String userId){
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		List<PetsitterMypageUserReview> list=new ArrayList<PetsitterMypageUserReview>();
		
		String sql=prop.getProperty("selectPetsitterMypageUserReview");
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				PetsitterMypageUserReview pmur=new PetsitterMypageUserReview();
				
				pmur.setUserId(rs.getString("user_id"));
				pmur.setUserName(rs.getString("user_name"));
				pmur.setPetsitterId(rs.getString("pet_sitter_id"));
				pmur.setReviewText(rs.getString("review_text"));
				pmur.setReviewStar(rs.getInt("review_star"));
			
				list.add(pmur);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			
			close(rs);
			close(pstmt);
		}return list;
		
	}
	
	
	public int updateStatus(Connection conn, int pcode) {
		PreparedStatement pstmt=null;
		int result=0;
		String status="진행";
		String sql=prop.getProperty("updateStatus");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,status);
			pstmt.setInt(2, pcode);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
	
	public int updateStatusRefusal(Connection conn, int pcode) {
		PreparedStatement pstmt=null;
		int result=0;
		String status="취소";
		String sql=prop.getProperty("updateStatus");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,status);
			pstmt.setInt(2, pcode);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public List<PetsitterMypageDetail> selectBeforePaymentDetail(Connection conn, int rsCode) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<PetsitterMypageDetail> list = new ArrayList<PetsitterMypageDetail> ();
		
		String sql=prop.getProperty("selectBeforePaymentDetail");
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, rsCode);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				PetsitterMypageDetail pmd =new PetsitterMypageDetail();
				
				pmd.setUserId(rs.getString("user_id"));
				pmd.setPetsitterId(rs.getString("pet_setter_id"));
				pmd.setBoardCode(rs.getInt("board_code"));
				pmd.setCheckInDate(rs.getString("checkin_date"));
				pmd.setCheckOutDate(rs.getString("checkout_date"));
				pmd.setPetBath(rs.getInt("PET_BATH"));
				pmd.setPetBathTxt(rs.getString("PET_BATH_TEXT"));
				pmd.setPetCode(rs.getInt("PET_CODE"));
				pmd.setPetMedication(rs.getString("pet_mdeication"));
				pmd.setPetPickUp(rs.getString("pet_pick_up"));
				pmd.setPetSize(rs.getString("PET_SIZE"));
				pmd.setPlusQuestions(rs.getString("plus_questions"));
				pmd.setPrice(rs.getInt("price"));
				pmd.setPriceEndDate(rs.getString("price_end_date"));
				pmd.setReservationCode(rs.getInt("reservation_code"));
				pmd.setResType(rs.getString("res_type"));
				
				list.add(pmd);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			
			close(rs);
			close(pstmt);
		}
		System.out.println("가져오는 값"+list);
		return list;
		
	}
	
	public List<PetsitterMypagePetprofile> selectPetprofile(Connection conn, int rsCode){
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<PetsitterMypagePetprofile> list = new ArrayList<PetsitterMypagePetprofile> ();
		
		String sql=prop.getProperty("selectPetProfile");
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, rsCode);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				PetsitterMypagePetprofile pmp =new PetsitterMypagePetprofile();
				
				pmp.setUserId(rs.getString("user_id"));
				pmp.setPetsitterId(rs.getString("pet_setter_id"));
				pmp.setBoardCode(rs.getInt("board_code"));
				pmp.setCheckInDate(rs.getString("checkin_date"));
				pmp.setCheckOutDate(rs.getString("checkout_date"));
				pmp.setPlusQuestions(rs.getString("plus_questions"));
				pmp.setPriceEndDate(rs.getString("price_end_date"));
				pmp.setPrice(rs.getInt("price"));
				pmp.setResType(rs.getString("res_type"));
				pmp.setPetMedication(rs.getString("pet_mdeication"));
				pmp.setPetPickUp(rs.getString("pet_pick_up"));
				pmp.setPetSize(rs.getString("PET_SIZE"));
				pmp.setPetBath(rs.getInt("PET_BATH"));
				pmp.setPetBathTxt(rs.getString("PET_BATH_TEXT"));
				pmp.setPetCode(rs.getInt("PET_CODE"));
				pmp.setPetCode(rs.getInt("pet_code"));
				pmp.setPetName(rs.getString("pet_name"));
				pmp.setPetGender(rs.getString("pet_gender"));
				pmp.setPetKind(rs.getString("pet_kind"));
				pmp.setPetWeight(rs.getString("pet_weight"));
				pmp.setPetAge(rs.getString("PET_AGE"));
				pmp.setPetAffinity(rs.getString("pet_affinity"));
				pmp.setPetNeutralization(rs.getString("pet_neutralization"));
				pmp.setPetDisease(rs.getString("pet_disease"));
				pmp.setPetDiseaseTxt(rs.getString("pet_disease_text"));
				pmp.setPetSeparation(rs.getString("pet_separation"));
				pmp.setPetSeparationTxt(rs.getString("pet_separation_text"));
				pmp.setPetUrine(rs.getString("pet_urine"));
				pmp.setPetUrineTxt(rs.getString("pet_urine_text"));
				pmp.setPetIndoor(rs.getString("pet_indoor_marking"));
				pmp.setPetIndoorTxt(rs.getString("pet_indoor_marking_text"));
				pmp.setPetHowling(rs.getString("pet_howling"));
				pmp.setPetHowlingTxt(rs.getString("pet_howling_text"));
				pmp.setHeartDisease(rs.getString("heart_disease"));
				pmp.setVaccine(rs.getString("vaccine"));
				pmp.setCorona(rs.getString("corona_enteritis"));
				pmp.setKennel(rs.getString("kennel_corp"));
				pmp.setHospitalName(rs.getString("animal_hospital_name"));
				pmp.setHospitalPhone(rs.getString("animal_hospital_phone"));
				pmp.setHospitalZip(rs.getString("animal_hospital_zip_code"));
				pmp.setHospitalAddress(rs.getString("animal_hospital_address"));
				pmp.setDetail(rs.getString("ah_detailed_address"));
				pmp.setPetImg(rs.getString("pet_img_filename"));
				pmp.setRegistration(rs.getString("pet_registration_values"));
				
				list.add(pmp);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			
			close(rs);
			close(pstmt);
		}
		System.out.println("가져오는 값"+list);
		return list;
		
	}
	
}
