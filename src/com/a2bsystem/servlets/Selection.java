package com.a2bsystem.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.a2bsystem.models.DetailCmde;
import com.a2bsystem.models.Constantes;


@WebServlet("/Selection")
public class Selection extends HttpServlet {
	
	public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		String prev_page = request.getParameter("prev_page");
		System.out.println(prev_page);
		
		if(  prev_page.equals("raz") || prev_page.equals("home")) {
			session.setAttribute("exist_commande", 0);
			session.setAttribute("code_client", null);
			session.setAttribute("client", null);
			RequestDispatcher rd = request.getRequestDispatcher("/SelectionView");
	        rd.forward(request, response);
		}
		
		if(prev_page.equals("client")) {
			String Client = request.getParameter("client_select");
			String CodeClient = request.getParameter("code_client_select");
			if(Client == null) {
				session.setAttribute( "client", null);
				session.setAttribute( "code_client", null);
			}else {
				if (Client != "") {
					session.setAttribute( "client", Client);
					session.setAttribute( "code_client", CodeClient);
				}
			}
			RequestDispatcher rd = request.getRequestDispatcher("/SelectionView");
	        rd.forward(request, response);
		}
			
		if(prev_page.equals("article")) {	
			String Article = request.getParameter("article_select");
			String Code_article = request.getParameter(("code_article_select"));
			if(Article == null) {
				session.setAttribute( "code_article", null);
				session.setAttribute( "article", null);
			}else {
				if (Article != "") {
					session.setAttribute( "code_article", Code_article);
					session.setAttribute( "article", Article);
				}
			}
			RequestDispatcher rd = request.getRequestDispatcher("/SelectionView");
	        rd.forward(request, response);
		}
		
		if(prev_page.equals("commande")) {
			if (request.getParameter("num_commande_select") != null) {
				session.setAttribute( "mode", "commande");
				String Client = request.getParameter("client_select");
				String CodeClient = request.getParameter("code_client_select");
				session.setAttribute( "client", Client);
				session.setAttribute( "code_client", CodeClient);
				
				String Article = request.getParameter("article_select");
				String Code_article = request.getParameter(("code_article_select"));
				session.setAttribute( "code_article", Code_article);
				session.setAttribute( "code_articleOA", Code_article);
				session.setAttribute( "article", Article);
				
				String connectionUrl = "jdbc:sqlserver://" + Constantes.SERVEUR + ";databaseName=" + Constantes.BDD + ";user=" + "sa" + ";password=" + "2bsystem99";
				var foretagKod = session.getAttribute("foretagKod");
				String Login = (String) session.getAttribute("login");
				var num_commande = Integer.parseInt(request.getParameter("num_commande_select"));
				session.setAttribute("num_commande", num_commande);
				
				try (Connection con = DriverManager.getConnection(connectionUrl); Statement stmt = con.createStatement();) {
		        	String SQL = "EXEC q_2bp_java_web_prepa_get_cde_select " + foretagKod + ",'" + Login + "'," + num_commande + ",'';";
		        	System.out.println(SQL);
		        	ResultSet rs = stmt.executeQuery(SQL);
		            List<DetailCmde> detailcmdes = new ArrayList<DetailCmde>();
			            if(rs.next()) {
			            	if (rs.getString("exist").equals("1")) {
				        		DetailCmde detailcmde = new DetailCmde();
				        		detailcmde.num_cde = rs.getString("NumCde");
				        		detailcmde.date_cde = rs.getString("DateCde");
				        		detailcmde.code_cli = rs.getString("CodeCli");
				        		detailcmde.nom_cli = rs.getString("NomCli");
				        		detailcmde.code_art = rs.getString("CodeArt");
				        		detailcmde.lib_art = rs.getString("LibArt");
				        		detailcmde.batchid = rs.getString("batchid");
				        		detailcmde.unite_cde = rs.getString("Unite_cde");
					       		detailcmde.unite_fact = rs.getString("Unite_fact");
					       		detailcmde.unite_stock = rs.getString("Unite_stock");
					       		detailcmde.colis_cde = rs.getString("colis_cde");
					       		detailcmde.pieces_cde = rs.getString("pieces_cde");
					       		detailcmde.poids_cde = rs.getString("poids_cde");
					       		detailcmde.colis_prep = rs.getString("colis_prep");
					       		detailcmde.pieces_prep = rs.getString("pieces_prep");
					       		detailcmde.poids_prep = rs.getString("poids_prep");
				        		detailcmde.qte_cde = rs.getString("Qte_cde");
				        		detailcmde.qte_prep = rs.getString("Qte_prep");
				        		detailcmde.rechargement = rs.getString("rechargement");
				        		detailcmde.rupture = rs.getString("rupture");
				        		detailcmde.ligne = rs.getString("Ligne");
				        		detailcmde.ord_rest_nr = rs.getString("OrdRestNr");
				        		detailcmde.ord_rad_nr_str_pos = rs.getString("OrdRadNrStrPos");
				        		detailcmde.dummy_unique_id = rs.getString("DummyUniqueId");
				        		detailcmde.tournee = rs.getString("Tournee");
				        		detailcmde.rang = rs.getString("Rang");
				        		detailcmde.gamme = rs.getString("Gamme");
				        		detailcmde.prepare = rs.getString("q_pal_code");
				        		detailcmde.z_picking = rs.getString("Picking");
				        		detailcmdes.add(detailcmde);
				    		
				            	while(rs.next()) {
				            		DetailCmde detailcmde2 = new DetailCmde();
				            		detailcmde2.num_cde = rs.getString("NumCde");
					        		detailcmde2.date_cde = rs.getString("DateCde");
					        		detailcmde2.code_cli = rs.getString("CodeCli");
					        		detailcmde2.nom_cli = rs.getString("NomCli");
					        		detailcmde2.code_art = rs.getString("CodeArt");
					        		detailcmde2.lib_art = rs.getString("LibArt");
					        		detailcmde2.batchid = rs.getString("batchid");
					        		detailcmde2.unite_cde = rs.getString("Unite_cde");
						       		detailcmde2.unite_fact = rs.getString("Unite_fact");
						       		detailcmde2.unite_stock = rs.getString("Unite_stock");
						       		detailcmde2.colis_cde = rs.getString("colis_cde");
						       		detailcmde2.pieces_cde = rs.getString("pieces_cde");
						       		detailcmde2.poids_cde = rs.getString("poids_cde");
						       		detailcmde2.colis_prep = rs.getString("colis_prep");
						       		detailcmde2.pieces_prep = rs.getString("pieces_prep");
						       		detailcmde2.poids_prep = rs.getString("poids_prep");
					        		detailcmde2.qte_cde = rs.getString("Qte_cde");
					        		detailcmde2.qte_prep = rs.getString("Qte_prep");
					        		detailcmde2.rechargement = rs.getString("rechargement");
					        		detailcmde2.rupture = rs.getString("rupture");
					        		detailcmde2.ligne = rs.getString("Ligne");
					        		detailcmde2.ord_rest_nr = rs.getString("OrdRestNr");
					        		detailcmde2.ord_rad_nr_str_pos = rs.getString("OrdRadNrStrPos");
					        		detailcmde2.dummy_unique_id = rs.getString("DummyUniqueId");
					        		detailcmde2.tournee = rs.getString("Tournee");
					        		detailcmde2.rang = rs.getString("Rang");
					        		detailcmde2.gamme = rs.getString("Gamme");
					        		detailcmde2.prepare = rs.getString("q_pal_code");
					        		detailcmde2.z_picking = rs.getString("Picking");
					        		detailcmdes.add(detailcmde2);
				            	}
				            	session.setAttribute( "detailcmdes", detailcmdes );
				            	session.setAttribute( "exist_commande", "1");
			            	} else {
			            		session.setAttribute( "exist_commande", "-1");
			            	}
			            }
		        	}
		        
		        catch (Exception e) {
		            e.printStackTrace();
		        }
				
			}
			RequestDispatcher rd = request.getRequestDispatcher("/SelectionView");
	        rd.forward(request, response);
		}
		
