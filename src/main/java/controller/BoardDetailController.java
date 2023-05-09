package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.Board;
import repository.AppliesDAO;
import repository.BoardsDAO;

@WebServlet("/boardDetail")
public class BoardDetailController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int boardId = Integer.parseInt(req.getParameter("boardId"));
		String countryNm = req.getParameter("countryNm");
		Board targetBoard = BoardsDAO.findByTargetBoard(boardId);
		int r = AppliesDAO.applicantCnt(boardId + "");
		req.setAttribute("currentUsers", r);
		req.setAttribute("targetBoard", targetBoard);
		req.setAttribute("countryNm", countryNm);
		req.getRequestDispatcher("/WEB-INF/views/moim/detail.jsp").forward(req, resp);
	}

}
