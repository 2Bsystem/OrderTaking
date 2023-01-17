package com.a2bsystem.servlets;

import java.io.IOException;

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

	public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		HttpSession session = request.getSession();

		session.setAttribute("articleClient", null);
		System.out.println("listCategory ArticleClient " + session.getAttribute("articleClient"));

		this.getServletContext().getRequestDispatcher( "/WEB-INF/listeCategory.jsp" ).forward( request, response );
            
	}

}
