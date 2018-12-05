package user;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserInsertCommand implements UserCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		MemberDAO dao = new MemberDAO();
		MemberDTO member = new MemberDTO(
				request.getParameter("id"),
				request.getParameter("passwd"),
				request.getParameter("uname"),
				request.getParameter("email"),
				request.getParameter("phone"),
				request.getParameter("birth"), 
				request.getParameter("gender")
			);
		int cnt = 0;
		
		try {
			cnt = dao.insertMember(member);
			request.setAttribute("result", cnt);
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

}
