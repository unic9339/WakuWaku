package user;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;

public class MemberDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String uid = "scott";
	String pwd = "tiger";

	public MemberDAO() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, uid, pwd);
			System.out.println("DB Connected");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int insertMember(String id, String passwd, String uname, String gender, String phonenum, String email,
			String birth) throws SQLException {
		int cnt = 0;
		try {
			String sql = "INSERT INTO wauser(unum, id, passwd, uname, gender, phonenum, permission, email, birthday, uregdate)"
					+ "VALUES(unum_sq.nextval, ?, ?, ?, ?, ?, 5, ?, ?, sysdate)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			pstmt.setString(3, uname);
			pstmt.setString(4, gender);
			pstmt.setString(5, phonenum);
			pstmt.setString(6, email);
			pstmt.setString(7, birth);

			cnt = pstmt.executeUpdate();

		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return cnt;
	}

	public int insertMember(MemberDTO dto) throws SQLException {
		int unum = dto.getUnum();

		String id = dto.getId();
		String pw = dto.getPasswd();
		String uname = dto.getUname();
		String gender = dto.getGender();
		String phone = dto.getPhone();
		String email = dto.getEmail();
		String birth = dto.getBirth();

		int cnt = this.insertMember(id, pw, uname, gender, phone, email, birth);
		return cnt;
	}

	// 회원가입
	public MemberDTO[] createArray(ResultSet rs) throws SQLException {

		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();

		while (rs.next()) {
			int unum = rs.getInt(1);
			String id = rs.getString(2);
			String passwd = rs.getString(3);
			String uname = rs.getString(4);
			String gender = rs.getString(5);
			if (gender == null)
				gender = "";
			String phone = rs.getString(6);
			if (phone == null)
				phone = "";
			int perm = rs.getInt(7);
			String email = rs.getString(8);
			if (email == null)
				email = "";
			String birth = rs.getString(9);
			if (birth == null)
				birth = "";
			String uregdate = "";
			if (rs.getDate(10) != null) {
				uregdate = new SimpleDateFormat("yyyy-MM-dd").format(rs.getDate(10)) + " "
						+ new SimpleDateFormat("HH:mm:ss").format(rs.getTime(10));
			}

			MemberDTO dto = new MemberDTO(id, passwd, uname, gender, phone, email, birth);

			dto.setUnum(unum);
			dto.setPerm(perm);
			dto.setUregdate(uregdate);
			list.add(dto);
		}

		MemberDTO[] arr = new MemberDTO[list.size()];
		list.toArray(arr);
		return arr;
	}

	public MemberDTO[] select() throws SQLException {

		try {
			String sql = "SELECT * FROM wauser ORDER BY unum DESC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			return createArray(rs);
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	}

// 중복확인
	public MemberDTO[] findByName(String uname) throws SQLException {
		String sql = "SELECT * FROM wauser WHERE name=? ORDER BY unum DESC";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uname);
			rs = pstmt.executeQuery();

			MemberDTO arr[] = createArray(rs);
			return arr;
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	}

	// 아이디 유효성 검사
	public boolean idChk(String id) throws SQLException {
		String sql = "SELECT ID FROM wauser WHERE ID=? ";
		boolean x = false;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next())
				x = true;
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return x;
	}

	public int loginCheck(String id, String passwd) throws SQLException {
		String sql = "SELECT passwd FROM wauser WHERE ID=? ";
		String dbPw ="";
		int x = -1;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);		//이쪽에서 에러
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbPw = rs.getString("passwd");
				
				if(dbPw.equals(passwd)) x = 1;	// 비밀번호가 같은경우
				else x = 0;		// 비밀번호가 다를경우
			}else x = -1;		// 해당 ID 가 없을 경우
			
		}finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return x;
	}
}
