package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.Board;
import data.User;
import repository.BoardsDAO;

@WebServlet("/board/write-task")
public class boardWriteTaskController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("logonUser");
		
		System.out.println("!");
		String nick = user.getNick();
		String continent = req.getParameter("continent");
		String country = req.getParameter("country");
		String body = req.getParameter("body");
		int totalUsers = Integer.parseInt(req.getParameter("totalUsers"));
		String time = req.getParameter("time");

		Board board = new Board();
		board.setWriter(nick);
		board.setBody(body);
		board.setContinent(continent);
		board.setTime(time);
		board.setTotalUsers(totalUsers);

		int r = BoardsDAO.createBoard(board);

		if (r == 1) {
			resp.sendRedirect("/cautionDetail?country=" + country);
		} else {
			req.getRequestDispatcher(
					"/WEB-INF/views/moim/boardWrite.jsp?continent=" + continent + "&country=" + country + "&error=-1")
					.forward(req, resp);
		}
	}
}