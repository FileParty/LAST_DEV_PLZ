package com.petmily.admin.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.petmily.admin.model.vo.AdminApplyDate;
import com.petmily.admin.model.vo.AdminPetsitter;
import com.petmily.admin.model.vo.AdminQuestion;
import com.petmily.admin.model.vo.AdminUser;
import com.petmily.admin.model.vo.ApplyUser;
import com.petmily.admin.model.vo.ApplyUserData;
import com.petmily.admin.model.vo.ServiceData;
import com.petmily.admin.model.vo.User;

import static com.petmily.common.JDBCTemplate.close;

public class AdminDao {
	
	Properties prop = new Properties();
	
	public AdminDao() {
		
		String path = AdminDao.class.getResource("/sql/admin/admin-query.properties").getPath();
		
		try {
			prop.load(new FileInputStream(path));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public ArrayList<AdminUser> userList(Connection conn, int cPage, int numPerPage, String type) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<AdminUser> list = new ArrayList<AdminUser>();
		String sql = prop.getProperty("userList");
		sql = sql.replaceAll("ORTYPERO",type);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AdminUser u = new AdminUser();
				u.setUserId(rs.getString("USER_ID"));
				u.setUserName(rs.getString("USER_NAME"));
				u.setUserBirth(rs.getString("USER_BIRTH_DAY"));
				u.setStarCount(rs.getDouble("STAR"));
				u.setBlindCount(rs.getInt("BCOUNT"));
				list.add(u);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return list;
	}

	public int userCount(Connection conn) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		String sql = prop.getProperty("userCount");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			count = Integer.parseInt(rs.getString(1));
			
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return count;
	}