		if(prev_page.equals("rupture")) {
			//reset lot
			session.setAttribute("lot_lot", null);
			String connectionUrl = "jdbc:sqlserver://" + Constantes.SERVEUR + ";databaseName=" + Constantes.BDD + ";user=" + "sa" + ";password=" + "2bsystem99";
			var foretagKod = session.getAttribute("foretagKod");
			String Login = (String) session.getAttribute("login");
			try (Connection con = DriverManager.getConnection(connectionUrl); Statement stmt = con.createStatement();) {
	        	String SQL = "EXEC q_2bp_java_web_prepa_rupture " 
	        				+ foretagKod + ",'" 
	        				+ Login + "','" 
	        				+ session.getAttribute("num_commande") + "','"
	        				+ session.getAttribute("ligne") + "','"
	        				+ session.getAttribute("dummy_unique_id") + "','" 
	        				+ session.getAttribute("gamme") + "','';";
	        	System.out.println(SQL);
	        	ResultSet rs = stmt.executeQuery(SQL);
	        	String statut;
	        	if(rs.next()) {
		        	statut = rs.getString("Statut");
		        	if(statut.equals("0")) {
						session.setAttribute("error", "no");
						try (Connection con3 = DriverManager.getConnection(connectionUrl); Statement stmt3 = con3.createStatement();) {
	    		        	String SQL3 = "EXEC q_2bp_java_web_prepa_impr_BL " + foretagKod + ",'" + Login + "'," + session.getAttribute("num_commande") + ",'" + session.getAttribute("printer") +"';";
	    		        	System.out.println(SQL3);
	    		        	ResultSet rs3 = stmt3.executeQuery(SQL3);
						}	        
	    		        catch (Exception e) {
	    		            e.printStackTrace();
	    		        }
						RequestDispatcher rd = request.getRequestDispatcher("/Commande");
	    		        rd.forward(request, response);
	    			}else {
	    				try (Connection con2 = DriverManager.getConnection(connectionUrl); Statement stmt2 = con2.createStatement();) {
	    		        	String SQL2 = "EXEC q_2bp_java_web_prepa_get_cde_select " + foretagKod + ",'" + Login + "'," + session.getAttribute("num_commande") + ",'';";
	    		        	System.out.println(SQL2);
	    		        	ResultSet rs2 = stmt.executeQuery(SQL2);
	    		            List<DetailCmde> detailcmdes = new ArrayList<DetailCmde>();
	    			        if(rs2.next()) {
	    			        	if (rs2.getString("exist").equals("1")) {
	    			        		DetailCmde detailcmde = new DetailCmde();
	    				        	detailcmde.num_cde = rs2.getString("NumCde");
	    				        	detailcmde.date_cde = rs2.getString("DateCde");
	    				       		detailcmde.code_cli = rs2.getString("CodeCli");
	    				       		detailcmde.nom_cli = rs2.getString("NomCli");
	    				       		detailcmde.code_art = rs2.getString("CodeArt");
	    				       		detailcmde.lib_art = rs2.getString("LibArt");
	    				       		detailcmde.batchid = rs2.getString("batchid");
	    				       		detailcmde.unite_cde = rs2.getString("Unite_cde");
	    				       		detailcmde.unite_fact = rs2.getString("Unite_fact");
	    				       		detailcmde.unite_stock = rs2.getString("Unite_stock");
	    				       		detailcmde.colis_cde = rs2.getString("colis_cde");
	    				       		detailcmde.pieces_cde = rs2.getString("pieces_cde");
	    				       		detailcmde.poids_cde = rs2.getString("poids_cde");
	    				       		detailcmde.colis_prep = rs2.getString("colis_prep");
	    				       		detailcmde.pieces_prep = rs2.getString("pieces_prep");
	    				       		detailcmde.poids_prep = rs2.getString("poids_prep");
	    				       		detailcmde.qte_cde = rs2.getString("Qte_cde");
	    				       		detailcmde.qte_prep = rs2.getString("Qte_prep");
	    				       		detailcmde.rechargement = rs2.getString("rechargement");
	    			        		detailcmde.rupture = rs2.getString("rupture");
	    			        		detailcmde.ligne = rs2.getString("Ligne");
	    			        		detailcmde.ord_rest_nr = rs2.getString("OrdRestNr");
	    			        		detailcmde.ord_rad_nr_str_pos = rs2.getString("OrdRadNrStrPos");
	    			        		detailcmde.dummy_unique_id = rs2.getString("DummyUniqueId");
	    			        		detailcmde.tournee = rs2.getString("Tournee");
	    			        		detailcmde.rang = rs2.getString("Rang");
	    			        		detailcmde.gamme = rs2.getString("Gamme");
	    			        		detailcmde.prepare = rs2.getString("q_pal_code");
	    			        		detailcmde.z_picking = rs2.getString("Picking");
	    			        		detailcmdes.add(detailcmde);
	    			    		
	    			            	while(rs2.next()) {
	    			            		DetailCmde detailcmde2 = new DetailCmde();
	    			            		detailcmde2.num_cde = rs2.getString("NumCde");
	    				        		detailcmde2.date_cde = rs2.getString("DateCde");
	    				        		detailcmde2.code_cli = rs2.getString("CodeCli");
	    				        		detailcmde2.nom_cli = rs2.getString("NomCli");
	    				        		detailcmde2.code_art = rs2.getString("CodeArt");
	    				        		detailcmde2.lib_art = rs2.getString("LibArt");
	    				        		detailcmde2.batchid = rs2.getString("batchid");
	    				        		detailcmde2.unite_cde = rs2.getString("Unite_cde");
	    					       		detailcmde2.unite_fact = rs2.getString("Unite_fact");
	    					       		detailcmde2.unite_stock = rs2.getString("Unite_stock");
	    					       		detailcmde2.colis_cde = rs2.getString("colis_cde");
	    					       		detailcmde2.pieces_cde = rs2.getString("pieces_cde");
	    					       		detailcmde2.poids_cde = rs2.getString("poids_cde");
	    					       		detailcmde2.colis_prep = rs2.getString("colis_prep");
	    					       		detailcmde2.pieces_prep = rs2.getString("pieces_prep");
	    					       		detailcmde2.poids_prep = rs2.getString("poids_prep");
	    				        		detailcmde2.qte_cde = rs2.getString("Qte_cde");
	    				        		detailcmde2.qte_prep = rs2.getString("Qte_prep");
	    				        		detailcmde2.rechargement = rs2.getString("rechargement");
	    				        		detailcmde2.rupture = rs2.getString("rupture");
	    				        		detailcmde2.ligne = rs2.getString("Ligne");
	    				        		detailcmde2.ord_rest_nr = rs2.getString("OrdRestNr");
	    				        		detailcmde2.ord_rad_nr_str_pos = rs2.getString("OrdRadNrStrPos");
	    				        		detailcmde2.dummy_unique_id = rs2.getString("DummyUniqueId");
	    				        		detailcmde2.tournee = rs2.getString("Tournee");
	    				        		detailcmde2.rang = rs2.getString("Rang");
	    				        		detailcmde2.gamme = rs2.getString("Gamme");
	    				        		detailcmde2.prepare = rs2.getString("q_pal_code");
	    				        		detailcmde2.z_picking = rs2.getString("Picking");
	    				        		detailcmdes.add(detailcmde2);
	    			            	}
	    			            	session.setAttribute( "detailcmdes", detailcmdes );
	    			            	session.setAttribute( "exist_commande", "1");
	    		            	} else {
	    		            		session.setAttribute( "exist_commande", "-1");
	    		            	}
	    		            }
	    	        	}	        
	    		        catch (Exception e) {
	    		            e.printStackTrace();
	    		        }
	    				RequestDispatcher rd = request.getRequestDispatcher("/SelectionView");
	    		        rd.forward(request, response);
	    			}
	        	}
			}
			catch (Exception e) {
	        	e.printStackTrace();
		    }
		}
		
