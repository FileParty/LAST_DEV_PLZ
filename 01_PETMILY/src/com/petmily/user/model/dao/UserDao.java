package com.petmily.user.model.dao;

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

import com.petmily.user.model.vo.PetSitter2;
import com.petmily.user.model.vo.User;
import com.petmily.user.model.vo.UserBookMarkBoard;
import com.petmily.user.model.vo.UserPaymentHistory;


public class UserDao {
	private Properties prop = new Properties();
	

	public UserDao() {
		try {
			String path = UserDao.class.getResource("/sql/user/user-query.properties").getPath();
			prop.load(new FileReader(path));
		}
		catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public int insertUserTable(Connection conn, PetSitter2 pss) {
		PreparedStatement pstmt=null;
		int result = 0 ;
		
		String sql=prop.getProperty("insertUserTable");
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, pss.getPetsitterId()); 
			pstmt.setString(2, pss.getPassword()); 
			pstmt.setString(3, pss.getSitterName()); 
			pstmt.setString(4, pss.getSitterBday().replaceAll("-", "/"));
			pstmt.setString(5, pss.getSitterPhone());
			pstmt.setString(6, pss.getPostCode());
			pstmt.setString(7, pss.getSitterAddress()); 
			pstmt.setString(8, pss.getAddressDetail()); 
			pstmt.setString(9, pss.getSitterEmail());
			pstmt.setString(10, pss.getSitterGender());
			pstmt.setString(11, pss.getType()); 
			result=pstmt.executeUpdate();	
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public int insertUserPetSitter(Connection conn, PetSitter2 pss) {
		PreparedStatement pstmt=null;
		int result = 0 ;
		String sql=prop.getProperty("insertPetSitter");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, pss.getPetsitterId()); 
			pstmt.setString(2, pss.getCertificateYN()); 
			pstmt.setString(3, pss.getPetSitterJob()); 
			pstmt.setString(4, pss.getPetSitterFamily()); 
			pstmt.setString(5, pss.getPetSitterKeeppets()); 
			pstmt.setString(6, pss.getPetSitterActivity()); 
			pstmt.setString(7, pss.getAccountOwner()); 
			pstmt.setString(8, pss.getBankName()); 
			pstmt.setString(9, pss.getAccountNo()); 
		//	pstmt.setString(10, ps.getType());
			pstmt.setString(10, pss.getSitterImg()); 
			result=pstmt.executeUpdate();	
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
			return result;
	}
		
	
	public int insertPetSitterCertificate(Connection conn, PetSitter2 pss) {
		PreparedStatement pstmt=null;
		int result = 0;
		
		String sql="";
		sql=prop.getProperty("insertPetSitterCertificate");
				try {
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, pss.getPetsitterId()); 
					pstmt.setString(2, pss.getCertificateName()); 
					pstmt.setString(3, pss.getIssuingOrg()); 
					pstmt.setString(4, pss.getCertiGetDate()); 
					pstmt.setString(5, pss.getCertiEndDate()); 
					pstmt.setString(6, pss.getCertiImg()); 
					result=pstmt.executeUpdate();	
				}catch(SQLException e) {
					e.printStackTrace();
				}finally {
					close(pstmt);
				}
			return result;
			
	}//insertPetSitterCertificate
	
	
	
	
	public int insertResidenceType(Connection conn, String id, String res) {
		PreparedStatement pstmt=null;
		int result = 0 ;
		String sql=prop.getProperty("insertResidenceType");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id); 
			pstmt.setString(2, res);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	
	
	
