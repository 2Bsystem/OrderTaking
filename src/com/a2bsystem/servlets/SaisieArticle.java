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

import com.a2bsystem.models.Cli;

/**
 * Servlet implementation class Home
 */
@WebServlet("/SaisieArticle")
public class SaisieArticle extends HttpServlet {
	
	public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		HttpSession session = request.getSession();

		String connectionUrl = "jdbc:sqlserver://" + session.getAttribute("serveur") + ";databaseName=" + session.getAttribute("BDD") + ";user=" + "sa" + ";password=" + "2bsystem99";
		String Login = (String) session.getAttribute("login");
		request.setAttribute("prev_page", "client");
        try (Connection con = DriverManager.getConnection(connectionUrl); Statement stmt = con.createStatement();) {
        	String SQL = "EXEC q_2bp_java_web_order_taking_get_client " + session.getAttribute("foretagKod") + ",'" + Login + "';";
        	
        	System.out.println(SQL);
        	ResultSet rs = stmt.executeQuery(SQL);
            List<Cli> clients = new ArrayList<Cli>();
        	if(rs.next()) {
        		Cli client = new Cli();
        		client.code = rs.getString("Code");
        		client.nom = rs.getString("Nom");
        		client.nomAppel = rs.getString("NomAppel");
        		client.divers = rs.getString("Divers");
        		clients.add(client);
    		
            	while(rs.next()) {
            		Cli client2 = new Cli();
            		client2.code = rs.getString("Code");
            		client2.nom = rs.getString("Nom");
            		client2.nomAppel = rs.getString("NomAppel");
            		client2.divers = rs.getString("Divers");
            		clients.add(client2);
            	}
                    
            	request.setAttribute( "clients", clients );
            	
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        } 

		session.setAttribute("valArticle", request.getParameter("valArticle") );
		session.setAttribute("inputSaisieArticle", request.getParameter("inputSaisieArticle") );
		
		System.out.println(session.getAttribute("valArticle"));
		System.out.println("inputArticle " + session.getAttribute("inputSaisieArticle"));
		System.out.println(session.getAttribute("articleClient"));
		System.out.println("ValCat  " +session.getAttribute("valCategory"));
		//System.out.println("recapCat  " +(session.getAttribute("recapCategorie").toString().trim()));
		System.out.println("ValArticle  " +session.getAttribute("valArticle"));
		//System.out.println("recapArticle  " +(session.getAttribute("recapArticle").toString().trim()));
		//System.out.println("trucbidule " + session.getAttribute("recapArticleModif"));
		System.out.println("idCommandeSaisie " + session.getAttribute("idClientCommande"));
		System.out.println("idArtSaisie " + session.getAttribute("recapIdArticle"));
		
		//session.setAttribute("recapArticleModif", null);


		this.getServletContext().getRequestDispatcher( "/WEB-INF/saisieArticle.jsp" ).forward( request, response );
	}
}
