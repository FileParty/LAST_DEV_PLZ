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


public class UserDao {
	private Properties prop = new Properties();
	
//	疫꿸��� 占쎄문占쎄쉐占쎌��占쎈� 占쎈��占쎌�� 野���以���占� 占쎄�占쎈섧占쎈립占쎈��.
	public UserDao() {
		try {
			String path = UserDao.class.getResource("/sql/user/user-query.properties").getPath();
			prop.load(new FileReader(path));
		}
		catch(IOException e) {
			e.printStackTrace();
		}
	}// UserDao() 疫꿸���占쎄문占쎄쉐占쎌��
	
	
	public int insertUserTable(Connection conn, PetSitter2 pss) {
		PreparedStatement pstmt=null;
		int result = 0 ;
		String sql=prop.getProperty("insertUserTable");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, pss.getPetsitterId()); //?��?��揶�??�� ?釉�?��?逾�
			pstmt.setString(2, pss.getPassword()); //?��?��揶�??�� ��袁�?甕곕����
			pstmt.setString(3, pss.getSitterName()); //?��?��揶�??�� ?����?
			pstmt.setString(4, pss.getSitterBday().replaceAll("-", "/"));//?��?��揶�??�� ?��???猷�
			pstmt.setString(5, pss.getSitterPhone());
			pstmt.setString(6, pss.getPostCode());//?��?��揶�??�� 雅��깅�� ?��?�よ린����
			pstmt.setString(7, pss.getSitterAddress()); //?��?��揶�??�� 雅��깅��
			pstmt.setString(8, pss.getAddressDetail()); //?��?��揶�??�� ?湲�?苑�雅��깅��
			pstmt.setString(9, pss.getSitterEmail()); //?��?��揶�??�� ?��筌�遺우��
			pstmt.setString(10, String.valueOf(pss.getSitterGender())); //?��?��揶�??�� ?苑�癰�?
			pstmt.setString(11, pss.getType()); //?��?��揶�??�� ?��?苑� ???��
			result=pstmt.executeUpdate();	
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	//?�� ?��?苑� ?��?��揶�??�� 餓�? USER_PET_SITTER?肉� ???釉� 筌�遺용��?諭�
	public int insertUserPetSitter(Connection conn, PetSitter2 pss) {
		PreparedStatement pstmt=null;
		int result = 0 ;
		String sql=prop.getProperty("insertPetSitter");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, pss.getPetsitterId()); //?��?��?苑� ?釉�?��?逾�
			pstmt.setString(2, pss.getCertificateYN()); //?��?��?苑� ?��野��뱀� 癰����� ?肉ч��?
			pstmt.setString(3, pss.getPetSitterJob()); //?��?��?苑� 筌�怨몃씜
			pstmt.setString(4, pss.getPetSitterFamily()); //?��?��?苑� 揶�?鈺�? �닌�苑�?��
			pstmt.setString(5, pss.getPetSitterKeeppets()); //?��?��?苑� 獄�����?猷���? 獄����� 野���肉� ?肉ч��?
			pstmt.setString(6, pss.getPetSitterActivity()); //?��?��?苑� ?��?猷� 野�����
			pstmt.setString(7, pss.getAccountOwner()); //?��?��?苑� ?��?沅��④쑴伊� �④쑴伊�雅�?
			pstmt.setString(8, pss.getBankName()); //?��?��?苑� ?��?沅��④쑴伊� ???六억�?
			pstmt.setString(9, pss.getAccountNo()); //?��?��?苑� ?��?沅��④쑴伊� �④쑴伊�甕곕����
		//	pstmt.setString(10, ps.getType()); //?��?��?苑� ?沅�?��?�� ???��(?��?��?苑�)
			pstmt.setString(11, pss.getSitterImg()); //?��?��?苑� ?遊썸에��釉� ?��沃�紐�?
			result=pstmt.executeUpdate();	
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
			return result;
	}
		
	//?�� ?��?苑� ?��?��揶�??�� 餓�? PET_SITTER_CERTIFICATE 筌�遺용��?諭�
	public int insertPetSitterCertificate(Connection conn, PetSitter2 pss) {
		PreparedStatement pstmt=null;
		int result = 0 ;
		String sql=prop.getProperty("insertPetSitterCertificate");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, pss.getPetsitterId()); //?��?��?苑� ?釉�?��?逾�
			pstmt.setString(2, pss.getCertificateName()); //?��?��?苑� ?��野��뱀� ?����?
			pstmt.setString(3, pss.getIssuingOrg()); //?��?��?苑� ?��野��뱀� 獄�����疫꿸�?
			pstmt.setString(4, pss.getCertiGetDate()); //?��?��?苑� ?��野��뱀� 獄�����?��
			pstmt.setString(5, pss.getCertiEndDate()); //?��?��?苑� ?��野��뱀� 筌���利�?��
			pstmt.setString(6, pss.getCertiImg()); //?��?��?苑� ?��野��뱀� ?��沃�紐�?
			result=pstmt.executeUpdate();	
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	//?��?��?苑� ?��?��揶�??�� 餓�? RESIDENCE_TYPE ?��?����遺용� ???釉� 野�?
	public int insertResidenceType(Connection conn, PetSitter2 pss) {
		PreparedStatement pstmt=null;
		int result = 0 ;
		String sql=prop.getProperty("insertResidenceType");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, pss.getPetsitterId()); //?��?��?苑� ?釉�?��?逾�
			pstmt.setString(2, pss.getResidenceValue()); //椰�怨�竊�筌�? ?��?��
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	
//	----------------------------- ㅆ
	
	
	