//	----------------------------- 
	
	
	

	public User userSelect(Connection conn, String user_id, String password) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User user = null;
		String sql = prop.getProperty("userSelect");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				user = new User();
				user.setUserId(rs.getString("USER_ID")); 
				user.setPassword(rs.getString("PASSWORD"));
				user.setUserName(rs.getString("USER_NAME"));
				user.setUserBirth(rs.getString("USER_BIRTH_DAY"));
				user.setPhone(rs.getString("PHONE"));
				user.setZipCode(rs.getString("ZIP_CODE"));
				user.setAddress(rs.getString("ADDRESS")); 
				user.setDetailAddress(rs.getString("DETAILED_ADDRESS"));
				user.setEmail(rs.getString("EMAIL"));
				user.setGender(rs.getString("GENDER"));
				user.setStatus(rs.getString("STATUS"));
				user.setUserType(rs.getString("USER_TYPE"));
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		return user;
	}
	
	
	

	public boolean userIdDuplicate(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false;
		String sql = prop.getProperty("duplicate");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				flag = true; 
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		} 
		return flag;
	}
	

	public boolean phoneDuplicate(Connection conn, String phone) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false;
		String sql = prop.getProperty("duplicatePhone");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, phone);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				flag = true; 
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		} 
		return flag;
	}
	

	public boolean emailDuplicate(Connection conn, String email) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false;
		String sql = prop.getProperty("duplicateEmail");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				flag = true; 
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		} 
		return flag;
	}
	
	

	public int userJoin(Connection conn, String id, String password, String name, String bday, String phone, String post, String address, String detailedAddress, String email, String gender) {
		PreparedStatement pstmt=null;
		int result = 0;
		String sql = prop.getProperty("userJoin");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id); 
			pstmt.setString(2, password); 
			pstmt.setString(3, name);
			pstmt.setString(4, bday); 
			pstmt.setString(5, phone); 
			pstmt.setString(6, post);
			pstmt.setString(7, address);
			pstmt.setString(8, detailedAddress);
			pstmt.setString(9, email);
			pstmt.setString(10, gender); 
			result=pstmt.executeUpdate();			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

//	----------------------------------------------------------- 
	
//	
	public User userSelect(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User u = null;
		String sql = prop.getProperty("duplicate");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				u = new User();
				u.setUserId(rs.getString("USER_ID"));
				u.setUserName(rs.getString("USER_NAME"));
				u.setUserBirth(rs.getString("USER_BIRTH_DAY"));
				u.setPhone(rs.getString("PHONE"));
				u.setZipCode(rs.getString("ZIP_CODE"));
				u.setAddress(rs.getString("ADDRESS"));
				u.setDetailAddress(rs.getString("DETAILED_ADDRESS"));
				u.setEmail(rs.getString("EMAIL"));
				u.setGender(rs.getString("GENDER"));
				u.setUserType(rs.getString("USER_TYPE"));
				u.setBellRes(rs.getString("BELL_RES"));
				u.setBellChatt(rs.getString("BELL_CHATT"));
				u.setEnrollDate(rs.getDate("ENROLL_DATE"));
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		return u;
	}
	
	