		if(prev_page.equals("recharge")) {
			//reset lot
			session.setAttribute("lot_lot", null);
			String connectionUrl = "jdbc:sqlserver://" + Constantes.SERVEUR + ";databaseName=" + Constantes.BDD + ";user=" + "sa" + ";password=" + "2bsystem99";
			var foretagKod = session.getAttribute("foretagKod");
			String Login = (String) session.getAttribute("login");
			try (Connection con = DriverManager.getConnection(connectionUrl); Statement stmt = con.createStatement();) {
	        	String SQL = "EXEC q_2bp_java_web_prepa_recharge " 
	        				+ foretagKod + ",'" 
	        				+ Login + "','" 
	        				+ session.getAttribute("num_commande") + "','"
	        				+ session.getAttribute("ligne") + "','"
	        				+ session.getAttribute("dummy_unique_id") + "','" 
	        				+ session.getAttribute("gamme") + "','';";
	        	System.out.println(SQL);
	        	ResultSet rs = stmt.executeQuery(SQL);
	        	String statut;
	        	if(rs.next()) {
		        	statut = rs.getString("Statut");
		        	if(statut.equals("0")) {
						session.setAttribute("error", "no");
						try (Connection con3 = DriverManager.getConnection(connectionUrl); Statement stmt3 = con3.createStatement();) {
	    		        	String SQL3 = "EXEC q_2bp_java_web_prepa_impr_BL " + foretagKod + ",'" + Login + "'," + session.getAttribute("num_commande") + ",'" + session.getAttribute("printer") +"';";
	    		        	System.out.println(SQL3);
	    		        	ResultSet rs3 = stmt3.executeQuery(SQL3);
						}	        
	    		        catch (Exception e) {
	    		            e.printStackTrace();
	    		        }
						RequestDispatcher rd = request.getRequestDispatcher("/Commande");
	    		        rd.forward(request, response);
	    			}else {
	    				try (Connection con2 = DriverManager.getConnection(connectionUrl); Statement stmt2 = con2.createStatement();) {
	    		        	String SQL2 = "EXEC q_2bp_java_web_prepa_get_cde_select " + foretagKod + ",'" + Login + "'," + session.getAttribute("num_commande") + ",'';";
	    		        	System.out.println(SQL2);
	    		        	ResultSet rs2 = stmt.executeQuery(SQL2);
	    		            List<DetailCmde> detailcmdes = new ArrayList<DetailCmde>();
	    			        if(rs2.next()) {
	    			        	if (rs2.getString("exist").equals("1")) {
	    			        		DetailCmde detailcmde = new DetailCmde();
	    				        	detailcmde.num_cde = rs2.getString("NumCde");
	    				        	detailcmde.date_cde = rs2.getString("DateCde");
	    				       		detailcmde.code_cli = rs2.getString("CodeCli");
	    				       		detailcmde.nom_cli = rs2.getString("NomCli");
	    				       		detailcmde.code_art = rs2.getString("CodeArt");
	    				       		detailcmde.lib_art = rs2.getString("LibArt");
	    				       		detailcmde.batchid = rs2.getString("batchid");
	    				       		detailcmde.unite_cde = rs2.getString("Unite_cde");
	    				       		detailcmde.unite_fact = rs2.getString("Unite_fact");
	    				       		detailcmde.unite_stock = rs2.getString("Unite_stock");
	    				       		detailcmde.colis_cde = rs2.getString("colis_cde");
	    				       		detailcmde.pieces_cde = rs2.getString("pieces_cde");
	    				       		detailcmde.poids_cde = rs2.getString("poids_cde");
	    				       		detailcmde.colis_prep = rs2.getString("colis_prep");
	    				       		detailcmde.pieces_prep = rs2.getString("pieces_prep");
	    				       		detailcmde.poids_prep = rs2.getString("poids_prep");
	    				       		detailcmde.qte_cde = rs2.getString("Qte_cde");
	    				       		detailcmde.qte_prep = rs2.getString("Qte_prep");
	    				       		detailcmde.rechargement = rs2.getString("rechargement");
	    			        		detailcmde.rupture = rs2.getString("rupture");
	    			        		detailcmde.ligne = rs2.getString("Ligne");
	    			        		detailcmde.ord_rest_nr = rs2.getString("OrdRestNr");
	    			        		detailcmde.ord_rad_nr_str_pos = rs2.getString("OrdRadNrStrPos");
	    			        		detailcmde.dummy_unique_id = rs2.getString("DummyUniqueId");
	    			        		detailcmde.tournee = rs2.getString("Tournee");
	    			        		detailcmde.rang = rs2.getString("Rang");
	    			        		detailcmde.gamme = rs2.getString("Gamme");
	    			        		detailcmde.prepare = rs2.getString("q_pal_code");
	    			        		detailcmde.z_picking = rs2.getString("Picking");
	    			        		detailcmdes.add(detailcmde);
	    			    		
	    			            	while(rs2.next()) {
	    			            		DetailCmde detailcmde2 = new DetailCmde();
	    			            		detailcmde2.num_cde = rs2.getString("NumCde");
	    				        		detailcmde2.date_cde = rs2.getString("DateCde");
	    				        		detailcmde2.code_cli = rs2.getString("CodeCli");
	    				        		detailcmde2.nom_cli = rs2.getString("NomCli");
	    				        		detailcmde2.code_art = rs2.getString("CodeArt");
	    				        		detailcmde2.lib_art = rs2.getString("LibArt");
	    				        		detailcmde2.batchid = rs2.getString("batchid");
	    				        		detailcmde2.unite_cde = rs2.getString("Unite_cde");
	    					       		detailcmde2.unite_fact = rs2.getString("Unite_fact");
	    					       		detailcmde2.unite_stock = rs2.getString("Unite_stock");
	    					       		detailcmde2.colis_cde = rs2.getString("colis_cde");
	    					       		detailcmde2.pieces_cde = rs2.getString("pieces_cde");
	    					       		detailcmde2.poids_cde = rs2.getString("poids_cde");
	    					       		detailcmde2.colis_prep = rs2.getString("colis_prep");
	    					       		detailcmde2.pieces_prep = rs2.getString("pieces_prep");
	    					       		detailcmde2.poids_prep = rs2.getString("poids_prep");
	    				        		detailcmde2.qte_cde = rs2.getString("Qte_cde");
	    				        		detailcmde2.qte_prep = rs2.getString("Qte_prep");
	    				        		detailcmde2.rechargement = rs2.getString("rechargement");
	    				        		detailcmde2.rupture = rs2.getString("rupture");
	    				        		detailcmde2.ligne = rs2.getString("Ligne");
	    				        		detailcmde2.ord_rest_nr = rs2.getString("OrdRestNr");
	    				        		detailcmde2.ord_rad_nr_str_pos = rs2.getString("OrdRadNrStrPos");
	    				        		detailcmde2.dummy_unique_id = rs2.getString("DummyUniqueId");
	    				        		detailcmde2.tournee = rs2.getString("Tournee");
	    				        		detailcmde2.rang = rs2.getString("Rang");
	    				        		detailcmde2.gamme = rs2.getString("Gamme");
	    				        		detailcmde2.prepare = rs2.getString("q_pal_code");
	    				        		detailcmde2.z_picking = rs2.getString("Picking");
	    				        		detailcmdes.add(detailcmde2);
	    			            	}
	    			            	session.setAttribute( "detailcmdes", detailcmdes );
	    			            	session.setAttribute( "exist_commande", "1");
	    		            	} else {
	    		            		session.setAttribute( "exist_commande", "-1");
	    		            	}
	    		            }
	    	        	}	        
	    		        catch (Exception e) {
	    		            e.printStackTrace();
	    		        }
	    				RequestDispatcher rd = request.getRequestDispatcher("/SelectionView");
	    		        rd.forward(request, response);
	    			}
	        	}
			}
	        catch (Exception e) {
	        	e.printStackTrace();
		    }
		}
		
