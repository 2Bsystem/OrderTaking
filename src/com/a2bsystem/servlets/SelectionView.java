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
import javax.servlet.http.HttpSession;

import com.a2bsystem.models.DetailCmde;

/**
 * Servlet implementation class SasieView
 */
@WebServlet("/SelectionView")
public class SelectionView extends HttpServlet {

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(request.getParameter("prev_page").equals("selection")) {
			if(session.getAttribute("exist_commande").equals("1")) {
				List<DetailCmde> detailcmdes =  (List<DetailCmde>) session.getAttribute("detailcmdes");
				int size = detailcmdes.size();
				session.setAttribute( "detailcmdes", (List<DetailCmde>) detailcmdes);
				session.setAttribute( "size", size);
			}
		}
		this.getServletContext().getRequestDispatcher( "/WEB-INF/selection.jsp" ).forward( request, response );
    }
}