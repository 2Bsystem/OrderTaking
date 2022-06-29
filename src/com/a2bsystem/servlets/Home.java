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

import com.a2bsystem.models.Constantes;

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
	        File file = new File("C:/IIBSYSTEM/WEBConfig/Borne" + param_borne + ".cfg");
	        /* Ici le fichier contenant les données de configuration est nommé 'db.myproperties' */
	        FileInputStream in = null;
			try {
				request.setAttribute("erreur_param", false);
				in = new FileInputStream(file);
				prop.load(in);
				in.close();
		        // Extraction des propriétés
		        Constantes.SERVEUR = prop.getProperty("SERVEUR");
		        Constantes.BDD = prop.getProperty("BDD");
		        Constantes.PATH = prop.getProperty("PATH");
		        Constantes.SOCIETE = prop.getProperty("SOCIETE");
		        Constantes.COULHF = prop.getProperty("COULHF");
		        Constantes.COULEC = prop.getProperty("COULEC");
		        Constantes.COULTITRE = prop.getProperty("COULTITRE");
		        Constantes.COULBTN = prop.getProperty("COULBTN");
		        Constantes.COULBTN2 = prop.getProperty("COULBTN2");
		        Constantes.COULBTNTXT = prop.getProperty("COULBTNTXT");
		        Constantes.COULTABENT = prop.getProperty("COULTABENT");
		        Constantes.COULTABCEL = prop.getProperty("COULTABCEL");
		        Constantes.COULMENU = prop.getProperty("COULMENU");
		        Constantes.IMGNEWS = prop.getProperty("IMGNEWS");
		        Constantes.COULCADRENEWS = prop.getProperty("COULCADRENEWS");
		        Constantes.COULZTXT = prop.getProperty("COULZTXT");
		        Constantes.COULTABCEL2 = prop.getProperty("COULTABCEL2");
		        Constantes.COULSLCT = prop.getProperty("COULSLCT");
		        session.setAttribute("depot", prop.getProperty("DEPOT"));
		        session.setAttribute("foretagKod", prop.getProperty("FORETAGKOD"));
		        session.setAttribute("tracabilite", prop.getProperty("TRACABILITE"));
		        session.setAttribute("fin", prop.getProperty("FIN"));
		        session.setAttribute("nbEtiquette", prop.getProperty("NBETIQUETTE"));
		        session.setAttribute("editionEtiquette", prop.getProperty("EDITIONETIQUETTE"));
		        session.setAttribute("reception", prop.getProperty("RECEPTION"));
		        session.setAttribute("flux", prop.getProperty("FLUX"));
		        session.setAttribute("origine", prop.getProperty("ORIGINE"));
		        session.setAttribute("printer", prop.getProperty("PRINTER"));
		        session.setAttribute("vendeur", prop.getProperty("VENDEUR"));
		        session.setAttribute("grosClavierClient", prop.getProperty("GROS_CLAVIER_CLIENT"));
		        session.setAttribute("grosClavierArticle", prop.getProperty("GROS_CLAVIER_ARTICLE"));
			} catch (FileNotFoundException exc)
			{
				request.setAttribute("erreur_param", true);
			}
        }
		request.setAttribute( "ids", "");
		request.setAttribute( "soc", Constantes.SOCIETE);
		/* Transmission Ã  la page JSP en charge de l'affichage des donnÃ©es */
		this.getServletContext().getRequestDispatcher( "/WEB-INF/connection.jsp" ).forward( request, response );
           
        
	}

	public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		
		/* Transmission Ã  la page JSP en charge de l'affichage des donnÃ©es */
		if(!request.getAttribute("ids").equals("")) {
			request.setAttribute( "ids", "Identifiants incorrects");
		}
		request.setAttribute( "soc", Constantes.SOCIETE);
		this.getServletContext().getRequestDispatcher( "/WEB-INF/connection.jsp" ).forward( request, response );
            
        
	}

}