<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<sql:query var="rs" dataSource="jdbc/mwgames">
    select * from produto
</sql:query>
<style>
    #div1{
        margin: 0 auto;
        width: 80%;
    }
</style>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/produtos.css" rel="stylesheet" />
        <title>Produtos</title>
    </head>
    <body>
        <div id="div1">
            <h1>Lista de produtos</h1>

            <br />

            <c:forEach var="row" items="${rs.rows}">
                <div class="card-produto">
                    <img src="${row.url_imagem}" alt="imagem-produto" />
                    <div class="info">
                        <div>
                            <h1>${row.nome}</h1>
                            <h2>R$ ${row.preco}</h2>
                        </div>
                        <div class="botoes-container">
                            <button type="button">Editar</button>
                            <button type="button">Excluir</button>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>  
    </body>
</html>
