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

import com.a2bsystem.models.Historique;

/**
 * Servlet implementation class Home
 */
@WebServlet("/detailCommande")
public class detailCommande extends HttpServlet {
	

	public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String connectionUrl = "jdbc:sqlserver://" + session.getAttribute("serveur") + ";databaseName=" + session.getAttribute("BDD") + ";user=" + "sa" + ";password=" + "2bsystem99";
		String Login = (String) session.getAttribute("login");
		
		 session.setAttribute("idCmd", request.getParameter("idCmd") );
		 
		 String clientNomIdString = (String) session.getAttribute("idCmd");
		 System.out.println("idCmd " + session.getAttribute("idCmd"));

		 String[] arrayClientNoIdString = clientNomIdString.split("//");

		 session.setAttribute("idClientCommande", arrayClientNoIdString[0]);
	     session.setAttribute("nomAppelClientModifCommande", arrayClientNoIdString[1]);
		
        try (Connection con = DriverManager.getConnection(connectionUrl); Statement stmt = con.createStatement();) {
        	String SQL = "EXEC q_2bp_java_web_order_taking_get_histo_commande_modif " + session.getAttribute("foretagKod") +",'" 
                                                                                      + Login + "'," 
        			                                                                  + session.getAttribute("idClientCommande") +";";
        	System.out.println(SQL);
        	ResultSet rs = stmt.executeQuery(SQL);
            List<Historique> historiques = new ArrayList<Historique>();
        	if(rs.next()) {
        		Historique historique = new Historique();
        		historique.client = rs.getString("NomAppelClient");
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
            		historique2.client = rs.getString("NomAppelClient");
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

		this.getServletContext().getRequestDispatcher( "/WEB-INF/detailCmd.jsp" ).forward( request, response );
            
	}

}