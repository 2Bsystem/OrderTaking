package com.a2bsystem.servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.a2bsystem.models.Cli;

/**
 * Servlet implementation class Home
 */
@WebServlet("/RecapImp")
public class RecapImp extends HttpServlet {
	
	public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		session.setAttribute("articleClient", request.getParameter("articleClient") );
		session.setAttribute("articleLot", request.getParameter("articleLot") );
		session.setAttribute("articleQuantite", request.getParameter("articleQuantite") );
		session.setAttribute("articlePoids", request.getParameter("articlePoids") );
		session.setAttribute("articlePrix", request.getParameter("articlePrix") );
		session.setAttribute("articleUnite", request.getParameter("articleUnite") );
		session.setAttribute("articleCommentaire", request.getParameter("articleCommentaire") );
		session.setAttribute("articleOrigine", request.getParameter("articleOrigine") );

		this.getServletContext().getRequestDispatcher( "/WEB-INF/recapImp.jsp" ).forward( request, response );
	}
}
