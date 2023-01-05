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
@WebServlet("/ConfirmationCde")
public class ConfirmationCde extends HttpServlet {
	
//	public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
//		
//
//		this.getServletContext().getRequestDispatcher( "/WEB-INF/listeRecap.jsp" ).forward( request, response );
//        
//	}

	public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String clientString = (String) session.getAttribute("articleClient");
		String cleanClient  = clientString.replace("'", " ");
		
		String connectionUrl = "jdbc:sqlserver://192.168.255.100;databaseName=MASTER_V2;user=" + "sa" + ";password=" + "2bsystem99";
		//var foretagKod = session.getAttribute("foretagKod");
		String Login = (String) session.getAttribute("login");
		request.setAttribute("prev_page", "client");
        try (Connection con = DriverManager.getConnection(connectionUrl); Statement stmt = con.createStatement();) {
        	String SQL = "EXEC q_2bp_java_web_order_taking_confirmation @ForetagKod=1000" +
																	 ", @Perssign='" + Login +
																	 "',@FtgNr='" + cleanClient +
																	 "',@Quantite=" + session.getAttribute("articleQuantite") +
																	 ",@Unite='" + session.getAttribute("articleUnite") +
																	 "',@Categorie='" + session.getAttribute("valCategory") +
																	 "',@Article='" + session.getAttribute("valArticle") +
																	 "',@Origine='" + session.getAttribute("articleOrigine") +
																	 "',@Commentaire='" + session.getAttribute("articleCommentaire") +
																	 "',@Prix=" + session.getAttribute("articlePrix") +";";
        	
        	System.out.println(SQL);
			ResultSet rs = stmt.executeQuery(SQL);
        }
        catch (Exception e) {
            e.printStackTrace();
        } 
        
		request.setAttribute("prev_page", "client");
        try (Connection con = DriverManager.getConnection(connectionUrl); Statement stmt = con.createStatement();) {
        	String SQL = "EXEC q_2bp_java_web_order_taking_get_histo_commande 1000,'" + Login + "';";
        	
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
		
		this.getServletContext().getRequestDispatcher( "/WEB-INF/listeRecap.jsp" ).forward( request, response );
            
	}

}