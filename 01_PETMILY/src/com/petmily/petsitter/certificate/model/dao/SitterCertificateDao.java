package com.petmily.petsitter.certificate.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;


import static com.petmily.common.JDBCTemplate.close;

import com.petmily.petsitter.model.vo.PetSitterCertificate;


public class SitterCertificateDao {

	
	private Properties prop = new Properties();
	
	public SitterCertificateDao() {
		try {
			String path=SitterCertificateDao.class.getResource("/sql/petsitter/certificate-query.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public PetSitterCertificate selectCertificate(Connection conn,String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PetSitterCertificate pc = null;
		String sql = prop.getProperty("selectCertificate");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id); 
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				pc= new PetSitterCertificate();
				pc.setCertificateName(rs.getString("CERTIFICATE_NAME"));
				pc.setCertificationNmae(rs.getString("CERTIFICATION_NAME"));
				pc.setDateOfAcquisition(rs.getString("DATE_OF_ACQUISITION"));
				pc.setExpirationDate(rs.getString("EXPIRATION_DATE"));
				pc.setCertificateFilename(rs.getString("CERTIFICATE_FILENAME"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return pc;
	}
}
