package com.a2bsystem.servlets;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.a2bsystem.models.Constantes;
import com.a2bsystem.models.Cmde;
import com.a2bsystem.models.Tournee;


@WebServlet("/Commande")
public class Commande extends HttpServlet {
	
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		String connectionUrl = "jdbc:sqlserver://" + Constantes.SERVEUR + ";databaseName=" + Constantes.BDD + ";user=" + "sa" + ";password=" + "2bsystem99";
		HttpSession session = request.getSession();
		var foretagKod = session.getAttribute("foretagKod");
		String Login = (String) session.getAttribute("login");
		
		// get client from selection
		if(request.getParameter("prev_page").equals("selection")) {
			session.setAttribute( "client_commande", session.getAttribute("client"));
			session.setAttribute( "code_client_commande", session.getAttribute("code_client"));
		}
		
		// get Liste tournee
		try (Connection con = DriverManager.getConnection(connectionUrl); Statement stmt = con.createStatement();) {
        	String SQL = "EXEC q_2bp_java_web_prepa_get_tournee " + foretagKod + ",'" + Login + "';";
        	System.out.println(SQL);
        	ResultSet rs = stmt.executeQuery(SQL);
            List<Tournee> tournees = new ArrayList<Tournee>();
	            if(rs.next()) {
	            	if (rs.getString("exist").equals("1")) {
		        		Tournee tournee = new Tournee();
		        		tournee.code = rs.getString("Code");
		        		tournee.libelle = rs.getString("Libelle");
		            	tournees.add(tournee);
		    		
		            	while(rs.next()) {
		            		Tournee tournee2 = new Tournee();
			        		tournee2.code = rs.getString("Code");
			        		tournee2.libelle = rs.getString("Libelle");
			            	tournees.add(tournee2);
		            	}
		            	request.setAttribute( "tournees", tournees );
	            	}
	            }
        	}
        
        catch (Exception e) {
            e.printStackTrace();
        }
		
		// set client depuis la page client
		String Client_select = request.getParameter("client_select");
		if(request.getParameter("prev_page").equals("client")) {
			if(Client_select != "") {
				session.setAttribute( "client_commande", request.getParameter("client_select"));
				session.setAttribute( "code_client_commande", request.getParameter("code_client_select"));
			}
		}
		
		// recherche commande
		String CodeClient = "";
		String date = "";
		String numCommande = "";
		String tournee = "";
		String gamme = "";
		if(request.getParameter("prev_page").equals("search")) {
			// set les autres critères de recherches
			session.setAttribute( "date_commande", request.getParameter("date_search"));
			session.setAttribute( "num_commande_commande", request.getParameter("num_commande_search"));
			session.setAttribute( "id_tournee_commande", request.getParameter("id_tournee_search"));
			session.setAttribute( "tournee_commande", request.getParameter("tournee_search"));
			session.setAttribute( "gamme_commande", request.getParameter("gamme_search"));
			if(session.getAttribute("code_client_commande") != null) {
				CodeClient = (String) session.getAttribute("code_client_commande");
			}
			date = request.getParameter("date_search");
			numCommande = request.getParameter("num_commande_search");
			tournee = request.getParameter("id_tournee_search");
			gamme = request.getParameter("gamme_search");
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date_temp;
			try {
				date_temp = sdf.parse(date);
				SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
				date = format.format(date_temp);
				
			} catch (ParseException e) {
				e.printStackTrace();
			}
		
			try (Connection con = DriverManager.getConnection(connectionUrl); Statement stmt = con.createStatement();) {
	        	String SQL = "EXEC q_2bp_java_web_prepa_get_cde " + foretagKod + ",'" 
	        													  + Login + "','" 
	        													  + CodeClient + "','" 
	        													  + date + "','" 
	        													  + numCommande +  "','','" 
	        													  + tournee + "','" 
	        													  + gamme + "';";
	        	System.out.println(SQL);
	        	ResultSet rs = stmt.executeQuery(SQL);
	            List<Cmde> commandes = new ArrayList<Cmde>();
		            if(rs.next()) {
		            	if (rs.getString("exist").equals("1")) {
			            	System.out.println(rs.getString("exist"));
			        		Cmde commande = new Cmde();
			        		commande.num_commande = rs.getString("NumCde");
			        		commande.date = rs.getString("DateCde");
			        		commande.code_client = rs.getString("CodeCli");
			        		commande.client = rs.getString("NomCli");
			        		commande.tournee = rs.getString("Tournee");
			        		commande.rang = rs.getString("Rang");
			            	commandes.add(commande);
			    		
			            	while(rs.next()) {
			            		Cmde commande2 = new Cmde();
				        		commande2.num_commande = rs.getString("NumCde");
				        		commande2.date = rs.getString("DateCde");
				        		commande2.code_client = rs.getString("CodeCli");
				        		commande2.client = rs.getString("NomCli");
				        		commande2.tournee = rs.getString("Tournee");
				        		commande2.rang = rs.getString("Rang");
			                	commandes.add(commande2);
			            	}
			            	request.setAttribute( "commandes", commandes );
			            	request.setAttribute( "exist", "1");
		            	} else {
		            		request.setAttribute( "exist", "-1");
		            	}
		            }
	        	}
	        
	        catch (Exception e) {
	            e.printStackTrace();
	        } 
			
		}
		
		// RAZ
		if(request.getParameter("prev_page").equals("raz")) {
			session.setAttribute( "client_commande", null);
			session.setAttribute( "code_client_commande", null);
			session.setAttribute( "date_commande", null);
			session.setAttribute( "gamme_commande", null);
			session.setAttribute( "tournee_commande", null);
		}
		
		// retour d'Order
		if(request.getParameter("prev_page").equals("order")) {
			session.setAttribute( "client_order", null);
			session.setAttribute( "code_client_order", null);
			session.setAttribute("num_order", null);
			session.setAttribute( "exist_order", null);
		}
		
		// Redirection
		RequestDispatcher rd = request.getRequestDispatcher("/BornesCommandeView");
        rd.forward(request, response);
    }
}
