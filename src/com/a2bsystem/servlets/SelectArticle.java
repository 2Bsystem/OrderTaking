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
@WebServlet("/SelectArticle")
public class SelectArticle extends HttpServlet {

	public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//if(session.getAttribute("valCategory") == null) {
			session.setAttribute("valCategory", request.getParameter("valCategory") );

		//}
		
		System.out.println("ValCat " +session.getAttribute("valCategory"));
		//System.out.println("recapCat " +(session.getAttribute("recapCategorie").toString().trim()));

		session.setAttribute("valArticle", request.getParameter("valArticle") );
		session.setAttribute("inputSaisieArticle", request.getParameter("inputSaisieArticle") );
		
		System.out.println("ValArticle " +session.getAttribute("valArticle"));
		//System.out.println("recapArticle " +(session.getAttribute("recapArticle").toString().trim()));

		this.getServletContext().getRequestDispatcher( "/WEB-INF/selectionArticle.jsp" ).forward( request, response );
	}
}
