<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<sql:query var="rs" dataSource="jdbc/mwgames">
    select count(*) as total_vendas from venda 
</sql:query>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/produtos.css" rel="stylesheet" />
        <link href="css/main.css" rel="stylesheet" />
        <title>Vendas</title>

        <style>
            #div1{
                margin: 0 auto;
                width: 80%;
                min-height: 65vh; /* 65% da altura da tela */
            }

            .content {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                min-height: 50vh; /* 65% da altura da tela */
                width: 100%;
            }

            .content h4 {
                color: #6b6b6b;
                animation: greetings 1.75s ease 0s 1 normal forwards; /* criando a animação de entrada */
            }
        </style>
    </head>
    <body>
        <div id="div1">
            <div class="titulo-container">
                <h1>Vendas</h1>
                <a href="/P2/cadastrarVendaForm">
                    <button type="button" class="custom-button custom-button-blue">Cadastrar nova venda</button>
                </a>
            </div>

            <br />

            <div class="content">
                <c:choose>
                    <c:when test = "${rs.rows[0].total_vendas == 0}">
                        <h4>Não há vendas cadastradas!</h4>
                    </c:when>
                    <c:otherwise>
                        <h4>Há vendas ${rs.rows[0].total_vendas} cadastradas!</h4>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>  

        <script src="js/main.js"></script>
    </body>
</html>
