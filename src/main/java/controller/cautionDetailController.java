package controller;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.Comment;
import data.country.CountryData;
import data.detail.DetailData;
import repository.CommentsDAO;
import util.CountryAPI;
import util.DetailAPI;

@WebServlet("/cautionDetail")
public class cautionDetailController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		String country = req.getParameter("countryNm");
		req.setAttribute("country", country);
		System.out.println(country);

		CountryData countryData = CountryAPI.findCountry(country);
		req.setAttribute("countryData", countryData);

		List<Comment> commentLi = CommentsDAO.findCountryComments(country);
		int p;
		if(req.getParameter("page")==null) {
			p=1;
		}else {
			p=Integer.parseInt(req.getParameter("page"));
		}
		Map<String,Object> map =new LinkedHashMap<>();
		map.put("a", p*5-4);
		map.put("b", p*5);
		map.put("country", country);
		
		int totalPage=commentLi.size() % 5==0 ? commentLi.size() /5 :commentLi.size() /5 +1;
		
		List<Comment>commentPageLi=CommentsDAO.findByCommentsAtoB(map);
		
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("commentLi", commentPageLi);

		DetailData detailData = DetailAPI.getCountries(country);
		req.setAttribute("DetailData", detailData);

		req.setAttribute("error", req.getParameter("error"));
		req.getRequestDispatcher("/WEB-INF/views/caution/cautionDetail.jsp").forward(req, resp);
	}
}