		if(prev_page.equals("validation")) {
			//reset lot
			session.setAttribute("lot_lot", null);
			String connectionUrl = "jdbc:sqlserver://" + Constantes.SERVEUR + ";databaseName=" + Constantes.BDD + ";user=" + "sa" + ";password=" + "2bsystem99";
			var foretagKod = session.getAttribute("foretagKod");
			String Login = (String) session.getAttribute("login");
			String colis;
			String pieces;
			String poids_brut;
			String tare_unitaire;
			String poids_net;
			String ua2;
			String ua8;
			if(request.getParameter("colis").equals("")) {
				colis="0";
			}else {
				colis=request.getParameter("colis");
			}
			if(request.getParameter("pieces").equals("")) {
				pieces="0";
			}else {
				pieces=request.getParameter("pieces");
			}
			if(request.getParameter("poids_brut").equals("")) {
				poids_brut="0";
			}else {
				poids_brut=request.getParameter("poids_brut");
			}
			if(request.getParameter("tare_unitaire").equals("")) {
				tare_unitaire="0";
			}else {
				tare_unitaire=request.getParameter("tare_unitaire");
			}
			if(request.getParameter("poids_net").equals("")) {
				poids_net="0";
			}else {
				poids_net=request.getParameter("poids_net");
			}
			
			if(colis.equals("0")) {
				ua2 = "0";
			}else {
				ua2 = String.valueOf(Float.parseFloat(pieces) / Float.parseFloat(colis));
			}
			//String ua4 = String.valueOf(Float.parseFloat(request.getParameter("poids_brut")) / Float.parseFloat(request.getParameter("colis")));
			String ua7 = String.valueOf(Float.parseFloat(tare_unitaire) * Float.parseFloat(colis));
			
			if(colis.equals("0")) {
				ua8 = "0";
			}else {
				ua8 = String.valueOf(Float.parseFloat(poids_brut) / Float.parseFloat(colis));
			}
			try (Connection con = DriverManager.getConnection(connectionUrl); Statement stmt = con.createStatement();) {
	        	String SQL = "EXEC q_2bp_java_web_prepa_validation " 
	        				+ foretagKod + ",'" 
	        				+ Login + "','" 
	        				+ session.getAttribute("num_commande") + "','"
	        				+ session.getAttribute("ligne") + "','"
	        				+ session.getAttribute("ord_rest_nr") + "','"
	        				+ session.getAttribute("ord_rad_nr_str_pos") + "','"
	        				+ session.getAttribute("dummy_unique_id") + "','" 
	        				+ session.getAttribute("gamme") + "','"
	        				+ colis + "','"
	        				+ ua2 + "','"
	        				+ pieces + "','"
	        				+ poids_brut + "','"
	        				+ tare_unitaire + "','"
	        				+ ua7 + "','"
	        				+ ua8 + "','"
	        				+ poids_net + "','"
	        				+ "N/A" + "','"
	        				+ request.getParameter("force_validation") + "','"
	        				+ request.getParameter("partiel") + "','';";
	        	System.out.println(SQL);
	        	ResultSet rs = stmt.executeQuery(SQL);
	        	String statut;
	        	if(rs.next()) {
		        	statut = rs.getString("Statut");
		        	if(statut.equals("-1")) {
		        		System.out.println("saisie-poids-hn");
		        		session.setAttribute("error", "saisie-poids-hn");
		        		session.setAttribute("msg-validation", "Poids Hors-Norme !");
		        		session.setAttribute("q-validation", "Voulez-vous forcer la validation de la préparation ?");
		        		RequestDispatcher rd = request.getRequestDispatcher("/Saisie");
		                rd.forward(request, response);
		        	}else {
		        		if(statut.equals("-2")) {
		        			System.out.println("saisie-montant-double");
		        			session.setAttribute("error", "saisie-montant-double");
			        		session.setAttribute("msg-validation", "Le montant facturé est le double de l'original !");
			        		session.setAttribute("q-validation", "Voulez-vous forcer la validation de la préparation ?");
			        		RequestDispatcher rd = request.getRequestDispatcher("/Saisie");
			                rd.forward(request, response);
		        		} else {
		        			if(statut.equals("-3")) {
		        				System.out.println("unite fact non saisie");
			        			session.setAttribute("error", "unite-fact-non-saisie");
				        		session.setAttribute("msg-validation", "L'unité de facturation n'a pas été renseignée !");
				        		String string_unite_fact_non_saisie = "Veuillez saisir " + session.getAttribute("unite_fact");
				        		session.setAttribute("q-validation", string_unite_fact_non_saisie);
				        		RequestDispatcher rd = request.getRequestDispatcher("/Saisie");
			    		        rd.forward(request, response);
		        			}else {
		        				if(statut.equals("-4")) {
		        					System.out.println("unite stock non saisie");
				        			session.setAttribute("error", "unite-stock-non-saisie");
					        		session.setAttribute("msg-validation", "L'unité de stock n'a pas été renseignée !");
					        		String string_unite_stock_non_saisie = "Veuillez saisir " + session.getAttribute("unite_stock");
					        		session.setAttribute("q-validation", string_unite_stock_non_saisie);
					        		RequestDispatcher rd = request.getRequestDispatcher("/Saisie");
				    		        rd.forward(request, response);
			        			}else {
			        				if(statut.equals("0")) {
			        					session.setAttribute("error", "no");
			        					try (Connection con3 = DriverManager.getConnection(connectionUrl); Statement stmt3 = con3.createStatement();) {
			    	    		        	String SQL3 = "EXEC q_2bp_java_web_prepa_impr_BL " + foretagKod + ",'" + Login + "'," + session.getAttribute("num_commande") + ",'" + session.getAttribute("printer") +"';";
			    	    		        	System.out.println(SQL3);
			    	    		        	ResultSet rs3 = stmt3.executeQuery(SQL3);
			    						}	        
			    	    		        catch (Exception e) {
			    	    		            e.printStackTrace();
			    	    		        }
			        					RequestDispatcher rd = request.getRequestDispatcher("/Commande");
					    		        rd.forward(request, response);
				        			}else {
			        					session.setAttribute("error", "no");
					        			try (Connection con2 = DriverManager.getConnection(connectionUrl); Statement stmt2 = con.createStatement();) {
					    		        	String SQL2 = "EXEC q_2bp_java_web_prepa_get_cde_select " + foretagKod + ",'" + Login + "'," + session.getAttribute("num_commande") + ",'';";
					    		        	System.out.println(SQL2);
					    		        	ResultSet rs2 = stmt2.executeQuery(SQL2);
					    		            List<DetailCmde> detailcmdes = new ArrayList<DetailCmde>();
					    			            if(rs2.next()) {
					    			            	if (rs2.getString("exist").equals("1")) {
					    				        		DetailCmde detailcmde = new DetailCmde();
					    				        		detailcmde.num_cde = rs2.getString("NumCde");
					    				        		detailcmde.date_cde = rs2.getString("DateCde");
					    				        		detailcmde.code_cli = rs2.getString("CodeCli");
					    				        		detailcmde.nom_cli = rs2.getString("NomCli");
					    				        		detailcmde.code_art = rs2.getString("CodeArt");
					    				        		detailcmde.lib_art = rs2.getString("LibArt");
					    				        		detailcmde.batchid = rs2.getString("batchid");
					    				        		detailcmde.unite_cde = rs2.getString("Unite_cde");
					    					       		detailcmde.unite_fact = rs2.getString("Unite_fact");
					    					       		detailcmde.unite_stock = rs2.getString("Unite_stock");
					    					       		detailcmde.colis_cde = rs2.getString("colis_cde");
					    					       		detailcmde.pieces_cde = rs2.getString("pieces_cde");
					    					       		detailcmde.poids_cde = rs2.getString("poids_cde");
					    					       		detailcmde.colis_prep = rs2.getString("colis_prep");
					    					       		detailcmde.pieces_prep = rs2.getString("pieces_prep");
					    					       		detailcmde.poids_prep = rs2.getString("poids_prep");
					    				        		detailcmde.qte_cde = rs2.getString("Qte_cde");
					    				        		detailcmde.qte_prep = rs2.getString("Qte_prep");
					    				        		detailcmde.rechargement = rs2.getString("rechargement");
					    				        		detailcmde.rupture = rs2.getString("rupture");
					    				        		detailcmde.ligne = rs2.getString("Ligne");
					    				        		detailcmde.ord_rest_nr = rs2.getString("OrdRestNr");
					    				        		detailcmde.ord_rad_nr_str_pos = rs2.getString("OrdRadNrStrPos");
					    				        		detailcmde.dummy_unique_id = rs2.getString("DummyUniqueId");
					    				        		detailcmde.tournee = rs2.getString("Tournee");
					    				        		detailcmde.rang = rs2.getString("Rang");
					    				        		detailcmde.gamme = rs2.getString("Gamme");
					    				        		detailcmde.prepare = rs2.getString("q_pal_code");
					    				        		detailcmde.z_picking = rs2.getString("Picking");
					    				        		detailcmdes.add(detailcmde);
					    				    		
					    				            	while(rs2.next()) {
					    				            		DetailCmde detailcmde2 = new DetailCmde();
					    				            		detailcmde2.num_cde = rs2.getString("NumCde");
					    					        		detailcmde2.date_cde = rs2.getString("DateCde");
					    					        		detailcmde2.code_cli = rs2.getString("CodeCli");
					    					        		detailcmde2.nom_cli = rs2.getString("NomCli");
					    					        		detailcmde2.code_art = rs2.getString("CodeArt");
					    					        		detailcmde2.lib_art = rs2.getString("LibArt");
					    					        		detailcmde2.batchid = rs2.getString("batchid");
					    					        		detailcmde2.unite_cde = rs2.getString("Unite_cde");
					    						       		detailcmde2.unite_fact = rs2.getString("Unite_fact");
					    						       		detailcmde2.unite_stock = rs2.getString("Unite_stock");
					    						       		detailcmde2.colis_cde = rs2.getString("colis_cde");
					    						       		detailcmde2.pieces_cde = rs2.getString("pieces_cde");
					    						       		detailcmde2.poids_cde = rs2.getString("poids_cde");
					    						       		detailcmde2.colis_prep = rs2.getString("colis_prep");
					    						       		detailcmde2.pieces_prep = rs2.getString("pieces_prep");
					    						       		detailcmde2.poids_prep = rs2.getString("poids_prep");
					    						       		detailcmde2.qte_cde = rs2.getString("Qte_cde");
					    					        		detailcmde2.qte_prep = rs2.getString("Qte_prep");
					    					        		detailcmde2.rechargement = rs2.getString("rechargement");
					    					        		detailcmde2.rupture = rs2.getString("rupture");
					    					        		detailcmde2.ligne = rs2.getString("Ligne");
					    					        		detailcmde2.ord_rest_nr = rs2.getString("OrdRestNr");
					    					        		detailcmde2.ord_rad_nr_str_pos = rs2.getString("OrdRadNrStrPos");
					    					        		detailcmde2.dummy_unique_id = rs2.getString("DummyUniqueId");
					    					        		detailcmde2.tournee = rs2.getString("Tournee");
					    					        		detailcmde2.rang = rs2.getString("Rang");
					    					        		detailcmde2.gamme = rs2.getString("Gamme");
					    					        		detailcmde2.prepare = rs2.getString("q_pal_code");
					    					        		detailcmde2.z_picking = rs2.getString("Picking");
					    					        		detailcmdes.add(detailcmde2);
					    				            	}
					    				            	session.setAttribute( "detailcmdes", detailcmdes );
					    				            	session.setAttribute( "exist_commande", "1");
					    			            	} else {
					    			            		session.setAttribute( "exist_commande", "-1");
					    			            	}
					    			            }
					    		        	}
					    		        
					    		        catch (Exception e) {
					    		            e.printStackTrace();
					    		        }
					    				RequestDispatcher rd = request.getRequestDispatcher("/SelectionView");
					    		        rd.forward(request, response);
					        		}
		        				}
		        			}
		        		}
		        	}
	        	}
	        }
	        catch (Exception e) {
	        	e.printStackTrace();
		    }
		}
		
