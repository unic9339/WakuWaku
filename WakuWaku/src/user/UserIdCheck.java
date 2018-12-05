package user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserIdCheck implements UserCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		MemberDAO dao = new MemberDAO();
		
		try {
			boolean result = dao.idChk(id);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			if(result)
				out.println("0");
			else
				out.println("1");
			
			out.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return;
	}

}
