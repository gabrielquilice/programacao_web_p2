<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<sql:query var="rs" dataSource="jdbc/sakila">
select * from actor
</sql:query>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar</title>
    </head>
    <body>
       <div id="div1">
        <h1>Listas de Filmes por Ator</h1>
        <form action="selectFilmsByActor" method="post">
            <table>
                <tr>
                    <th>Escolha o Ator</th>
                     <th>
                         <select name="idPessoa">
                             <option name="">--SELECIONE--</option>
                             <c:forEach var="row" items="${rs.rows}">
                                <option value=${row.actor_id}>${row.first_name}</option>
                             </c:forEach> 
                        </select>


                     </th>

                </tr>
                <tr>
                    <td colspan="2" style="text-align: center"><input type="submit" value="Procurar"></td>
                </tr>
            </table>
        </form>
       </div>  
    </body>
</html>
