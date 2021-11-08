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
import com.a2bsystem.models.LotsListe;



@WebServlet("/Lot")
public class Lot extends HttpServlet {
	
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		String connectionUrl = "jdbc:sqlserver://" + Constantes.SERVEUR + ";databaseName=" + Constantes.BDD + ";user=" + "sa" + ";password=" + "2bsystem99";
		HttpSession session = request.getSession();
		var foretagKod = session.getAttribute("foretagKod");
		String Login = (String) session.getAttribute("login");
		request.setAttribute("prev_page", "lot");
        try (Connection con = DriverManager.getConnection(connectionUrl); Statement stmt = con.createStatement();) {
        	String SQL = "EXEC q_2bp_java_web_prepa_get_lot " + foretagKod + ",'" + session.getAttribute("code_art") + "','"+ Login + "';";
        	System.out.println(SQL);
        	ResultSet rs = stmt.executeQuery(SQL);
            List<LotsListe> lots = new ArrayList<LotsListe>();
        	if(rs.next()) {
        		LotsListe lot = new LotsListe();
        		lot.lot = rs.getString("Lot");
        		lot.prix = rs.getString("Prix");
        		lot.fournisseur = rs.getString("Fournisseur");
        		lot.stock = rs.getString("Stock");
        		lot.code_art = rs.getString("Artnr");
        		lot.lib_art = rs.getString("Lib");
        		lot.dlc = rs.getString("DLC");
        		lot.col = rs.getString("Col");
        		lots.add(lot);
    		
            	while(rs.next()) {
            		LotsListe lot2 = new LotsListe();
            		lot2.lot = rs.getString("Lot");
            		lot2.prix = rs.getString("Prix");
            		lot2.fournisseur = rs.getString("Fournisseur");
            		lot2.stock = rs.getString("Stock");
            		lot2.code_art = rs.getString("Artnr");
            		lot2.lib_art = rs.getString("Lib");
            		lot2.dlc = rs.getString("DLC");
            		lot2.col = rs.getString("Col");
            		lots.add(lot2);
            	}
                    
            	request.setAttribute( "lots", lots );
                RequestDispatcher rd = request.getRequestDispatcher("/LotView");
                rd.forward(request, response);
            	
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }         
    }
}
