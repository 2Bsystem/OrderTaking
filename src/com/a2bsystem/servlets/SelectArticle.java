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
@WebServlet("/SelectArticle")
public class SelectArticle extends HttpServlet {

	public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		HttpSession session = request.getSession();

		session.setAttribute("valCategory", request.getParameter("valCategory") );
		session.setAttribute("valArticle", request.getParameter("valArticle") );
		session.setAttribute("inputSaisieArticle", request.getParameter("inputSaisieArticle") );

		this.getServletContext().getRequestDispatcher( "/WEB-INF/selectionArticle.jsp" ).forward( request, response );
	}
}
