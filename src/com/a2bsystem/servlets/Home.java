package com.a2bsystem.servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Home
 */
@WebServlet("/Home")
public class Home extends HttpServlet {
	
	public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.setAttribute("login", null);
		
		StringBuffer url = request.getRequestURL().append('?').append(request.getQueryString());
        String url_string = url.toString();
        
        if (!url_string.contains("?param=")){
			request.setAttribute("erreur_url", true);
        }else {
        	request.setAttribute("erreur_url", false);
			String[] url_splited = url_string.split("=");
	        String param_borne = url_splited[1]; // 004

			session.setAttribute("param_borne", param_borne);

			Properties prop = new Properties();
			File file = new File("C:/IIBSYSTEM/WEBConfig/" + param_borne + ".cfg");

	        /* Ici le fichier contenant les données de configuration est nommé 'db.myproperties' */
	        FileInputStream in = null;
			try {
				request.setAttribute("erreur_param", false);
				in = new FileInputStream(file);
				prop.load(in);
				in.close();
		        // Extraction des propriétés
				session.setAttribute("serveur",prop.getProperty("SERVEUR"));
				session.setAttribute("BDD",prop.getProperty("BDD"));
				session.setAttribute("foretagKod", prop.getProperty("FORETAGKOD"));
				session.setAttribute("Imprimante1", prop.getProperty("IMPRIMANTE1"));
				session.setAttribute("Imprimante2", prop.getProperty("IMPRIMANTE2"));               
               
			} catch (FileNotFoundException exc)
			{
				request.setAttribute("erreur_param", true);
			}
        }

        request.setAttribute( "ids", "");

		this.getServletContext().getRequestDispatcher( "/WEB-INF/connection.jsp" ).forward( request, response );
        
	}

	public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		
		/* Transmission à la page JSP en charge de l'affichage des données */
		if(!request.getAttribute("ids").equals("")) {
			request.setAttribute( "ids", "Identifiants incorrects");
		}
		this.getServletContext().getRequestDispatcher( "/WEB-INF/connection.jsp" ).forward( request, response );
            
        
	}

}
