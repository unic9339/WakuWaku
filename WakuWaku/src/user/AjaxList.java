package user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

public class AjaxList implements UserCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String reqType = request.getParameter("reqType");
		
		if(reqType == null) reqType = "json";
		responseJSON(request, response);
		
	}
	private void responseJSON(HttpServletRequest request, HttpServletResponse response) {
		MemberDTO[] dtoArr = (MemberDTO[]) request.getAttribute("list");
		
		JSONObject json = new JSONObject();
		
		// 맴버의 수
		int count = (dtoArr == null) ? 0 : dtoArr.length;
		json.put("count", count);
		
		JSONArray memberArr = new JSONArray();
		
		for(int i = 0; i < count; i++ ) {
			JSONObject member = new JSONObject();
			
			member.put("unum", dtoArr[i].getUnum());
			member.put("id", dtoArr[i].getId());
			member.put("uname", dtoArr[i].getUname());
			member.put("gender", dtoArr[i].getGender());
			member.put("phone", dtoArr[i].getPhone());
			member.put("email", dtoArr[i].getEmail());
			member.put("birth", dtoArr[i].getBirth());
			member.put("uregdate", dtoArr[i].getUregdate());
			
			// array 에 추가
			memberArr.put(member);
		}
		
		json.put("member", memberArr);
		
		String jsonString = json.toString();
		System.out.println("json 테스팅");
		response.setContentType("application/json; charset=utf-8");
	
		try {
			response.getWriter().write(jsonString);
		}catch (IOException e) {
			e.printStackTrace();
		}
	}

}
