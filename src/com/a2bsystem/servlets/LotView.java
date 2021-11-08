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

import com.a2bsystem.models.LotsListe;

/**
 * Servlet implementation class ClientView
 */
@WebServlet("/LotView")
public class LotView extends HttpServlet {

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		List<LotsListe> lots =  (List<LotsListe>) request.getAttribute("lots");
		int size = lots.size();
		request.setAttribute( "lots", (List<LotsListe>) lots);
		request.setAttribute("prev_page", request.getParameter("prev_page"));
		request.setAttribute( "size", size);
		this.getServletContext().getRequestDispatcher( "/WEB-INF/lot.jsp" ).forward( request, response );
    }
}