package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/write")
public class boardWriteController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		System.out.println("!");
		String continent = req.getParameter("continent"); //대륙값
		String country = req.getParameter("country");
		req.getRequestDispatcher("/WEB-INF/views/moim/boardWrite?continent=" + continent + "&country=" + country).forward(req, resp); 
		
	}
}
