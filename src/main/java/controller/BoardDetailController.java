package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.Board;
import repository.BoardsDAO;

@WebServlet("/boardDetail")
public class BoardDetailController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int boardId = Integer.parseInt(req.getParameter("boardId"));
		System.out.println(boardId);
		Board targetBoard = BoardsDAO.findByTargetBoard(boardId);

		req.setAttribute("targetBoard", targetBoard);

		req.getRequestDispatcher("/WEB-INF/views/moim/detail.jsp").forward(req, resp);
	}

}
