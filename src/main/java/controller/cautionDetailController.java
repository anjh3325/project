package controller;

import java.io.IOException;
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

@WebServlet("/cautionDetail")
public class cautionDetailController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		String country = req.getParameter("countryNm");
		//System.out.println(country);
		
		CountryData countryData = CountryAPI.findCountry(country);
		String continent = countryData.getContinentNm();
		req.setAttribute("countryData", countryData);
		
		Gson gson = new Gson();
		List<Comment> commentLi = CommentsDAO.findCountryComments(country);
		req.setAttribute("commentLi", gson.toJson(commentLi));
		
		List<Board> boardLi = BoardsDAO.findByBoard(continent);
		req.setAttribute("boardLi", gson.toJson(boardLi));
		
		DetailData detailData = DetailAPI.getCountries(country);
		req.setAttribute("DetailData", detailData);
		
		req.setAttribute("error", req.getParameter("error"));
		req.getRequestDispatcher("/WEB-INF/views/caution/cautionDetail.jsp").forward(req, resp);
	}
}
