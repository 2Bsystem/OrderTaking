package com.a2bsystem.servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Home
 */
@WebServlet("/ListeCategory")
public class ListeCategory extends HttpServlet {
	
//	public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
//		
//
//		this.getServletContext().getRequestDispatcher( "/WEB-INF/listeCategory.jsp" ).forward( request, response );
//        
//	}

	public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		HttpSession session = request.getSession();

		System.out.println("listCategory ArticleClient " + session.getAttribute("articleClient"));

		this.getServletContext().getRequestDispatcher( "/WEB-INF/listeCategory.jsp" ).forward( request, response );
            
	}

}