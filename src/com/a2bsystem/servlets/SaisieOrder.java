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
import com.a2bsystem.models.ChampsArt;
import com.a2bsystem.models.Constantes;


@WebServlet("/SaisieOrder")
public class SaisieOrder extends HttpServlet {
	
	public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		String prev_page = request.getParameter("prev_page");
		System.out.println(prev_page);
		String connectionUrl = "jdbc:sqlserver://" + Constantes.SERVEUR + ";databaseName=" + Constantes.BDD + ";user=" + "sa" + ";password=" + "2bsystem99";
		var foretagKod = session.getAttribute("foretagKod");
		String Login = (String) session.getAttribute("login");

		
		// set article depuis la page article
		String article_select = request.getParameter("article_select");
		if(request.getParameter("prev_page").equals("article")) {
			if(article_select != "") {
				session.setAttribute( "article_order", request.getParameter("article_select"));
				session.setAttribute( "code_article_order", request.getParameter("code_article_select"));
				
				try (Connection con = DriverManager.getConnection(connectionUrl); Statement stmt = con.createStatement();) {
		        	
		        	String SQL = "";
		        		SQL = "EXEC q_2bp_java_ventes_get_champs_article " 
		        	            + foretagKod + ",'"
		        	            + Login + "','"
		        	            + session.getAttribute("code_article_order") + "',"
		        	            + "NULL,'"
		        	            + "1"
		        	            +"','"
		        	            + session.getAttribute("code_client_order") +"';";

		        	System.out.println(SQL);
		            ResultSet rs = stmt.executeQuery(SQL);
					List<ChampsArt> champs = new ArrayList<ChampsArt>();
					if(rs.next()) {
						ChampsArt champ = new ChampsArt();
			        	champ.pieceU = rs.getString("PieceU");
			        	champ.pdsBrutU = rs.getString("pdsBrutU");
			        	champ.tareU = rs.getString("tareU");
			        	champ.pdsNetU = rs.getString("pdsNetU");
			        	champ.uniteFact = rs.getString("UniteFact");
			        	champ.modeSaisie = rs.getString("modeSaisie");
			        	champ.prix = rs.getString("prix");
			        	
			            champs.add(champ);
			            request.setAttribute( "champs", champs );
			        }
		        }
		        catch (Exception e) {
		            e.printStackTrace();
		        }
				
				this.getServletContext().getRequestDispatcher( "/WEB-INF/saisie_order.jsp" ).forward( request, response );
			}
		}
		
	}
	
	public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher( "/WEB-INF/selection.jsp" ).forward( request, response );
	}
}
