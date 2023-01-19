package com.a2bsystem.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class Home
 */
@WebServlet("/modifSaisieArticle")
public class modifSaisieArticle extends HttpServlet {
	
	public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		HttpSession session = request.getSession();

		if(request.getParameter("recapArticleModif") != null) {
			 session.setAttribute("recapArticleModif", request.getParameter("recapArticleModif") );
			 String recapArticleModifString = (String) session.getAttribute("recapArticleModif");
	
			 String[] arrayrecapArticleModif = recapArticleModifString.split("//");
	
			 session.setAttribute("recapClient", arrayrecapArticleModif[0]);
		     session.setAttribute("recapQuantite", arrayrecapArticleModif[1]);
		     session.setAttribute("recapUnite", arrayrecapArticleModif[2]);
		     session.setAttribute("recapCategorie", arrayrecapArticleModif[3]);
		     session.setAttribute("recapArticle", arrayrecapArticleModif[4]);
		     session.setAttribute("recapOrigine", arrayrecapArticleModif[5]);
		     session.setAttribute("recapCommentaire", arrayrecapArticleModif[6]);
		     session.setAttribute("recapCommentaire2", arrayrecapArticleModif[7]);
		     session.setAttribute("recapPrix", arrayrecapArticleModif[8]);
		}
		
		session.setAttribute("valCategory",null);
		session.setAttribute("valArticle",null);
		session.setAttribute("inputSaisieArticle",null);

		this.getServletContext().getRequestDispatcher( "/WEB-INF/saisieArticle.jsp" ).forward( request, response );
	}
}
