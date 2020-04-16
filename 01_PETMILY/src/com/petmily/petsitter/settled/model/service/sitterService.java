package com.petmily.petsitter.settled.model.service;

import static com.petmily.common.JDBCTemplate.getConnection;
import static com.petmily.common.JDBCTemplate.close;

import java.sql.Connection;
import java.util.List;

import com.petmily.petsitter.settled.model.vo.PetReservation;

public class sitterService {
	
	private sitterDao dao = new sitterDao();
	
//	
	public List<PetReservation> settledList(String id) {
		Connection conn = getConnection();
		List<PetReservation> list = dao.settledList(conn, id);
		close(conn);
		return list;
	}
}
