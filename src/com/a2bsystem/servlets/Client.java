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
import com.a2bsystem.models.Cli;



@WebServlet("/Client")
public class Client extends HttpServlet {
	
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		String connectionUrl = "jdbc:sqlserver://" + Constantes.SERVEUR + ";databaseName=" + Constantes.BDD + ";user=" + "sa" + ";password=" + "2bsystem99";
		HttpSession session = request.getSession();
		var foretagKod = session.getAttribute("foretagKod");
		String Login = (String) session.getAttribute("login");
		request.setAttribute("prev_page", "client");
        try (Connection con = DriverManager.getConnection(connectionUrl); Statement stmt = con.createStatement();) {
        	String SQL = "EXEC q_2bp_java_web_order_get_client " + foretagKod + ",'" + Login + "';";
        	ResultSet rs = stmt.executeQuery(SQL);
            List<Cli> clients = new ArrayList<Cli>();
        	if(rs.next()) {
        		Cli client = new Cli();
        		client.code = rs.getString("Code");
        		client.nom = rs.getString("Nom");
        		client.nomAppel = rs.getString("NomAppel");
        		client.divers = rs.getString("Divers");
        		clients.add(client);
    		
            	while(rs.next()) {
            		Cli client2 = new Cli();
            		client2.code = rs.getString("Code");
            		client2.nom = rs.getString("Nom");
            		client2.nomAppel = rs.getString("NomAppel");
            		client2.divers = rs.getString("Divers");
            		clients.add(client2);
            	}
                    
            	request.setAttribute( "clients", clients );
            		
                RequestDispatcher rd = request.getRequestDispatcher("/ClientView");
                rd.forward(request, response);
            	
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }         
    }
}