		if(prev_page.equals("saisie_retour")) {
			String connectionUrl = "jdbc:sqlserver://" + Constantes.SERVEUR + ";databaseName=" + Constantes.BDD + ";user=" + "sa" + ";password=" + "2bsystem99";
			var foretagKod = session.getAttribute("foretagKod");
			String Login = (String) session.getAttribute("login");			
			try (Connection con = DriverManager.getConnection(connectionUrl); Statement stmt = con.createStatement();) {
	        	String SQL = "EXEC q_2bp_java_web_prepa_get_cde_select " + foretagKod + ",'" + Login + "'," + session.getAttribute("num_commande") + ",'';";
	        	System.out.println(SQL);
	        	ResultSet rs = stmt.executeQuery(SQL);
	            List<DetailCmde> detailcmdes = new ArrayList<DetailCmde>();
		        if(rs.next()) {
		        	if (rs.getString("exist").equals("1")) {
		        		DetailCmde detailcmde = new DetailCmde();
			        	detailcmde.num_cde = rs.getString("NumCde");
			        	detailcmde.date_cde = rs.getString("DateCde");
			       		detailcmde.code_cli = rs.getString("CodeCli");
			       		detailcmde.nom_cli = rs.getString("NomCli");
			       		detailcmde.code_art = rs.getString("CodeArt");
			       		detailcmde.lib_art = rs.getString("LibArt");
			       		detailcmde.batchid = rs.getString("batchid");
			       		detailcmde.unite_cde = rs.getString("Unite_cde");
			       		detailcmde.unite_fact = rs.getString("Unite_fact");
			       		detailcmde.unite_stock = rs.getString("Unite_stock");
			       		detailcmde.colis_cde = rs.getString("colis_cde");
			       		detailcmde.pieces_cde = rs.getString("pieces_cde");
			       		detailcmde.poids_cde = rs.getString("poids_cde");
			       		detailcmde.colis_prep = rs.getString("colis_prep");
			       		detailcmde.pieces_prep = rs.getString("pieces_prep");
			       		detailcmde.poids_prep = rs.getString("poids_prep");
			       		detailcmde.qte_cde = rs.getString("Qte_cde");
			       		detailcmde.qte_prep = rs.getString("Qte_prep");
			       		detailcmde.rechargement = rs.getString("rechargement");
		        		detailcmde.rupture = rs.getString("rupture");
		        		detailcmde.ligne = rs.getString("Ligne");
		        		detailcmde.ord_rest_nr = rs.getString("OrdRestNr");
		        		detailcmde.ord_rad_nr_str_pos = rs.getString("OrdRadNrStrPos");
		        		detailcmde.dummy_unique_id = rs.getString("DummyUniqueId");
		        		detailcmde.tournee = rs.getString("Tournee");
		        		detailcmde.rang = rs.getString("Rang");
		        		detailcmde.gamme = rs.getString("Gamme");
		        		detailcmde.prepare = rs.getString("q_pal_code");
		        		detailcmde.z_picking = rs.getString("Picking");
		        		detailcmdes.add(detailcmde);
		    		
		            	while(rs.next()) {
		            		DetailCmde detailcmde2 = new DetailCmde();
		            		detailcmde2.num_cde = rs.getString("NumCde");
			        		detailcmde2.date_cde = rs.getString("DateCde");
			        		detailcmde2.code_cli = rs.getString("CodeCli");
			        		detailcmde2.nom_cli = rs.getString("NomCli");
			        		detailcmde2.code_art = rs.getString("CodeArt");
			        		detailcmde2.lib_art = rs.getString("LibArt");
			        		detailcmde2.batchid = rs.getString("batchid");
			        		detailcmde2.unite_cde = rs.getString("Unite_cde");
				       		detailcmde2.unite_fact = rs.getString("Unite_fact");
				       		detailcmde2.unite_stock = rs.getString("Unite_stock");
				       		detailcmde2.colis_cde = rs.getString("colis_cde");
				       		detailcmde2.pieces_cde = rs.getString("pieces_cde");
				       		detailcmde2.poids_cde = rs.getString("poids_cde");
				       		detailcmde2.colis_prep = rs.getString("colis_prep");
				       		detailcmde2.pieces_prep = rs.getString("pieces_prep");
				       		detailcmde2.poids_prep = rs.getString("poids_prep");
			        		detailcmde2.qte_cde = rs.getString("Qte_cde");
			        		detailcmde2.qte_prep = rs.getString("Qte_prep");
			        		detailcmde2.rechargement = rs.getString("rechargement");
			        		detailcmde2.rupture = rs.getString("rupture");
			        		detailcmde2.ligne = rs.getString("Ligne");
			        		detailcmde2.ord_rest_nr = rs.getString("OrdRestNr");
			        		detailcmde2.ord_rad_nr_str_pos = rs.getString("OrdRadNrStrPos");
			        		detailcmde2.dummy_unique_id = rs.getString("DummyUniqueId");
			        		detailcmde2.tournee = rs.getString("Tournee");
			        		detailcmde2.rang = rs.getString("Rang");
			        		detailcmde2.gamme = rs.getString("Gamme");
			        		detailcmde2.prepare = rs.getString("q_pal_code");
			        		detailcmde2.z_picking = rs.getString("Picking");
			        		detailcmdes.add(detailcmde2);
		            	}
		            	session.setAttribute( "detailcmdes", detailcmdes );
		            	session.setAttribute( "exist_commande", "1");
	            	} else {
	            		session.setAttribute( "exist_commande", "-1");
	            	}
	            }
        	}	        
	        catch (Exception e) {
	            e.printStackTrace();
	        }
			
			// reset lot ?????
			session.setAttribute("lot_lot", null);
			RequestDispatcher rd = request.getRequestDispatcher("/SelectionView");
	        rd.forward(request, response);
		}
		
