<jsp:include page="header.jsp"/>
	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
	<div id="top">
	<h1>saisie Article</h1>
		<h1 class="btn btn-outline-info btn-lg"><%= session.getAttribute("valCategory") %> </h1>
		<h1 class="btn btn-outline-info btn-lg"><%= request.getParameter("valArticle") %> </h1>	
		
	</div>

<jsp:include page="footer.jsp"/>
