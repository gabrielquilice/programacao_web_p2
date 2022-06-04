<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<sql:query var="rs" dataSource="jdbc/sakila">
select f.title,a.first_name from film f 
	join film_actor ac on (f.film_id=ac.film_id)
    join actor a on (ac.actor_id=a.actor_id)
    WHERE a.actor_id=<%=request.getParameter("idPessoa")%>
    
</sql:query>
    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar</title>
    </head>
    <body>
        
       <div id="div1">
           <h1>Lista de Filmes do Ator: <font color="red">${rs.rows[0].first_name}</font></h1>
        <c:forEach var="row" items="${rs.rows}">
            ${row.title} --  ${row.first_name}<br>
            
        </c:forEach>
       </div>
    </body>
</html>