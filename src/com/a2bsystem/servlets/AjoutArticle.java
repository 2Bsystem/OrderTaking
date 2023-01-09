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

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.a2bsystem.models.Historique;

/**
 * Servlet implementation class Home
 */
@WebServlet("/AjoutArticle")
public class AjoutArticle extends HttpServlet {
	
//	public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
//		
//
//		this.getServletContext().getRequestDispatcher( "/WEB-INF/listeRecap.jsp" ).forward( request, response );
//        
//	}

	public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		
		HttpSession session = request.getSession();

		if(session.getAttribute("articleClient") == null || session.getAttribute("articleClient") == "") {
			
			session.setAttribute("articleClient", request.getParameter("articleClient") );
		}
		
		session.setAttribute("articleLot", request.getParameter("articleLot") );
		session.setAttribute("articleQuantite", request.getParameter("articleQuantite") );
		session.setAttribute("articlePoids", request.getParameter("articlePoids") );
		session.setAttribute("articlePrix", request.getParameter("articlePrix") );
		session.setAttribute("articleUnite", request.getParameter("articleUnite") );
		session.setAttribute("articleCommentaire", request.getParameter("articleCommentaire") );
		session.setAttribute("articleCommentaire2", request.getParameter("articleCommentaire2") );
		session.setAttribute("articleOrigine", request.getParameter("articleOrigine") );
		
		
		
		String clientString = (String) session.getAttribute("articleClient");
		String cleanClient  = clientString.replace("'", " ");
		String valArticle = "";
		//String articlePrix = (String) session.getAttribute("articlePrix");

		System.out.println("artCli ajoutArt " + session.getAttribute("articleClient"));

		 if(session.getAttribute("inputSaisieArticle") == null) { 
			  valArticle = (String) session.getAttribute("valArticle");
		 	} else {
			  valArticle = (String) session.getAttribute("inputSaisieArticle");
		 } 
		 
	 if (session.getAttribute("articlePrix")=="" || session.getAttribute("articlePrix")== null) {
			 session.setAttribute("articlePrix", 0);
		 }
		
		String connectionUrl = "jdbc:sqlserver://217.181.249.59;databaseName=MASTER_V2;user=" + "sa" + ";password=" + "2bsystem99";
		String Login = (String) session.getAttribute("login");
		
        try (Connection con = DriverManager.getConnection(connectionUrl); Statement stmt = con.createStatement();) {
        	String SQL = "EXEC q_2bp_java_web_order_taking_ajout_article @ForetagKod=1000" +
																		 ", @Perssign='" + Login +
																		 "',@FtgNr='" + cleanClient +
																		 "',@Quantite=" + session.getAttribute("articleQuantite") +
																		 ",@Unite='" + session.getAttribute("articleUnite") +
																		 "',@Categorie='" + session.getAttribute("valCategory") +
																		 "',@Article='" + valArticle +
																		 "',@Origine='" + session.getAttribute("articleOrigine") +
																		 "',@Commentaire='" + session.getAttribute("articleCommentaire") +
																		 "',@Commentaire2='" + session.getAttribute("articleCommentaire2") +
																		 "',@Prix=" + session.getAttribute("articlePrix") +";";
        	
        	System.out.println(SQL);
			ResultSet rs = stmt.executeQuery(SQL);
        }
        catch (Exception e) {
            e.printStackTrace();
        } 
        
		this.getServletContext().getRequestDispatcher( "/WEB-INF/listeCategory.jsp" ).forward( request, response );
            
	}

}