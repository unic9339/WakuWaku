package user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserLoginCheck implements UserCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		System.out.println("로그인 체크중...");
		
		MemberDAO dao = new MemberDAO();
		
		int chk = 0;
		
		try {
			chk = dao.loginCheck(id, passwd);
			request.setAttribute("result", chk);
			
		}catch (Exception e) {
			e.printStackTrace();
		}

	}

}