		if(prev_page.equals("remplacement_article")) {
			String connectionUrl = "jdbc:sqlserver://" + Constantes.SERVEUR + ";databaseName=" + Constantes.BDD + ";user=" + "sa" + ";password=" + "2bsystem99";
			var foretagKod = session.getAttribute("foretagKod");
			String Login = (String) session.getAttribute("login");
			
			// remplacement d'article
			try (Connection con = DriverManager.getConnection(connectionUrl); Statement stmt = con.createStatement();) {
	        	String SQL = "EXEC q_2bp_java_web_prepa_remplacer_article " + foretagKod + ",'" 
	        																	+ Login + "'," 
	        																	+ session.getAttribute("num_commande") + ","
	        																	+ session.getAttribute("ligne") + ",'"
	        																	+ session.getAttribute("code_art") + "','"
	        																	+ request.getParameter("code_article_select") + "','"
	        																	+ session.getAttribute("dummy_unique_id")+ "';";
	        	System.out.println(SQL);
	        	ResultSet rs = stmt.executeQuery(SQL);
		        if(rs.next()) {
		        	if (rs.getString("Statut").equals("1")) {
		            	session.setAttribute("errorRemplacement", "Impossible de remplacer car Unité de facturation différente");
		        		this.getServletContext().getRequestDispatcher( "/WEB-INF/remplacement_article.jsp" ).forward( request, response );
	            	} else {
	            		if (rs.getString("Statut").equals("0")) {
		            		session.setAttribute("errorRemplacement", null);
		            	} else {
		            		session.setAttribute("errorRemplacement", "Error");
			        		this.getServletContext().getRequestDispatcher( "/WEB-INF/remplacement_article.jsp" ).forward( request, response );
		            	}
	            	}
	            }
        	}	        
	        catch (Exception e) {
	            e.printStackTrace();
	        }
			
			try (Connection con = DriverManager.getConnection(connectionUrl); Statement stmt = con.createStatement();) {
	        	String SQL = "EXEC q_2bp_java_web_prepa_get_cde_select " + foretagKod + ",'" + Login + "'," + session.getAttribute("num_commande") + ",'';";
	        	System.out.println(SQL);
	        	ResultSet rs = stmt.executeQuery(SQL);
	            List<DetailCmde> detailcmdes = new ArrayList<DetailCmde>();
		        if(rs.next()) {
		        	if (rs.getString("exist").equals("1")) {
		        		DetailCmde detailcmde = new DetailCmde();
			        	detailcmde.num_cde = rs.getString("NumCde");
			        	detailcmde.date_cde = rs.getString("DateCde");
			       		detailcmde.code_cli = rs.getString("CodeCli");
			       		detailcmde.nom_cli = rs.getString("NomCli");
			       		detailcmde.code_art = rs.getString("CodeArt");
			       		detailcmde.lib_art = rs.getString("LibArt");
			       		detailcmde.batchid = rs.getString("batchid");
			       		detailcmde.unite_cde = rs.getString("Unite_cde");
			       		detailcmde.unite_fact = rs.getString("Unite_fact");
			       		detailcmde.unite_stock = rs.getString("Unite_stock");
			       		detailcmde.colis_cde = rs.getString("colis_cde");
			       		detailcmde.pieces_cde = rs.getString("pieces_cde");
			       		detailcmde.poids_cde = rs.getString("poids_cde");
			       		detailcmde.colis_prep = rs.getString("colis_prep");
			       		detailcmde.pieces_prep = rs.getString("pieces_prep");
			       		detailcmde.poids_prep = rs.getString("poids_prep");
			       		detailcmde.qte_cde = rs.getString("Qte_cde");
			       		detailcmde.qte_prep = rs.getString("Qte_prep");
			       		detailcmde.rechargement = rs.getString("rechargement");
		        		detailcmde.rupture = rs.getString("rupture");
		        		detailcmde.ligne = rs.getString("Ligne");
		        		detailcmde.ord_rest_nr = rs.getString("OrdRestNr");
		        		detailcmde.ord_rad_nr_str_pos = rs.getString("OrdRadNrStrPos");
		        		detailcmde.dummy_unique_id = rs.getString("DummyUniqueId");
		        		detailcmde.tournee = rs.getString("Tournee");
		        		detailcmde.rang = rs.getString("Rang");
		        		detailcmde.gamme = rs.getString("Gamme");
		        		detailcmde.prepare = rs.getString("q_pal_code");
		        		detailcmde.z_picking = rs.getString("Picking");
		        		detailcmdes.add(detailcmde);
		    		
		            	while(rs.next()) {
		            		DetailCmde detailcmde2 = new DetailCmde();
		            		detailcmde2.num_cde = rs.getString("NumCde");
			        		detailcmde2.date_cde = rs.getString("DateCde");
			        		detailcmde2.code_cli = rs.getString("CodeCli");
			        		detailcmde2.nom_cli = rs.getString("NomCli");
			        		detailcmde2.code_art = rs.getString("CodeArt");
			        		detailcmde2.lib_art = rs.getString("LibArt");
			        		detailcmde2.batchid = rs.getString("batchid");
			        		detailcmde2.unite_cde = rs.getString("Unite_cde");
				       		detailcmde2.unite_fact = rs.getString("Unite_fact");
				       		detailcmde2.unite_stock = rs.getString("Unite_stock");
				       		detailcmde2.colis_cde = rs.getString("colis_cde");
				       		detailcmde2.pieces_cde = rs.getString("pieces_cde");
				       		detailcmde2.poids_cde = rs.getString("poids_cde");
				       		detailcmde2.colis_prep = rs.getString("colis_prep");
				       		detailcmde2.pieces_prep = rs.getString("pieces_prep");
				       		detailcmde2.poids_prep = rs.getString("poids_prep");
			        		detailcmde2.qte_cde = rs.getString("Qte_cde");
			        		detailcmde2.qte_prep = rs.getString("Qte_prep");
			        		detailcmde2.rechargement = rs.getString("rechargement");
			        		detailcmde2.rupture = rs.getString("rupture");
			        		detailcmde2.ligne = rs.getString("Ligne");
			        		detailcmde2.ord_rest_nr = rs.getString("OrdRestNr");
			        		detailcmde2.ord_rad_nr_str_pos = rs.getString("OrdRadNrStrPos");
			        		detailcmde2.dummy_unique_id = rs.getString("DummyUniqueId");
			        		detailcmde2.tournee = rs.getString("Tournee");
			        		detailcmde2.rang = rs.getString("Rang");
			        		detailcmde2.gamme = rs.getString("Gamme");
			        		detailcmde2.prepare = rs.getString("q_pal_code");
			        		detailcmde2.z_picking = rs.getString("Picking");
			        		detailcmdes.add(detailcmde2);
		            	}
		            	session.setAttribute( "detailcmdes", detailcmdes );
		            	session.setAttribute( "exist_commande", "1");
	            	} else {
	            		session.setAttribute( "exist_commande", "-1");
	            	}
	            }
        	}	        
	        catch (Exception e) {
	            e.printStackTrace();
	        }
			// reset lot
			session.setAttribute("lot_lot", null);
			// ?????? A tester si utile car peut etre code legacy
			RequestDispatcher rd = request.getRequestDispatcher("/SelectionView");
	        rd.forward(request, response);
		}
		
	}
	
	public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher( "/WEB-INF/selection.jsp" ).forward( request, response );
	}
}
