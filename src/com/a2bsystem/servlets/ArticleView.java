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

import com.a2bsystem.models.Art;

/**
 * Servlet implementation class ArticleView
 */
@WebServlet("/ArticleView")
public class ArticleView extends HttpServlet {

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		List<Art> articles =  (List<Art>) request.getAttribute("articles");
		int size = articles.size();
		request.setAttribute( "articles", (List<Art>) articles);
		request.setAttribute("prev_page", request.getParameter("prev_page"));
		request.setAttribute( "size", size);
		this.getServletContext().getRequestDispatcher( "/WEB-INF/article.jsp" ).forward( request, response );
    }
}
