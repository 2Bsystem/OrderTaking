package com.a2bsystem.servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.a2bsystem.models.Cmde;

/**
 * Servlet implementation class BornesCommandeView
 */
@WebServlet("/BornesCommandeView")
public class BornesCommandeView extends HttpServlet {

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		if(request.getParameter("prev_page").equals("commande")) {
			if(request.getAttribute("exist").equals("1")) {
				List<Cmde> commandes =  (List<Cmde>) request.getAttribute("commandes");
				int size = commandes.size();
				request.setAttribute( "commandes", (List<Cmde>) commandes);
				request.setAttribute( "size", size);
			}
		}
		this.getServletContext().getRequestDispatcher( "/WEB-INF/commande.jsp" ).forward( request, response );
    }
}

