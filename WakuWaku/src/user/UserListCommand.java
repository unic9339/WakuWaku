package user;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.*;


public class UserListCommand implements UserCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO dao = new MemberDAO();
		MemberDTO [] memberarr = null;
		
		try {
			memberarr = dao.select();
			request.setAttribute("userlsit", memberarr);
		}catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
