package com.petmily.petsitterMyPage.reservation.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.petmily.petsitterMyPage.reservation.model.vo.PetsitterMypageReservation;
import com.petmily.userReview.model.dao.UserReviewDao;

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

import com.petmily.userReview.model.vo.UserReview;

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

	public List<PetsitterMypageReservation> selectBeforePaymentRerservation(Connection conn,String petsitterId){
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<PetsitterMypageReservation> list=new ArrayList<PetsitterMypageReservation>();
		
		String sql=prop.getProperty("selectBeforePaymentRerservation");
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, petsitterId);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				PetsitterMypageReservation pmr=new PetsitterMypageReservation();
				
				pmr.setReservationCode(rs.getInt("reservation_code"));
				pmr.setUserId(rs.getString("user_id"));
				pmr.setPetsitterId(rs.getString("pet_sitter_id"));
				pmr.setBoardCode(rs.getInt("board_code"));
				pmr.setCheckInDate(rs.getDate("checkin_date"));
				pmr.setCheckOutDate(rs.getDate("checkout_date"));
				pmr.setPlusQuestions(rs.getString("plus_questions"));
				pmr.setPriceEndDate(rs.getDate("price_end_date"));
				pmr.setPrice(rs.getInt("price"));
				pmr.setResType(rs.getString("res_type"));
				pmr.setPetMedication(rs.getString("pet_medication"));
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
}
