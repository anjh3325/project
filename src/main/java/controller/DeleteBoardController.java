package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import repository.BoardsDAO;

@WebServlet("/deleteBoard")
public class DeleteBoardController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String boardId = req.getParameter("boardId");
		String countryNm = req.getParameter("countryNm");
		int r = BoardsDAO.deleteTargetBoard(boardId);
		if(r == 1) {
			resp.sendRedirect("/cautionDetail?countryNm=" + countryNm);
		}
	}
}
