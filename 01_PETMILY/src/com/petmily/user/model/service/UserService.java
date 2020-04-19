package com.petmily.user.model.service;

import static com.petmily.common.JDBCTemplate.close;
import static com.petmily.common.JDBCTemplate.commit;
import static com.petmily.common.JDBCTemplate.getConnection;
import static com.petmily.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.petmily.user.model.dao.UserDao;
import com.petmily.user.model.vo.PetSitter2;
import com.petmily.user.model.vo.User;
import com.petmily.user.model.vo.UserBookMarkBoard;
import com.petmily.user.model.vo.UserPaymentHistory;

public class UserService {

	
	private UserDao dao = new UserDao();
	
	public int insertSitter(PetSitter2 pss) {
		Connection conn=getConnection();
		int result=dao.insertUserTable(conn,pss);
	    if(result>0) {
	    	result=dao.insertUserPetSitter(conn, pss);
	    	if(result>0) {
	    		if(pss.getCertificateYN().equals("Y")){
	    			result=dao.insertPetSitterCertificate(conn, pss);
	    		}if(result>0) {
	    			for(String res : pss.getResidenceValue().split(",")) {
	    				result=dao.insertResidenceType(conn, pss.getPetsitterId(),res);
	    			}
	    			if(result>0) {
	    				commit (conn);
	    			}else {
		    			rollback(conn);
		    		}
	    		}else {
	    			rollback(conn);
	    		}
	    	}else{
	    		rollback(conn);
	    	}
	    	}else{
	    		rollback(conn);
	    	}
			return result;
	    }
	
	
//	------------------------------ 
	
	

	public User userSelect(String user_id, String password) {
		Connection conn = getConnection();
		User user = dao.userSelect(conn, user_id, password);
		close(conn);
		return user;
	}
	
//	아이디 찾기 로직(SMTP)
	public User searchUserEmail(String email) {
		Connection conn = getConnection();
		User user = dao.searchUserEmail(conn, email);
		close(conn);
		return user;
	}
	
//	비밀번호 찾기 로직(SMTP)
	public User searchUserEmail(String id, String email) {
		Connection conn = getConnection();
		User user = dao.searchUserEmail(conn, id, email);
		close(conn);
		return user;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	아이디 중복확인 로직
>>>>>>> refs/heads/ysk
	public boolean userIdDuplicate(String userId) {
		Connection conn = getConnection();
		boolean flag = dao.userIdDuplicate(conn, userId);
		close(conn);
		return flag;
	}
	

	public boolean phoneDuplicate(String phone) {
		Connection conn = getConnection();
		boolean flag = dao.phoneDuplicate(conn, phone);
		close(conn);
		return flag;
	}
	

	public boolean emailDuplicate(String email) {
		Connection conn = getConnection();
		boolean flag = dao.emailDuplicate(conn, email);
		close(conn);
		return flag;
	}
	

	public int userJoin(String id, String password, String name, String bday, String phone, String post, String address, String detailedAddress, String email, String gender) {
		Connection conn = getConnection();
		int result = dao.userJoin(conn, id, password, name, bday, phone, post, address, detailedAddress, email, gender);
		
		if(result>0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	
//	------------------------------------------------
	

	public User userSelect(String id) {
		Connection conn = getConnection();
		User u = dao.userSelect(conn, id);
		close(conn);
		return u;
	}
	

	public int userUpdate(String id, String newPw, String email, String phone, String postNum, String address, String detailAddress) {
		Connection conn = getConnection();
		int result = dao.userUpdate(conn, id, newPw, email, phone, postNum, address, detailAddress);
		
		if(result>0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	

	public int userDelete(String id) {
		Connection conn = getConnection();
		int result = dao.userDelete(conn, id);
		
		if(result > 0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	

	public List<UserBookMarkBoard> userBookMarkList(String id, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<UserBookMarkBoard> list = dao.userBookMarkBoard(conn, id, cPage, numPerPage);
		close(conn);
		return list;
	}
	

	public int selectBoardCount(String id) {
		Connection conn = getConnection();
		int count = dao.selectBoardCount(conn, id);
		close(conn);
		return count;
	}
	
//	------------
	

	public List<UserPaymentHistory> userPaymentHistory(String id) {
		Connection conn = getConnection();
		List<UserPaymentHistory> list = dao.userPaymentHistory(conn, id);
		close(conn);
		return list;
	}
	
	
	
	
//	----------------------------------------------------------------------
	

	
	public User apiLogin(String userEmail) {
		Connection conn = getConnection();
		User user = dao.userApiLogin(conn, userEmail);
		close(conn);
		return user;
	}
	
	public int sitterUpdateEnd(String id, String newPw, String email, String phone, String postNum, String address, String detailAddress, String bankName, String accountNo, String accountName, String img) {
        Connection conn = getConnection();
        int result = dao.userUpdate(conn, id, newPw, email, phone, postNum, address, detailAddress);
        if(result>0) {
           result=dao.sitterUpdate(conn, id, bankName,accountNo,accountName,img);
           if(result>0) {
              commit(conn);
           }else {
              rollback(conn);
           }
        }else{
            rollback(conn);
         }
        return result;
     }
     
     
    
     public boolean sitterIdDuplicate(String sitterId) {
        Connection conn = getConnection();
        boolean flag = dao.sitterIdDuplicate(conn, sitterId);
        close(conn);
        return flag;
     }
     
     
     public boolean sitterEmailDuplicate(String email) {
        Connection conn = getConnection();
        boolean flag = dao.sitterEmailDuplicate(conn, email);
        close(conn);
        return flag;
     }
     
    
     public boolean sitterPhoneDuplicate(String phone) {
        Connection conn = getConnection();
        boolean flag = dao.sitterPhoneDuplicate(conn, phone);
        close(conn);
        return flag;
     }
	
	
	
}
