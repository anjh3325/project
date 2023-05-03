package controller.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import repository.UsersDAO;

@WebServlet("/user/join-task")
public class UserJoinTaskController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String id=req.getParameter("id");
		String pass=req.getParameter("pass");
		String nick=req.getParameter("nick");
		
		Map<String,Object> map =new HashMap<>();
		map.put("id", id);
		map.put("pass", pass);
		map.put("nick", nick);
		
		int r = UsersDAO.create(map);
		
		if(r == 1) {
			resp.sendRedirect("/");
		}
	}
}
