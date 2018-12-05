package user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.user")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public FrontController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}	
	
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		System.out.println("User ActionDo() 호출");
		request.setCharacterEncoding("UTF-8");
		
		// URL 로부터 URI, ContextPath, Command 분리
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		String viewPage = null;	// (view) 페이지 설정
		UserCommand usercommand = null;
		
		switch (com) {
		case "/list.ajax":
			
			new UserListCommand().execute(request, response);
			new AjaxList().execute(request, response);
			
			return;
			
		case "/LogIn/userlist.user":
			usercommand = new UserListCommand();
			usercommand.execute(request, response);
		

			viewPage = "userlist.jsp";
			break;
			
		case "/LogIn/userinsert.user":
			usercommand = new UserInsertCommand();
			usercommand.execute(request, response);
	
			viewPage = "userinsert.jsp";
			break;
			
		case "/LogIn/userFind.user":
			usercommand = new UserFindCommand();
			usercommand.execute(request, response);
			
		case "/LogIn/userIdCheck.user":
			usercommand = new UserIdCheck();
			usercommand.execute(request, response);
		
			break;
			
		case "/LogIn/userLoginCheck.user":
			usercommand = new UserLoginCheck();
			usercommand.execute(request, response);
			
			viewPage = "MainPage.jsp";
			break;
		}
		
		
		// request 를 forward 해줌
		if(viewPage != null) {			
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}

}
