package com.a2bsystem.servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.a2bsystem.models.Cli;
import com.a2bsystem.models.histoClient;

/**
 * Servlet implementation class Home
 */
@WebServlet("/ListeRecap")
public class ListeRecap extends HttpServlet {
	
	public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		HttpSession session = request.getSession();

		String connectionUrl = "jdbc:sqlserver://" + session.getAttribute("serveur") + ";databaseName=" + session.getAttribute("BDD") + ";user=" + "sa" + ";password=" + "2bsystem99";
		String Login = (String) session.getAttribute("login");
		request.setAttribute("prev_page", "client");
        try (Connection con = DriverManager.getConnection(connectionUrl); Statement stmt = con.createStatement();) {
        	String SQL = "EXEC q_2bp_java_web_order_taking_get_histo_client " + session.getAttribute("foretagKod") +",'" + Login + "';";
        	System.out.println(SQL);
        	ResultSet rs = stmt.executeQuery(SQL);
            List<histoClient> histoClients = new ArrayList<histoClient>();
        	if(rs.next()) {
        		histoClient histoClient = new histoClient();
        		histoClient.id = rs.getString("Impression");
        		histoClient.client = rs.getString("FtgNr");
        		histoClient.totalPrix = rs.getString("Total");
        		histoClient.date = rs.getString("DateValidation");

        		histoClients.add(histoClient);
    		
            	while(rs.next()) {
            		histoClient histoClient2 = new histoClient();
            		histoClient2.id = rs.getString("Impression");
            		histoClient2.client = rs.getString("FtgNr");
            		histoClient2.totalPrix = rs.getString("Total");
            		histoClient2.date = rs.getString("DateValidation");

            		histoClients.add(histoClient2);
            	}
                    
            	request.setAttribute( "histoClients", histoClients );
            	
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        } 
		this.getServletContext().getRequestDispatcher( "/WEB-INF/listeRecap.jsp" ).forward( request, response );
	}
}