//
	public int userUpdate(Connection conn, String id, String newPw, String email, String phone, String postNum, String address, String detailAddress) {
		PreparedStatement pstmt = null;
		int result= 0;
		String sql = prop.getProperty("userUpdate");
		try { 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPw);
			pstmt.setString(2, email); 
			pstmt.setString(3, phone); 
			pstmt.setString(4, postNum);
			pstmt.setString(5, address);
			pstmt.setString(6, detailAddress);
			pstmt.setString(7, id); 
			result = pstmt.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		return result;
	}
	

	public int userDelete(Connection conn, String id) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("userDelete");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id); 
			result = pstmt.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		return result;
	}
	

	public List<UserBookMarkBoard> userBookMarkBoard(Connection conn, String id, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UserBookMarkBoard ubm = null;
		List<UserBookMarkBoard> list = new ArrayList();
		String sql = prop.getProperty("userBookMarkBoard");
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ubm = new UserBookMarkBoard();
				ubm.setBoardCode(rs.getInt("BCODE"));
				ubm.setPetSitterId(rs.getString("PSI"));
				ubm.setBoardTitle(rs.getString("BT"));
				ubm.setOnedaySprice(rs.getInt("OS"));
				ubm.setOnedayMprice(rs.getInt("OM"));
				ubm.setOnedayBprice(rs.getInt("OB"));
				ubm.setUserName(rs.getString("NA"));
				list.add(ubm);
			}
			

		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	

	public int selectBoardCount(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		String sql = prop.getProperty("selectBookMarkCount");
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs= pstmt.executeQuery();
			rs.next();
			count= rs.getInt(1);
		}
		catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return count;
	}
	

	public List<UserPaymentHistory> userPaymentHistory(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UserPaymentHistory up = null;
		List<UserPaymentHistory> list = new ArrayList();
		String sql = prop.getProperty("userPaymentHistory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id); 
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				up = new UserPaymentHistory();
				up.setCheckIn(rs.getString("checkin"));
				up.setCheckOut(rs.getString("checkout"));
				up.setPstId(rs.getString("pstid"));
				up.setPrice(rs.getInt("price"));
				up.setEndDate(rs.getString("enddate"));
				list.add(up);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

//	------------------------------------------------------------------------------
	

//	
	public User userApiLogin(Connection conn, String userEmail) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User user = null;
		String sql = prop.getProperty("apiUserSelect");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userEmail);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				user = new User();
				user.setUserId(rs.getString("USER_ID")); 
				user.setPassword(rs.getString("PASSWORD")); 
				user.setUserName(rs.getString("USER_NAME")); 
				user.setUserBirth(rs.getString("USER_BIRTH_DAY")); 
				user.setPhone(rs.getString("PHONE")); 
				user.setZipCode(rs.getString("ZIP_CODE")); 
				user.setAddress(rs.getString("ADDRESS")); 
				user.setDetailAddress(rs.getString("DETAILED_ADDRESS")); 
				user.setEmail(rs.getString("EMAIL")); 
				user.setGender(rs.getString("GENDER")); 
				user.setStatus(rs.getString("STATUS")); 
				user.setUserType(rs.getString("USER_TYPE"));
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		return user;
	}
	
	
	
	public int sitterUpdate(Connection conn, String id, String bankName, String accountNo, String accountName, String img) {
		PreparedStatement pstmt=null; 
		int result=0;
		String sql= prop.getProperty("sitterUpdate");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,bankName);
			pstmt.setString(2,accountNo);
			pstmt.setString(3,accountName);
			pstmt.setString(4,img);
			pstmt.setString(5,id);
			result=pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
     
  
     public boolean sitterIdDuplicate(Connection conn, String sitterId) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean flag = false;
        String sql = prop.getProperty("duplicateSitter");
        try {
           pstmt = conn.prepareStatement(sql);
           pstmt.setString(1, sitterId);
           rs = pstmt.executeQuery();
           
           if(rs.next()) {
              flag = true; 
           }
        }
        catch(SQLException e) {
           e.printStackTrace();
        }
        finally {
           close(rs);
           close(pstmt);
        } 
        return flag;
     }
     
    
     public boolean sitterEmailDuplicate(Connection conn, String email) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean flag = false;
        String sql = prop.getProperty("duplicateSitterEmail");
        try {
           pstmt = conn.prepareStatement(sql);
           pstmt.setString(1, email);
           rs = pstmt.executeQuery();
           
           if(rs.next()) {
              flag = true; 
           }
        }
        catch(SQLException e) {
           e.printStackTrace();
        }
        finally {
           close(rs);
           close(pstmt);
        } 
        return flag;
     }
     
     public boolean sitterPhoneDuplicate(Connection conn, String phone) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean flag = false;
        String sql = prop.getProperty("duplicateSitterPhone");
        try {
           pstmt = conn.prepareStatement(sql);
           pstmt.setString(1, phone);
           rs = pstmt.executeQuery();
           
           if(rs.next()) {
              flag = true;
           }
        }
        catch(SQLException e) {
           e.printStackTrace();
        }
        finally {
           close(rs);
           close(pstmt);
        } 
        return flag;
     }
}
