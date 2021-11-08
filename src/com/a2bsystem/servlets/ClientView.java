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

import com.a2bsystem.models.Cli;

/**
 * Servlet implementation class ClientView
 */
@WebServlet("/ClientView")
public class ClientView extends HttpServlet {

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		List<Cli> clients =  (List<Cli>) request.getAttribute("clients");
		int size = clients.size();
		request.setAttribute( "clients", (List<Cli>) clients);
		request.setAttribute("prev_page", request.getParameter("prev_page"));
		request.setAttribute( "size", size);
		this.getServletContext().getRequestDispatcher( "/WEB-INF/client.jsp" ).forward( request, response );
    }
}
