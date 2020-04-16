package com.petmily.petsitter.settled.model.service;

import static com.petmily.common.JDBCTemplate.getConnection;
import static com.petmily.common.JDBCTemplate.close;

import java.sql.Connection;
import java.util.List;

import com.petmily.petsitter.settled.model.dao.SitterDao;
import com.petmily.petsitter.settled.model.vo.PetReservation;

public class sitterService {
	
	private SitterDao dao = new SitterDao();
	
//	
	public List<PetReservation> settledList(String id) {
		Connection conn = getConnection();
		List<PetReservation> list = dao.settledList(conn, id);
		close(conn);
		return list;
	}
}
