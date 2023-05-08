package controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import repository.BoardsDAO;

@WebServlet("/board/write-task")
public class boardWriteTaskController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		//User user = (User) session.getAttribute("logonUser");
		//user.getNick()
		
		String nick = "철이";
		String continent = req.getParameter("continent");
		String country = req.getParameter("country");
		String body = req.getParameter("body");
		String totalUsers = req.getParameter("totalUsers");
		String date = req.getParameter("date");
		String time = date + " " + req.getParameter("time");
		String title=req.getParameter("title");
		
		System.out.println(country);
		System.out.println(continent);
		
		 System.out.println(time);
		Map<String, Object> board = new LinkedHashMap<>();
		board.put("writer" , nick);
		board.put("body", body);
		board.put("totalUsers", totalUsers);
		board.put("time", time);
		board.put("continent", continent);
		board.put("title", title);
		
		
		int r = BoardsDAO.createBoard(board);
		System.out.println(r);
		if (r == 1) {
			resp.sendRedirect("/cautionDetailBoard?countryNm=" + URLEncoder.encode(country, "utf-8"));
		} else {
			req.getRequestDispatcher(
					"/WEB-INF/views/moim/boardWrite.jsp?continent=" + URLEncoder.encode(continent, "utf-8") + "&country=" + URLEncoder.encode(country, "utf-8") + "&error=-1")
					.forward(req, resp);
		}
	}
}