	public ArrayList<ApplyUser> applyList(Connection conn, int cPage, int numPerPage, String type) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ApplyUser> list = new ArrayList<ApplyUser>();
		String sql = prop.getProperty("applyList");
		sql = sql.replaceAll("ORTYPERO",type);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ApplyUser au = new ApplyUser();
				au.setUserid(rs.getString("USER_ID"));
				au.setName(rs.getString("USER_NAME"));
				au.setEnrollDate(rs.getString("ENROLL_DATE"));
				au.setEmail(rs.getString("EMAIL"));
				list.add(au);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return list;
	}

	public int applyCount(Connection conn) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		String sql = prop.getProperty("applyCount");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			count = Integer.parseInt(rs.getString(1));
			
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return count;
	}

	public ApplyUserData applyUserData(Connection conn, String userId) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ApplyUserData aud = null;
		String sql = prop.getProperty("applyData");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				aud = new ApplyUserData();
				aud.setPET_SITTER_ID(rs.getString("PET_SITTER_ID"));
				aud.setPET_CERTIFICATE_YN(rs.getString("PET_CERTIFICATE_YN"));
				aud.setPET_SITTER_JOB(rs.getString("PET_SITTER_JOB"));
				aud.setPET_SITTER_FAMILY(rs.getString("PET_SITTER_FAMILY"));
				aud.setPET_SITTER_KEEP_PETS(rs.getString("PET_SITTER_KEEP_PETS"));
				aud.setPET_SITTER_ACTIVITY(rs.getString("PET_SITTER_ACTIVITY"));
				aud.setPET_SITTER_IMG(rs.getString("PET_SITTER_IMG"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return aud;
	}

	public ApplyUserData applyUserResVal(Connection conn, ApplyUserData aud) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("applyRes");
		ArrayList<String> vals = new ArrayList();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, aud.getPET_SITTER_ID());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String val = rs.getString("RESIDENCE_VALUE");
				vals.add(val);
			}
			aud.setRESIDENCE_VALUE(vals);
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return aud;
	}

	public ApplyUserData applyUserCerVal(Connection conn, ApplyUserData aud) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("applyCer");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, aud.getPET_SITTER_ID());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				aud.setCERTIFICATE_NAME(rs.getString("CERTIFICATE_NAME"));
				aud.setCERTIFICATION_NAME(rs.getString("CERTIFICATION_NAME"));
				aud.setDATE_OF_ACQUISITION(rs.getString("DATE_OF_ACQUISITION"));
				aud.setCERTIFICATE_FILENAME(rs.getString("CERTIFICATE_FILENAME"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return aud;
	}

	
	public User userData(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("userData");
		User u = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				u = new User();
				u.setUserId(rs.getString("USER_ID"));
				u.setUserName(rs.getString("USER_NAME"));
				u.setUserBirth(rs.getString("USER_BIRTH_DAY"));
				u.setPhone(rs.getString("PHONE"));
				u.setZipCode(rs.getString("ZIP_CODE"));
				u.setAddress(rs.getString("ADDRESS"));
				u.setDetAddress(rs.getString("DETAILED_ADDRESS"));
				u.setEmail(rs.getString("EMAIL"));
				u.setGender(rs.getString("GENDER"));
				u.setEnrollDate(rs.getString("ENROLL_DATE"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return u;
	}

	public int applyUpdate(Connection conn, String type, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("applyUTUpdate");
		try {
			pstmt = conn.prepareStatement(sql);
			if(type.equals("반려")) {
				pstmt.setString(1, "거절");
			} else {
				pstmt.setString(1, "펫시터");
			}
			pstmt.setString(2, userId);
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int applyCheck(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("applyCheck");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int applyUpdateEnd(Connection conn, String type, String userId, int result) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("applyPTUpdate");
		try {
			pstmt = conn.prepareStatement(sql);
			if(type.equals("반려")) {
				pstmt.setString(1, "거절");
			} else {
				if(result>0) {
					pstmt.setString(1, "프로펫시터");
				} else {
					pstmt.setString(1, "일반펫시터");
				}
			}
			pstmt.setString(2, userId);
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<ApplyUser> cancelList(Connection conn, int cPage, int numPerPage, String type) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ApplyUser> list = new ArrayList<ApplyUser>();
		String sql = prop.getProperty("cancelList");
		sql = sql.replaceAll("ORTYPERO",type);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ApplyUser au = new ApplyUser();
				au.setUserid(rs.getString("USER_ID"));
				au.setName(rs.getString("USER_NAME"));
				au.setEnrollDate(rs.getString("ENROLL_DATE"));
				au.setEmail(rs.getString("EMAIL"));
				list.add(au);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return list;
	}

	public int cancelCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		String sql = prop.getProperty("cancelCount");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			count = Integer.parseInt(rs.getString(1));
			
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return count;
	}

	public ArrayList<AdminPetsitter> petsitterList(Connection conn, int cPage, int numPerPage, String type) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<AdminPetsitter> list = new ArrayList<AdminPetsitter>();
		String sql = prop.getProperty("petsitterList");
		sql = sql.replaceAll("ORTYPERO",type);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AdminPetsitter u = new AdminPetsitter();
				u.setUserId(rs.getString("USER_ID"));
				u.setUserName(rs.getString("USER_NAME"));
				u.setEnrollDate(rs.getString("ENROLL_DATE"));
				u.setUserType(rs.getString("TYPE"));
				u.setStar(rs.getDouble("STAR"));
				u.setCerCount(rs.getInt("CERCOUNT"));
				list.add(u);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return list;
	}

	public int petsitterCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		String sql = prop.getProperty("petsitterCount");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			count = Integer.parseInt(rs.getString(1));
			
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return count;
	}

	public ArrayList<AdminPetsitter> petsitterCer(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<AdminPetsitter> list = new ArrayList<AdminPetsitter>();
		String sql = prop.getProperty("petsitterCer");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AdminPetsitter u = new AdminPetsitter();
				u.setCERTIFICATE_NAME(rs.getString("CERTIFICATE_NAME"));
				u.setCERTIFICATION_NAME(rs.getString("CERTIFICATION_NAME"));
				u.setDATE_OF_ACQUISITION(rs.getString("DATE_OF_ACQUISITION"));
				u.setEXPIRATION_DATE(rs.getString("EXPIRATION_DATE"));
				u.setCERTIFICATE_FILENAME(rs.getString("CERTIFICATE_FILENAME"));
				list.add(u);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return list;
	}

	public ArrayList<AdminQuestion> question(Connection conn, int cPage, int numPerPage, String type) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<AdminQuestion> list = new ArrayList<AdminQuestion>();
		String sql = prop.getProperty("questionList");
		sql = sql.replaceAll("ORTYPERO",type);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AdminQuestion aq = new AdminQuestion();
				aq.setScNum(rs.getInt("SC_NUM"));
				aq.setUserId(rs.getString("USER_ID"));
				aq.setSendEmail(rs.getString("ANSWER_EMAIL"));
				aq.setEmailTitle(rs.getString("ANSWER_CONTENT"));
				aq.setEmailDate(rs.getString("ANSWER_DATE"));
				aq.setQueYN(rs.getString("ANSWER_YN"));
				list.add(aq);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return list;
	}

	public int questionCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		String sql = prop.getProperty("questionCount");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			count = Integer.parseInt(rs.getString(1));
			
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return count;
	}

	public ArrayList<AdminApplyDate> petsitterApply(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<AdminApplyDate> list = new ArrayList<AdminApplyDate>();
		String sql = prop.getProperty("adminApplyList");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AdminApplyDate aad = new AdminApplyDate();
				aad.setUserName(rs.getString("USER_NAME"));
				aad.setUserType(rs.getString("USER_TYPE"));
				aad.setEnrollData(rs.getString("ENROLL_DATE"));
				list.add(aad);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return list;
	}

	public ArrayList<String> userQuestion(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<String> list = new ArrayList<String>();
		String sql = prop.getProperty("adminQuestionList");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String email = rs.getString("ANSWER_EMAIL");
				list.add(email);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return list;
	}

	public AdminQuestion questionData(Connection conn, String qData) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AdminQuestion aq = null;
		String sql = prop.getProperty("adminQuestion");
		try {
			System.out.println("qdata:"+qData);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qData);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				aq = new AdminQuestion();
				aq.setScNum(rs.getInt("SC_NUM"));
				aq.setUserId(rs.getString("USER_ID"));
				aq.setSendEmail(rs.getString("ANSWER_EMAIL"));
				aq.setEmailTitle(rs.getString("ANSWER_CONTENT"));
				aq.setEmailDate(rs.getString("ANSWER_DATE"));
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return aq;
	}

	public int questionUpdate(Connection conn, String send, String qdata) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("questionUpdate");
		System.out.println(sql);
		try {
			System.out.println(send + ", " + qdata);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send);
			pstmt.setString(2, qdata);
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int alertApply(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("alertApply");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			result = rs.getInt(1);
			
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int alertCer(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("alertCer");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			result = rs.getInt(1);
			
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int alertQue(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("alertQue");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			result = rs.getInt(1);
			
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public ArrayList<ServiceData> scList(Connection conn, String type) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AdminQuestion aq = null;
		ArrayList<ServiceData> list = new ArrayList<ServiceData>();
		String sql = prop.getProperty("scList");
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, type);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ServiceData sd = new ServiceData();
				sd.setScType(rs.getString("SC_TYPE"));
				sd.setScQtext(rs.getString("SC_QUE_TEXT"));
				sd.setScAtext(rs.getString("SC_ANS_TEXT"));
				list.add(sd);
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public int scQue(Connection conn, AdminQuestion aq) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("scQue");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, aq.getUserId());
			pstmt.setString(2, aq.getSendEmail());
			pstmt.setString(3, aq.getEmailTitle());
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public ArrayList<ServiceData> SCquestion(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ServiceData> list = new ArrayList<ServiceData>();
		String sql = prop.getProperty("scAllList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ServiceData sd = new ServiceData();
				sd.setScType(rs.getString("SC_TYPE"));
				sd.setScQtext(rs.getString("SC_QUE_TEXT"));
				sd.setScAtext(rs.getString("SC_ANS_TEXT"));
				list.add(sd);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public int delSD(Connection conn, String qd) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("delSD");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qd);
			result = pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<AdminQuestion> aqYlist(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<AdminQuestion> list = new ArrayList<AdminQuestion>();
		String sql = prop.getProperty("newSDQueList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AdminQuestion aq = new AdminQuestion();
				aq.setType(rs.getString("TYPE"));
				aq.setEmailTitle(rs.getString("ANSWER_CONTENT"));
				aq.setSend(rs.getString("ANSWER_SEND"));
				list.add(aq);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public int scInsert(Connection conn, String type, String scQ, String scA) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("scInsert");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, type);
			pstmt.setString(2, scQ);
			pstmt.setString(3, scA);
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int scCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("newSDQueCount");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			result = rs.getInt(1);
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<AdminPetsitter> psNewCerList(Connection conn, int cPage, int numPerPage, String type) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<AdminPetsitter> list = new ArrayList<AdminPetsitter>();
		String sql = prop.getProperty("psNewCerList");
		sql = sql.replaceAll("ORTYPERO",type);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AdminPetsitter ap = new AdminPetsitter();
				ap.setUserId(rs.getString("PET_SITTER_ID"));
				ap.setCERTIFICATE_NAME(rs.getString("CERTIFICATE_NAME"));
				ap.setCERTIFICATION_NAME(rs.getString("CERTIFICATION_NAME"));
				ap.setDATE_OF_ACQUISITION(rs.getString("DATE_OF_ACQUISITION"));
				ap.setEXPIRATION_DATE(rs.getString("EXPIRATION_DATE"));
				ap.setCERTIFICATE_FILENAME(rs.getString("CERTIFICATE_FILENAME"));
				list.add(ap);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public int psNewCerCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("psNewCerCount");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			result = rs.getInt(1);
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int psCerChange(Connection conn, String userId, String centerName, String cerName, String type) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("cerChange");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, type);
			pstmt.setString(2, userId);
			pstmt.setString(3, centerName);
			pstmt.setString(4, cerName);
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<AdminPetsitter> psCerYList(Connection conn, int cPage, int numPerPage, String type) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<AdminPetsitter> list = new ArrayList<AdminPetsitter>();
		String sql = prop.getProperty("psCerYList");
		sql = sql.replaceAll("ORTYPERO",type);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AdminPetsitter ap = new AdminPetsitter();
				ap.setUserId(rs.getString("PET_SITTER_ID"));
				ap.setCERTIFICATE_NAME(rs.getString("CERTIFICATE_NAME"));
				ap.setCERTIFICATION_NAME(rs.getString("CERTIFICATION_NAME"));
				ap.setDATE_OF_ACQUISITION(rs.getString("DATE_OF_ACQUISITION"));
				ap.setEXPIRATION_DATE(rs.getString("EXPIRATION_DATE"));
				ap.setCERTIFICATE_FILENAME(rs.getString("CERTIFICATE_FILENAME"));
				list.add(ap);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public int psCerYCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("psCerYCount");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			result = rs.getInt(1);
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int scAllCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("scAllCount");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			result = rs.getInt(1);
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int scDel(Connection conn, String del) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = prop.getProperty("delSD");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, del);
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	


}
