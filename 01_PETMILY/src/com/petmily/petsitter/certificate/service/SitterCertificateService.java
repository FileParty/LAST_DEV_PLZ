package com.petmily.petsitter.certificate.service;

import static com.petmily.common.JDBCTemplate.getConnection;
import static com.petmily.common.JDBCTemplate.close;

import java.sql.Connection;

import com.petmily.petsitter.certificate.model.dao.SitterCertificateDao;
import com.petmily.petsitter.model.vo.PetSitterCertificate;

public class SitterCertificateService {
	
	private SitterCertificateDao dao = new SitterCertificateDao();
	
	public PetSitterCertificate selectCertificate(String id) {
		Connection conn = getConnection();
		PetSitterCertificate pc = dao.selectCertificate(conn,id);
		 close(conn);
		 return pc;
	}

}
