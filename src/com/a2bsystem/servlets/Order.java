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

import com.a2bsystem.models.Ord;
import com.a2bsystem.models.Pays;
import com.a2bsystem.models.Constantes;


@WebServlet("/Order")
public class Order extends HttpServlet {
	
	@Override
	protected void doPost( HttpServletRequest request, HttpServletResponse response ) 
			throws ServletException, IOException {
				
		HttpSession session = request.getSession();
		String prev_page = request.getParameter("prev_page");
		System.out.println(prev_page);
		String connectionUrl = "jdbc:sqlserver://" + Constantes.SERVEUR + ";databaseName=" + Constantes.BDD + ";user=" + "sa" + ";password=" + "2bsystem99";
		var foretagKod = session.getAttribute("foretagKod");
		String Login = (String) session.getAttribute("login");

		
		if(prev_page.equals("commande")) {
			//this.getServletContext().getRequestDispatcher( "/WEB-INF/order.jsp" ).forward( request, response );
		}
		
		// set client depuis la page client
		String Client_select = request.getParameter("client_select");
		if(request.getParameter("prev_page").equals("client")) {
			if(Client_select != "") {
				try (Connection con = DriverManager.getConnection(connectionUrl); Statement stmt = con.createStatement();) {
					 String SQL = "SELECT UPPER(XR.landskod)AS Code_Pays,XR.Land AS Libelle_Pays FROM xr XR WITH(NOLOCK) WHERE XR.ForetagKod = "+ foretagKod + " order by case when UPPER(XR.landskod) = 'FR' then 0 else 1 end, Code_Pays ASC;";
					 System.out.println(SQL);
					 ResultSet rs = stmt.executeQuery(SQL);
					 List<Pays> liste_pays = new ArrayList<Pays>();
		        	if(rs.next()) {
		        		Pays pays = new Pays();
		        		pays.code = rs.getString("Code_Pays");
		        		pays.libelle = rs.getString("Libelle_Pays");
		        		liste_pays.add(pays);
		    		
		            	while(rs.next()) {
		            		Pays pays2 = new Pays();
		            		pays2.code = rs.getString("Code_Pays");
		            		pays2.libelle = rs.getString("Libelle_Pays");
		            		liste_pays.add(pays2);
		            	}  
		            	request.setAttribute( "liste_pays", liste_pays );
		        	}
				}
		        catch (Exception e) {
		            e.printStackTrace();
		        }
				
				session.setAttribute( "client_order", request.getParameter("client_select"));
				session.setAttribute( "code_client_order", request.getParameter("code_client_select"));
				session.setAttribute( "client_divers_order", request.getParameter("client_divers_select"));
			}
			//this.getServletContext().getRequestDispatcher( "/WEB-INF/order.jsp" ).forward( request, response );

		}
		
		
		if(request.getParameter("prev_page").equals("saisie_order")) {
			try (Connection con = DriverManager.getConnection(connectionUrl); Statement stmt = con.createStatement();) {
				String SQL;
				if(session.getAttribute("client_divers_order").equals("1")) {
					SQL = "EXEC q_2bp_java_ventes_create_ligne " + foretagKod + ",'" 
																 + Login + "','"
																 + session.getAttribute("code_client_order") + "','"
																 + session.getAttribute("vendeur") + "','"
																 + session.getAttribute("code_article_order")+"',"
																 + request.getParameter("colis_order") + ","
																 + request.getParameter("pieces_order")+ ","
																 + request.getParameter("poids_net_order")+ ","
																 + "0,"
																 + request.getParameter("poids_net_order")+ ","
																 + request.getParameter("prix_order")+ ","
																 + "@q_gcoh_divftgnr = '" + session.getAttribute("nom_client_divers") + "',"
																 + "@ordlevadr1 = '" + session.getAttribute("adresse_client_divers") + "',"
																 + "@ordlevadr2 = '" + session.getAttribute("adresse2_client_divers") + "',"
																 + "@q_gcoh_divcp = '" + session.getAttribute("cp_client_divers") + "',"
																 + "@q_gcoh_divville = '" + session.getAttribute("ville_client_divers") + "',"
																 + "@ordlevadrlandskod = '" + session.getAttribute("code_pays_client_divers") + "'"
																 + ";";
					//  reset client divers
					session.setAttribute("client_divers_order", "0");
					session.setAttribute("nom_divers_order", null);
					session.setAttribute("adresse_divers_order", null);
					session.setAttribute("adresse2_client_divers", null);
					session.setAttribute("cp_divers_order", null);
					session.setAttribute("ville_divers_order", null);
					session.setAttribute("code_pays_client_divers", null);
				}else {
					SQL = "EXEC q_2bp_java_ventes_create_ligne " + foretagKod + ",'" 
							 									 + Login + "','"
					 											 + session.getAttribute("code_client_order") + "','"
					 											 + session.getAttribute("vendeur") + "','"
					 											 + session.getAttribute("code_article_order")+"',"
					 											 + request.getParameter("colis_order") + ","
					 											 + request.getParameter("pieces_order")+ ","
					 											 + request.getParameter("poids_net_order")+ ","
					 											 + "0,"
					 											 + request.getParameter("poids_net_order")+ ","
					 											 + request.getParameter("prix_order")
					 											 + ";";
				}
				 System.out.println(SQL);
				 ResultSet rs = stmt.executeQuery(SQL);
				 if(rs.next()) {
					 session.setAttribute("num_order", rs.getString("OrderNr"));
					 session.setAttribute("exist_order", "1");
				 }
			}
	        catch (Exception e) {
	            e.printStackTrace();
	        }
			
			try (Connection con = DriverManager.getConnection(connectionUrl); Statement stmt2 = con.createStatement();) {
				String SQL2 = "EXEC q_2bp_java_web_order_get_orp " + foretagKod + ",'" 
						   										   + session.getAttribute("vendeur") + "','"
						   										   + session.getAttribute("code_client_order")+ "',"
						   										   + "@NumCmde = '" + session.getAttribute("num_order") + "';";
				 System.out.println(SQL2);
				 ResultSet rs2 = stmt2.executeQuery(SQL2);
				 List<Ord> orders = new ArrayList<Ord>();
				 if(rs2.next()) {
		        	Ord order = new Ord();
		        	order.num_commande = rs2.getString("OrderNr");
		        	order.code_article = rs2.getString("Artnr");
		        	order.num_ligne = rs2.getString("OrdRadNr");
		        	order.libelle_article = rs2.getString("Lib");
		        	order.colis = rs2.getString("Colis");
		        	order.poids_net = rs2.getString("PdsNet");
		        	order.pieces = rs2.getString("Pieces");
		        	order.montant = rs2.getString("Montant");
		        	
		            orders.add(order);
		    		
		            while(rs2.next()) {
		            	Ord order2 = new Ord();
			        	order2.num_commande = rs2.getString("OrderNr");
			        	order2.code_article = rs2.getString("Artnr");
			        	order2.num_ligne = rs2.getString("OrdRadNr");
			        	order2.libelle_article = rs2.getString("Lib");
			        	order2.colis = rs2.getString("Colis");
			        	order2.poids_net = rs2.getString("PdsNet");
			        	order2.pieces = rs2.getString("Pieces");
			        	order2.montant = rs2.getString("Montant");
			        	orders.add(order2);
		            } 
		            request.setAttribute( "orders", orders );
		        }
			}
	        catch (Exception e) {
	            e.printStackTrace();
	        }  
			
			
			//this.getServletContext().getRequestDispatcher( "/WEB-INF/order.jsp" ).forward( request, response );

		}
		
		if(request.getParameter("prev_page").equals("article")) {
			try (Connection con = DriverManager.getConnection(connectionUrl); Statement stmt2 = con.createStatement();) {
				String SQL2 = "EXEC q_2bp_java_web_order_get_orp " + foretagKod + ",'" 
						 										   + session.getAttribute("vendeur") + "','"
						 										   + session.getAttribute("code_client_order")+ "',"
						 										   + "@NumCmde = '" + session.getAttribute("num_order") + "';";
				 System.out.println(SQL2);
				 ResultSet rs2 = stmt2.executeQuery(SQL2);
				 List<Ord> orders = new ArrayList<Ord>();
				 if(rs2.next()) {
		        	Ord order = new Ord();
		        	order.num_commande = rs2.getString("OrderNr");
		        	order.code_article = rs2.getString("Artnr");
		        	order.num_ligne = rs2.getString("OrdRadNr");
		        	order.libelle_article = rs2.getString("Lib");
		        	order.colis = rs2.getString("Colis");
		        	order.poids_net = rs2.getString("PdsNet");
		        	order.pieces = rs2.getString("Pieces");
		        	order.montant = rs2.getString("Montant");
		        	
		            orders.add(order);
		    		
		            while(rs2.next()) {
		            	Ord order2 = new Ord();
			        	order2.num_commande = rs2.getString("OrderNr");
			        	order2.code_article = rs2.getString("Artnr");
			        	order2.num_ligne = rs2.getString("OrdRadNr");
			        	order2.libelle_article = rs2.getString("Lib");
			        	order2.colis = rs2.getString("Colis");
			        	order2.poids_net = rs2.getString("PdsNet");
			        	order2.pieces = rs2.getString("Pieces");
			        	order2.montant = rs2.getString("Montant");
			        	orders.add(order2);
		            } 
		            request.setAttribute( "orders", orders );
		        }
			}
	        catch (Exception e) {
	            e.printStackTrace();
	        }  
			//this.getServletContext().getRequestDispatcher( "/WEB-INF/order.jsp" ).forward( request, response );
		}

		if(request.getParameter("prev_page").equals("edition_facture")) {
			try (Connection con = DriverManager.getConnection(connectionUrl); Statement stmt = con.createStatement();) {
				 String SQL = "EXEC q_2bp_java_web_order_validation_commande " + foretagKod + ","
						 													   + "'ADM',"
						 											  		   + session.getAttribute("num_order") + ",'"
						 											  		   + session.getAttribute("printer") 
						 											  		   + "';";
						 											
				 System.out.println(SQL);
				 ResultSet rs = stmt.executeQuery(SQL);
				 session.setAttribute( "client_order", null);
				 session.setAttribute( "code_client_order", null);
				 session.setAttribute("num_order", null);
				 session.setAttribute( "exist_order", null);
			}
			catch (Exception e) {
	            e.printStackTrace();
	        }
			session.setAttribute("num_order", null);
			session.setAttribute( "exist_order", null);
			//this.getServletContext().getRequestDispatcher( "/WEB-INF/order.jsp" ).forward( request, response );
		}
		

		if(request.getParameter("prev_page").equals("annuler")) {
			try (Connection con = DriverManager.getConnection(connectionUrl); Statement stmt2 = con.createStatement();) {
				String SQL2 = "EXEC q_2bp_java_web_order_get_orp " + foretagKod + ",'" 
						   										   + session.getAttribute("vendeur") + "','"
						   										   + session.getAttribute("code_client_order")+ "',"
						   										   + "@NumCmde = '" + session.getAttribute("num_order") + "';";
				 System.out.println(SQL2);
				 ResultSet rs2 = stmt2.executeQuery(SQL2);
				 List<Ord> orders = new ArrayList<Ord>();
				 if(rs2.next()) {
		        	Ord order = new Ord();
		        	order.num_commande = rs2.getString("OrderNr");
		        	order.code_article = rs2.getString("Artnr");
		        	order.num_ligne = rs2.getString("OrdRadNr");
		        	order.libelle_article = rs2.getString("Lib");
		        	order.colis = rs2.getString("Colis");
		        	order.poids_net = rs2.getString("PdsNet");
		        	order.pieces = rs2.getString("Pieces");
		        	order.montant = rs2.getString("Montant");
		        	
		            orders.add(order);
		    		
		            while(rs2.next()) {
		            	Ord order2 = new Ord();
			        	order2.num_commande = rs2.getString("OrderNr");
			        	order2.code_article = rs2.getString("Artnr");
			        	order2.num_ligne = rs2.getString("OrdRadNr");
			        	order2.libelle_article = rs2.getString("Lib");
			        	order2.colis = rs2.getString("Colis");
			        	order2.poids_net = rs2.getString("PdsNet");
			        	order2.pieces = rs2.getString("Pieces");
			        	order2.montant = rs2.getString("Montant");
			        	orders.add(order2);
		            } 
		            request.setAttribute( "orders", orders );
		        	request.setAttribute("ligne", "1");

		        } else {
		        	request.setAttribute("ligne", "0");
		        }
			}
	        catch (Exception e) {
	            e.printStackTrace();
	        }
			
			//this.getServletContext().getRequestDispatcher( "/WEB-INF/order.jsp" ).forward( request, response );

		}
		this.getServletContext().getRequestDispatcher( "/WEB-INF/order.jsp" ).forward( request, response );

		
	}
	
	public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher( "/WEB-INF/selection.jsp" ).forward( request, response );
	}
	
}
