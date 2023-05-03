package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import data.country.CountryData;
import data.country.CountryResponseResult;
import util.CountryAPI;
import util.CountryIndex;

@WebServlet("/index")
public class IndexController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		CountryResponseResult countries = CountryAPI.getCountries();
		CountryData[] countryDatas = countries.getData();
		List<String> countryNms = CountryIndex.countryNms(countryDatas);
		Gson gson = new Gson();
		
		System.out.println(countryNms.size());
		System.out.println(gson.toJson(countryNms)); 
		
		req.getRequestDispatcher("/WEB-INF/index.jsp").forward(req, resp);
	}
}
