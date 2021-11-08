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



@WebServlet("/Saisie")
public class Saisie extends HttpServlet {
	
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		String connectionUrl = "jdbc:sqlserver://" + Constantes.SERVEUR + ";databaseName=" + Constantes.BDD + ";user=" + "sa" + ";password=" + "2bsystem99";
		HttpSession session = request.getSession();
		var foretagKod = session.getAttribute("foretagKod");
		String Login = (String) session.getAttribute("login");
		
		if(request.getParameter("prev_page").equals("selection")) {
			session.setAttribute("code_art", request.getParameter("code_art"));
			session.setAttribute("lib_art", request.getParameter("lib_art"));
			session.setAttribute("ligne", request.getParameter("ligne"));
			session.setAttribute("gamme", request.getParameter("gamme"));
			session.setAttribute("ord_rest_nr", request.getParameter("ord_rest_nr"));
			session.setAttribute("ord_rad_nr_str_pos", request.getParameter("ord_rad_nr_str_pos"));
			session.setAttribute("dummy_unique_id", request.getParameter("dummy_unique_id"));
			session.setAttribute("qte_cde", request.getParameter("qte_cde"));
			session.setAttribute("qte_cde", request.getParameter("qte_cde"));
			session.setAttribute("unite", request.getParameter("unite"));
			
			session.setAttribute("unite_cde", request.getParameter("unite_cde"));
			session.setAttribute("unite_fact", request.getParameter("unite_fact"));
			session.setAttribute("unite_stock", request.getParameter("unite_stock"));
			session.setAttribute("colis_cde", request.getParameter("colis_cde"));
			session.setAttribute("pieces_cde", request.getParameter("pieces_cde"));
			session.setAttribute("poids_cde", request.getParameter("poids_cde"));
			session.setAttribute("colis_prep", request.getParameter("colis_prep"));
			session.setAttribute("poids_prep", request.getParameter("poids_prep"));
			session.setAttribute("pieces_prep", request.getParameter("pieces_prep"));
		}
		
		if(request.getParameter("prev_page").equals("ajouter")) {
			session.setAttribute( "mode", "direct");
		}
		
		if(request.getParameter("prev_page").equals("lot")) {
			session.setAttribute("lot_lot", request.getParameter("lot_lot_select"));
		}
		
		this.getServletContext().getRequestDispatcher( "/WEB-INF/saisie.jsp" ).forward( request, response );
		// 
    }
}
