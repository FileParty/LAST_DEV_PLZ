package com.petmily.petsitterMyPage.reservation.service;

import static com.petmily.common.JDBCTemplate.getConnection;
import static com.petmily.common.JDBCTemplate.close;
import java.sql.Connection;
import java.util.List;

import com.petmily.petsitterMyPage.reservation.model.dao.PetsitterMypageReservationDao;
import com.petmily.petsitterMyPage.reservation.model.vo.PetsitterMypageReservation;

public class PetsitterMypageReservaionService {

	private PetsitterMypageReservationDao dao=new PetsitterMypageReservationDao();
	
	public List<PetsitterMypageReservation> selectBeforePaymentRerservarion(String petsitterId){
		
		Connection conn=getConnection();
		
		List<PetsitterMypageReservation> list=dao.selectBeforePaymentRerservation(conn,petsitterId);
		
		close(conn);
		
		return list;
		
	}
	
}
