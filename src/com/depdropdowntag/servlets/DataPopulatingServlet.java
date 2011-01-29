package com.depdropdowntag.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DataPopulatingServlet
 */
public class DataPopulatingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DataPopulatingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		/*
		 * 1) states hashmpa contains map of cities and key as state name
		 * 
		 * 2) cites hashmap contains list of areas and city name as key 
		 * 
		 */
		
		
		Map<String, Map<String, List<String>>> states = new HashMap<String, Map<String, List<String>>> () ;
		
		Map<String, List<String> > mahaCities = new HashMap<String, List<String> >();
		
		Map<String, List<String> > karCities =new HashMap<String, List<String> >();
		
		
		List<String> mumAreas = new ArrayList<String>();
		List<String> puneAreas = new ArrayList<String>();
		List<String> nashikAreas = new ArrayList<String>();
		
		
		mumAreas.add("Goregaon");
		mumAreas.add("Malad");
		mumAreas.add("Andheri");
		
		nashikAreas.add("Nashik 1");
		nashikAreas.add("Nashik 2");
		nashikAreas.add("Nashik 3");
		
		puneAreas.add("Pune 1");
		puneAreas.add("Pune 2");
		puneAreas.add("Pune 3");
		
		mahaCities.put("Mumbai",mumAreas);
		mahaCities.put("Pune", puneAreas);
		mahaCities.put("Nashik", nashikAreas);
		
		karCities.put("Banglore", null);
		karCities.put("Manglore", null);
		karCities.put("Belgaon", null);
		
		states.put("Maharashra", mahaCities);
		states.put("Karnataka", karCities);
		
	
		
		
		
		
		
		request.setAttribute("STATES", states);
		
		
		
		
		getServletConfig().getServletContext().getRequestDispatcher("/samplepage.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
