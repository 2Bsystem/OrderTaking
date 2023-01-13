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
import com.a2bsystem.models.Historique;

/**
 * Servlet implementation class Home
 */
@WebServlet("/RecapImp")
public class RecapImp extends HttpServlet {
	
	public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String connectionUrl = "jdbc:sqlserver://" + session.getAttribute("serveur") + ";databaseName=" + session.getAttribute("BDD") + ";user=" + "sa" + ";password=" + "2bsystem99";

		String Login = (String) session.getAttribute("login");

		if(session.getAttribute("articleClient") == null || session.getAttribute("articleClient") == "") {
		
			session.setAttribute("articleClient", request.getParameter("articleClient") );
		}
		
//		if(session.getAttribute("articlePrix") == null || session.getAttribute("articlePrix") == "") {
//			
//			session.setAttribute("articlePrix", request.getParameter("articlePrix") );
//		}
		
		session.setAttribute("articleLot", request.getParameter("articleLot") );
		session.setAttribute("articleQuantite", request.getParameter("articleQuantite") );
		session.setAttribute("articlePoids", request.getParameter("articlePoids") );
		session.setAttribute("articlePrix", request.getParameter("articlePrix") );
		session.setAttribute("articleUnite", request.getParameter("articleUnite") );
		session.setAttribute("articleCommentaire", request.getParameter("articleCommentaire") );
		session.setAttribute("articleCommentaire2", request.getParameter("articleCommentaire2") );
		session.setAttribute("articleOrigine", request.getParameter("articleOrigine") );
		
		System.out.println("artCli RecapImp " + session.getAttribute("articleClient"));
		String clientString = (String) session.getAttribute("articleClient");
		//String cleanClient  = clientString.replace("'", " ");
		String cleanClient  = clientString.replaceAll("\\s.*", "");

		String valArticle = "";
		String articlePrix = (String) session.getAttribute("articlePrix");
		
		 if(session.getAttribute("inputSaisieArticle") == null) { 
			  valArticle = (String) session.getAttribute("valArticle");
		 	} else {
			  valArticle = (String) session.getAttribute("inputSaisieArticle");
		 } 
		 
		 if (session.getAttribute("articlePrix")=="" || session.getAttribute("articlePrix")== null) {
			 session.setAttribute("articlePrix", 0);
		 }
	
        try (Connection con = DriverManager.getConnection(connectionUrl); Statement stmt = con.createStatement();) {
        	String SQL = "EXEC q_2bp_java_web_order_taking_ajout_article @ForetagKod=" + session.getAttribute("foretagKod") +
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
        
		 try (Connection con = DriverManager.getConnection(connectionUrl); Statement stmt = con.createStatement();) {
	        	String SQL = "EXEC q_2bp_java_web_order_taking_get_histo_commande "+ session.getAttribute("foretagKod") +",'" + Login + "';";
	        	
	        	System.out.println(SQL);
	        	ResultSet rs = stmt.executeQuery(SQL);
	            List<Historique> historiques = new ArrayList<Historique>();
	        	if(rs.next()) {
	        		Historique historique = new Historique();
	        		historique.client = rs.getString("FtgNr");
	        		historique.quantite = rs.getString("Quantite");
	        		historique.unite = rs.getString("Unite");
	        		historique.categorie = rs.getString("Categorie");
	        		historique.article = rs.getString("Article");
	        		historique.origine = rs.getString("Origine");
	        		historique.commentaire = rs.getString("Commentaire");
	        		historique.prix = rs.getString("Prix");
	        		historique.date = rs.getString("Date");
	
	        		historiques.add(historique);
	    		
	            	while(rs.next()) {
	            		Historique historique2 = new Historique();
	            		historique2.client = rs.getString("FtgNr");
	            		historique2.quantite = rs.getString("Quantite");
	            		historique2.unite = rs.getString("Unite");
	            		historique2.categorie = rs.getString("Categorie");
	            		historique2.article = rs.getString("Article");
	            		historique2.origine = rs.getString("Origine");
	            		historique2.commentaire = rs.getString("Commentaire");
	            		historique2.prix = rs.getString("Prix");
	            		historique2.date = rs.getString("Date");
	            		historiques.add(historique2);
	            	}
	                    
	            	request.setAttribute( "historiques", historiques );
	            	
	            }
	        }
	        catch (Exception e) {
	            e.printStackTrace();
	        } 
		this.getServletContext().getRequestDispatcher( "/WEB-INF/recapImp.jsp" ).forward( request, response );
	}
}
