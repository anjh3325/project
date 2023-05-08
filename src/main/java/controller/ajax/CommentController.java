package controller.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import data.Board;
import data.Comment;
import data.country.CountryData;
import data.detail.DetailData;
import repository.BoardsDAO;
import repository.CommentsDAO;
import util.CountryAPI;
import util.DetailAPI;

@WebServlet("/cautionDetailBoard")
public class CommentController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");

		req.setCharacterEncoding("utf-8");
		String country = req.getParameter("countryNm");
		req.setAttribute("country", country);
		// System.out.println(country);

		CountryData countryData = CountryAPI.findCountry(country);
		req.setAttribute("countryData", countryData);

		String continent = countryData.getContinentEngNm();
		

		List<Board> boardLi = BoardsDAO.findByBoard(continent);
		req.setAttribute("boardLi", boardLi);
		
		DetailData detailData = DetailAPI.getCountries(country);
		req.setAttribute("DetailData", detailData);

		req.setAttribute("error", req.getParameter("error"));
		req.getRequestDispatcher("/WEB-INF/views/caution/cautionBoardDetail.jsp").forward(req, resp);
		
	}

}
