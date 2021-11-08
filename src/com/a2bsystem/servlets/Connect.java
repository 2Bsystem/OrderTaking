package com.a2bsystem.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.a2bsystem.models.Constantes;

@WebServlet("/Connect")
public class Connect extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String prev_page = request.getParameter("prev_page");
		if(prev_page.equals("deconnexion")) {			
			session.setAttribute( "date", null);
					
			session.setAttribute( "article", null);
			session.setAttribute( "code_article", null);
			
			session.setAttribute( "client", null);
			session.setAttribute( "code_client", null);
			
			session.setAttribute( "code_articleOA", null);
			session.setAttribute( "num_commande", null);
			session.setAttribute( "detailcmdes", null);
			session.setAttribute("msg-validation", null);
    		session.setAttribute("q-validation", null);
			
			session.setAttribute( "client_commande", null);
			session.setAttribute( "code_client_commande", null);
			session.setAttribute( "date_commande", null);
			session.setAttribute( "num_commande_commande", null);
			session.setAttribute( "id_tournee_commande", null);
			session.setAttribute( "tournee_commande", null);
			session.setAttribute( "gamme_commande", null);
			session.setAttribute( "exist_commande", null);
			
			session.setAttribute("code_art", null);
			session.setAttribute("lib_art", null);
			session.setAttribute("ligne", null);
			session.setAttribute("gamme", null);
			session.setAttribute("ord_rest_nr", null);
			session.setAttribute("ord_rad_nr_str_pos", null);
			session.setAttribute("dummy_unique_id", null);
			session.setAttribute("qte_cde", null);
			session.setAttribute("unite", null);
			session.setAttribute("mode", null);
			
			session.setAttribute("error", "no");
			
			//remplacement d'article
    		session.setAttribute("errorRemplacement", null);
			
    		//order
			session.setAttribute("client_order", null);
			session.setAttribute("code_client_order", null);
			session.setAttribute("num_order", null);
			session.setAttribute("exist_order", null);
			session.setAttribute("client_divers_order", "0");
			session.setAttribute("nom_divers_order", null);
			session.setAttribute("adresse_divers_order", null);
			session.setAttribute("adresse2_client_divers", null);
			session.setAttribute("cp_divers_order", null);
			session.setAttribute("ville_divers_order", null);
			session.setAttribute("code_pays_client_divers", null);


			
			session.setAttribute("login", null);
			request.setAttribute( "ids", "");
			request.setAttribute("erreur_url", false);
			request.setAttribute("erreur_param", false);
			RequestDispatcher rd = request.getRequestDispatcher("/Home");
			rd.forward(request, response);
		}
		else {
			// Get config
			String Login = request.getParameter("login");
			String Password = request.getParameter("password");
			
			session.setAttribute( "date", null);
			
			session.setAttribute( "article", null);
			session.setAttribute( "code_article", null);
			
			session.setAttribute( "client", null);
			session.setAttribute( "code_client", null);
			
			session.setAttribute( "code_articleOA", null);
			session.setAttribute( "num_commande", null);
			session.setAttribute( "detailcmdes", null);
			session.setAttribute("msg-validation", null);
    		session.setAttribute("q-validation", null);
			
			session.setAttribute( "client_commande", null);
			session.setAttribute( "code_client_commande", null);
			session.setAttribute( "date_commande", null);
			session.setAttribute( "num_commande_commande", null);
			session.setAttribute( "id_tournee_commande", null);
			session.setAttribute( "tournee_commande", null);
			session.setAttribute( "gamme_commande", null);
			session.setAttribute( "exist_commande", null);
			
			session.setAttribute("code_art", null);
			session.setAttribute("lib_art", null);
			session.setAttribute("ligne", null);
			session.setAttribute("gamme", null);
			session.setAttribute("ord_rest_nr", null);
			session.setAttribute("ord_rad_nr_str_pos", null);
			session.setAttribute("dummy_unique_id", null);
			session.setAttribute("qte_cde", null);
			session.setAttribute("unite", null);
			session.setAttribute("mode", null);
			
			session.setAttribute("lot_lot", null);
			
			session.setAttribute("error", "no");
			
			//remplacement d'article
    		session.setAttribute("errorRemplacement", null);
			
    		//order
			session.setAttribute( "client_order", null);
			session.setAttribute( "code_client_order", null);
			session.setAttribute("num_order", null);
			session.setAttribute( "exist_order", null);
			session.setAttribute("client_divers_order", "0");
			session.setAttribute("nom_divers_order", null);
			session.setAttribute("adresse_divers_order", null);
			session.setAttribute("adresse2_client_divers", null);
			session.setAttribute("cp_divers_order", null);
			session.setAttribute("ville_divers_order", null);
			session.setAttribute("code_pays_client_divers", null);
			
			session.setAttribute("login", Login);
			String connectionUrl = "jdbc:sqlserver://" + Constantes.SERVEUR + ";databaseName=" + Constantes.BDD + ";user="
					+ Login + ";password=" + Password;

			try (Connection con = DriverManager.getConnection(connectionUrl); Statement stmt = con.createStatement();) {
				request.setAttribute( "ids", "");
				request.setAttribute("Connect", 1);
				RequestDispatcher rd = request.getRequestDispatcher("/Order");
				rd.forward(request, response);

			} catch (Exception e) {
				request.setAttribute( "ids", "Identifiants incorrects");
				request.setAttribute("erreur_url", false);
				request.setAttribute("erreur_param", false);
				RequestDispatcher rd = request.getRequestDispatcher("/Home");
				rd.forward(request, response);
				e.printStackTrace();
				out.println(e);
			}
		}
	}

}
