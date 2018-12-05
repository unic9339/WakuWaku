package user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface UserCommand {
	void execute(HttpServletRequest request, HttpServletResponse response);
}
