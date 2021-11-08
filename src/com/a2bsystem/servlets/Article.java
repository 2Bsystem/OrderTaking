package com.a2bsystem.servlets;

import java.io.IOException;
import java.math.BigDecimal;
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

import com.a2bsystem.models.Constantes;
import com.a2bsystem.models.Art;



@WebServlet("/Article")
public class Article extends HttpServlet {
	
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		String connectionUrl = "jdbc:sqlserver://" + Constantes.SERVEUR + ";databaseName=" + Constantes.BDD + ";user=" + "sa" + ";password=" + "2bsystem99";
		HttpSession session = request.getSession();
		var foretagKod = session.getAttribute("foretagKod");
		String Login = (String) session.getAttribute("login");
		String prev_page = request.getParameter("prev_page");
		
		//enregistrement en session des données client divers dans Order
		if(prev_page.equals("order")) {
			if(session.getAttribute("client_divers_order").equals("1")) {
				 session.setAttribute("nom_client_divers", request.getParameter("nom_client_divers"));
				 session.setAttribute("adresse_client_divers", request.getParameter("adresse_client_divers"));
				 session.setAttribute("adresse2_client_divers", request.getParameter("adresse2_client_divers"));
				 session.setAttribute("cp_client_divers", request.getParameter("cp_client_divers"));
				 session.setAttribute("ville_client_divers", request.getParameter("ville_client_divers"));
				 session.setAttribute("code_pays_client_divers", request.getParameter("code_pays_client_divers"));
			}
		}
		
        try (Connection con = DriverManager.getConnection(connectionUrl); Statement stmt = con.createStatement();) {
        	String SQL = "EXEC q_2bp_java_web_prepa_get_article " + foretagKod + ",'" + Login + "';";
        	ResultSet rs = stmt.executeQuery(SQL);
            List<Art> articles = new ArrayList<Art>();
        	if(rs.next()) {
        		Art article = new Art();
        		article.code = rs.getString("Code");
        		article.libelle = rs.getString("Libelle");
        		article.unite_fact = rs.getString("uniteFact");
            	articles.add(article);
    		
            	while(rs.next()) {
            		Art article2 = new Art();
            		article2.code = rs.getString("Code");
            		article2.libelle = rs.getString("Libelle");
            		article2.unite_fact = rs.getString("uniteFact");
                	articles.add(article2);
            	}
                    
            	request.setAttribute( "articles", articles );
            		
                RequestDispatcher rd = request.getRequestDispatcher("/ArticleView");
                rd.forward(request, response);
            	
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }         
    }
}