//	유저 로그인 로직
//	DB에 클라이언트가 입력한 아이디값이 있는지 찾아본다.
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
	
	
	
//	회원가입 - 아이디 중복확인 로직
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
				flag = true; // true는 이용이 불가능 ( 아이디가 DB에 있으니, 사용할 수 없다! )
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
	
//	회원가입 - 휴대폰 중복확인 로직
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
				flag = true; // true는 이용이 불가능 ( 아이디가 DB에 있으니, 사용할 수 없다! )
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
	
//	회원가입 - 이메일 중복확인 로직
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
				flag = true; // true는 이용이 불가능 ( 아이디가 DB에 있으니, 사용할 수 없다! )
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
	
	
//	회원가입 로직
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

//	----------------------------------------------------------- ㅆ
	
//	회원정보 보기 로직
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
	
	
//	회원정보 수정 로직
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
			pstmt.setString(7, id); // SQL 鈺곌�援��억옙
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
	
//	회원탈퇴 로직
	public int userDelete(Connection conn, String id) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("userDelete");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id); // SQL 조건
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
	
//	마이페이지 - 북마크 로직
	public List<UserBookMarkBoard> userBookMarkBoard(Connection conn, String id, int cPage, int numPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UserBookMarkBoard ubm = null;
		List<UserBookMarkBoard> list = new ArrayList();
		String sql = prop.getProperty("userBookMarkBoard");
		try {
			pstmt = conn.prepareStatement(sql);
//			페이징 처리시, SQL문도 수정이 필요하다.
//			RNUM 처리를 위해 서브쿼리 수정이 필요하다.
			pstmt.setString(1, id);
			pstmt.setInt(2, (cPage-1)*numPerPage+1);
			pstmt.setInt(3, cPage*numPerPage);
			
			System.out.println("dao의 id :"+id);
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
			
			System.out.println("dao에서 잘 담아졌는가(dao) : "+list);
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
	
//	북마크 로직 페이징 처리
//	page bar 생성(int totalData)
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

//	------------------------------------------------------------------------------
	

//	인술 작업(로그인 API)
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
				user.setUserId(rs.getString("USER_ID")); // 占쎌��占쏙옙 占쎈�占쎌��占쎈�
				user.setPassword(rs.getString("PASSWORD")); // 占쎌��占쏙옙 占쎈�ｏ옙�わ옙��占쎈굡
				user.setUserName(rs.getString("USER_NAME")); // 占쎌��占쏙옙 占쎌���깍옙
				user.setUserBirth(rs.getString("USER_BIRTH_DAY")); // 占쎌��占쏙옙 占쎄문占쎈��占쎌�∽옙��
				user.setPhone(rs.getString("PHONE")); // 占쎌��占쏙옙 占쎌��占쏙옙甕곕����
				user.setZipCode(rs.getString("ZIP_CODE")); // 占쎌��占쏙옙 占쎌��占쎈�よ린����
				user.setAddress(rs.getString("ADDRESS")); // 占쎌��占쏙옙 雅��깅��
				user.setDetailAddress(rs.getString("DETAILED_ADDRESS")); // 占쎌��占쏙옙 占쎄맒占쎄쉭雅��깅��
				user.setEmail(rs.getString("EMAIL")); // 占쎌��占쏙옙 占쎌��筌�遺우��
				user.setGender(rs.getString("GENDER")); // 占쎌��占쏙옙 占쎄쉐癰�占�
				user.setStatus(rs.getString("STATUS")); // 占쎌��占쏙옙 占쎌�띰옙��占쎄�占쎈��占쎈연�븝옙
				user.setUserType(rs.getString("USER_TYPE")); // 占쎌��占쏙옙 占쏙옙占쎌��(占쎌�よ�占�, 占쎈��占쎈��占쎄숲, �울옙�귐���)
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
}
