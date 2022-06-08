<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<sql:query var="vendas" dataSource="jdbc/mwgames">
    select idvenda, sum(quantidade) as qt_itens, data_venda, preco_venda from relatorio_venda group by idvenda order by idvenda
</sql:query>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/vendas.css" rel="stylesheet" />
        <link href="css/main.css" rel="stylesheet" />
        <title>Vendas</title>
        <%
            if (request.getParameter("p") != null) {
        %><script>alert('Venda cadastrada com sucesso!');</script><%
            }
        %>

        <style>
            #div1{
                margin: 0 auto;
                width: 80%;
                min-height: 65vh; /* 65% da altura da tela */
            }

            .content {
                display: flex;
                align-items: center;
                justify-content: center;
                min-height: 50vh; /* 65% da altura da tela */
                width: 100%;
                gap: 10px;
                flex-wrap: wrap;
            }

            .content h4 {
                color: #6b6b6b;
                animation: greetings 1.75s ease 0s 1 normal forwards; /* criando a animação de entrada */
            }

            .content a {
                text-decoration: none;
                color: var(--bs-body-color); /* pega a cor definida no tema do bootstrap */
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
                    <c:when test = "${vendas.getRowCount() == 0}">
                        <h4>Não há vendas cadastradas!</h4>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="venda" items="${vendas.rows}">
                            <a href="/P2/infoVenda?id=${venda.idvenda}" target="_blank">
                                <div class="card-venda">
                                    <div class="info">
                                        <div>
                                            <h1>Venda #${venda.idvenda}</h1>
                                            <h2>Total: R$ ${venda.preco_venda}</h2>
                                            <p>
                                                <span>Total de itens: ${venda.qt_itens}</span>
                                                <br />
                                                <span>
                                                    Realizada em: ${venda.data_venda}
                                                </span> 
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>  

        <script src="js/main.js"></script>
    </body>
</html>
