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

@WebServlet("/Connect")
public class Connect extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		//String prev_page = request.getParameter("prev_page");
		 //session.setAttribute("articleClient", null );

				
//		if(session) {			
//			session.setAttribute("login", null);
//			request.setAttribute( "ids", "");
//			request.setAttribute("erreur_url", false);
//			request.setAttribute("erreur_param", false);
//			RequestDispatcher rd = request.getRequestDispatcher("/Home");
//			rd.forward(request, response);
//		}
//		else {
			// Get config
			String Login = request.getParameter("login");
			String Password = request.getParameter("password");						
			session.setAttribute("login", Login);
			String connectionUrl = "jdbc:sqlserver://" + session.getAttribute("serveur") + ";databaseName=" + session.getAttribute("BDD") + ";user="
					+ Login + ";password=" + Password;
			try (Connection con = DriverManager.getConnection(connectionUrl); Statement stmt = con.createStatement();) {
				request.setAttribute( "ids", "");
				request.setAttribute("Connect", 1);
				session.setAttribute("login", Login);

			
				RequestDispatcher rd = request.getRequestDispatcher("/ListeRecap");
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
	//}
}
