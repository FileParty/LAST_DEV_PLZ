package com.petmily.reservation.model.dao;

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

import com.petmily.board.model.dao.BoardDao;
import com.petmily.pet.model.vo.Pet;
import com.petmily.reservation.model.vo.PetReservation;
public class ReservationDao {
	
	private Properties prop = new Properties();

	public ReservationDao() {
		
		try {
			String path = BoardDao.class.getResource("/sql/rev/rev-query.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<PetReservation> requestRev(Connection conn,String id) {
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		PetReservation pr = null;
		List<PetReservation> list = new ArrayList();
		String sql = prop.getProperty("requestRev");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				pr = new PetReservation();
				
				pr.setReservationCode(rs.getInt("RCODE"));
				pr.setCheckIn(rs.getString("CIN"));
				pr.setCheckOut(rs.getString("COUT"));
				pr.setResType(rs.getString("RTYPE"));
				pr.setPrice(rs.getInt("PRICE"));
				pr.setBoardNo(rs.getInt("PCODE"));
				list.add(pr);
			}
			System.out.println("dao"+list);
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	
	public PetReservation requestRevs(Connection conn,String id,PetReservation p) {
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		String sql = prop.getProperty("requestRevs");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1,p.getBoardNo());
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				p.setBoardNo(rs.getInt("BCODE"));
				p.setBoardTitle(rs.getString("BTITLE"));
				p.setSitterName(rs.getString("UNAME"));
				
			}
		
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return p;
	}
	
	public int requestCancel(Connection conn,int no) {
		PreparedStatement pstmt = null;
		System.out.println("dao"+no);
		int result =0 ;
		String sql = prop.getProperty("requestCancel");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public List<PetReservation> reservation(Connection conn,String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PetReservation pr = null;
		List<PetReservation> list = new ArrayList();
		String sql = prop.getProperty("reservation");
		try { 
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				pr = new PetReservation();
				pr.setPetImg(rs.getString("PET_IMG_FILENAME"));
				pr.setReservationCode(rs.getInt("RESERVATION_CODE"));
				pr.setPetCode(rs.getInt("PET_CODE"));
				pr.setBoardNo(rs.getInt("BOARD_CODE"));
				pr.setPetName(rs.getString("PET_NAME"));
				pr.setCheckIn(rs.getString("CHECKIN_DATE"));
				pr.setCheckOut(rs.getString("CHECKOUT_DATE"));
				list.add(pr);
			}
			System.out.println("DAO"+list);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public PetReservation reservations(Connection conn,String id,PetReservation p) {
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		List<String> list = new ArrayList<String>();
		String sql = prop.getProperty("reservations");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, p.getBoardNo());
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				p.setBoardTitle(rs.getString("BOARD_TITLE"));
				list.add(rs.getString("PLUS_SERVICE_VALUES"));
				p.setPlusType(list);
			}
			System.out.println(p);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return p;
	}
	
	public PetReservation requestDetail(Connection conn,String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PetReservation pr = null;
		String sql = prop.getProperty("requestDetail");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				pr= new PetReservation();
				pr.setReservationCode(rs.getInt("RESERVATION_CODE"));
				pr.setUserId(rs.getString("USER_ID"));
				pr.setCheckIn(rs.getString("CHECKIN_DATE"));
				pr.setCheckOut(rs.getString("CHECKOUT_DATE"));
				pr.setPriceEndDate(rs.getString("PRICE_END_DATE"));
				pr.setPlusQuestion(rs.getString("PLUS_QUESTIONS"));
				pr.setPetSize(rs.getString("PET_SIZE"));
				pr.setPetBath(rs.getInt("PET_BATH"));
				pr.setPrice(rs.getInt("PRICE"));
				pr.setPetMedication(rs.getString("PET_MDEICATION"));
				pr.setPetPickup(rs.getString("PET_PICK_UP"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
			}
		return pr;
	}
	
	public PetReservation requestDetails(Connection conn,String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PetReservation pr = null;
		String sql = prop.getProperty("requestDetails");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				pr= new PetReservation();
				pr.setReservationCode(rs.getInt("RESERVATION_CODE"));
				pr.setUserId(rs.getString("USER_ID"));
				pr.setCheckIn(rs.getString("CHECKIN_DATE"));
				pr.setCheckOut(rs.getString("CHECKOUT_DATE"));
				pr.setPriceEndDate(rs.getString("PRICE_END_DATE"));
				pr.setPlusQuestion(rs.getString("PLUS_QUESTIONS"));
				pr.setPetSize(rs.getString("PET_SIZE"));
				pr.setPetBath(rs.getInt("PET_BATH"));
				pr.setPrice(rs.getInt("PRICE"));
				pr.setPetMedication(rs.getString("PET_MDEICATION"));
				pr.setPetPickup(rs.getString("PET_PICK_UP"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
			}
		return pr;
	}
	
	public PetReservation addPay(Connection conn,int revNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PetReservation pr = null;
		String sql = prop.getProperty("addPay");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, revNo);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				pr = new PetReservation();
				pr.setFinalyPrice(rs.getInt("FINALY_PRICE"));
				pr.setSurchargeText(rs.getString("SURCHARGE_TEXT"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return pr;
	}
	
	
	

}
