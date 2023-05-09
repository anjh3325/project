package controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import repository.AppliesDAO;

@WebServlet("/apply")
public class BoardApplyController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String boardId = req.getParameter("boardId");
		String entry = req.getParameter("entry");
		String countryNm=req.getParameter("countryNm");
		
		
		int r = AppliesDAO.apply(boardId, entry);
		
		if(r == 1) {
			resp.sendRedirect("/boardDetail?boardId=" + boardId+"&countryNm="+countryNm);
		}
	}
}
