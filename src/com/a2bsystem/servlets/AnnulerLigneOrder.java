
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


	@WebServlet("/AnnulerLigneOrder")
	public class AnnulerLigneOrder extends HttpServlet {
		
		public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
			
			
			HttpSession session = request.getSession();
			String prev_page = request.getParameter("prev_page");
			System.out.println(prev_page);
			String connectionUrl = "jdbc:sqlserver://" + Constantes.SERVEUR + ";databaseName=" + Constantes.BDD + ";user=" + "sa" + ";password=" + "2bsystem99";
			var foretagKod = session.getAttribute("foretagKod");
			String Login = (String) session.getAttribute("login");
			try (Connection con = DriverManager.getConnection(connectionUrl); Statement stmt2 = con.createStatement();) {
				String SQL2 = "EXEC q_2bp_java_web_order_annuler_ligne " + foretagKod + ",'" 
							   											 + Login + "',"
							   											 + request.getParameter("ordernr")+ ","
							   											 + request.getParameter("ordradnr") + ";";
					System.out.println(SQL2);
					ResultSet rs2 = stmt2.executeQuery(SQL2);
			}
		    catch (Exception e) {
		       e.printStackTrace();
		    }
			request.setAttribute("prev_page", "annuler");
			RequestDispatcher rd = request.getRequestDispatcher("/Order");
			rd.forward(request, response);
		}
		
		public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
			this.getServletContext().getRequestDispatcher( "/WEB-INF/selection.jsp" ).forward( request, response );
		}
	}

	
	