<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<sql:query var="vendaInfo" dataSource="jdbc/mwgames">
    select rv.idvenda, p.idproduto, rv.produto, rv.quantidade, p.url_imagem,
    rv.preco_item, rv.data_venda, rv.tipo_pagamento, rv.vendido_por,
    (select sum(rv2.quantidade) from relatorio_venda rv2 where rv2.idvenda = rv.idvenda) as total_itens,
    v.preco_venda 
    from relatorio_venda rv 
    join venda v on (rv.idvenda = v.idvenda)
    join produto p on (p.nome = rv.produto)
    where rv.idvenda = ?
    <sql:param value="${param.id}" />
</sql:query>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/vendas.css" rel="stylesheet" />
        <link href="css/produtos.css" rel="stylesheet" />
        <link href="css/main.css" rel="stylesheet" />
        <title>Venda #${param.id}</title>
        <style>
            #div1 {
                margin: 0 auto;
                width: 80%;
                min-height: 65vh; /* 65% da altura da tela */
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                text-align: center;
            }

            select, input[type="text"], input[type="url"] {
                width: 20vw;
            }

            input[type="number"] {
                width: 50%;
            }

            td {
                padding: 5px;
                text-align: start;
            }
        </style>
    </head>
    <body>
        <div id="div1">
            <h1>Venda #${param.id}</h1>
            <br />
            <div style="width:100%; display: flex; justify-content: center;">
                <table>
                    <tbody>
                        <tr>
                            <td class="venda-label">Vendido por:</td>
                            <td>${vendaInfo.rows[0].vendido_por}</td>
                        </tr>
                        <tr>
                            <td class="venda-label">Data da venda: </td>
                            <td>${vendaInfo.rows[0].data_venda}</td>
                        </tr>
                        <tr>
                            <td class="venda-label">Total de itens registrados:</td>
                            <td>${vendaInfo.rows[0].total_itens}</td>
                        </tr>
                        <tr>
                            <td class="venda-label">Valor total da venda:</td>
                            <td>R$ ${vendaInfo.rows[0].preco_venda}</td>
                        </tr>
                        <tr>
                            <td class="venda-label">Forma de pagamento:</td>
                            <td>${vendaInfo.rows[0].tipo_pagamento}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <br />
            <p class="venda-label">Itens da venda:</p>
            <div class="venda-produto-wrapper">
                <c:forEach var="vendaItem" items="${vendaInfo.rows}">
                    <div class="small-card">
                        <div style="display: flex; flex-direction: column; width: 100%; justify-content: center; gap: 5px;">
                            <img src="${vendaItem.url_imagem}" alt="imagem do produto"/>
                            <p><b>${vendaItem.produto}</b></p>
                            <p><span class="venda-label">Subtotal:</span> R$ ${vendaItem.preco_item}</p>
                        </div>
                        <div style="display: flex; width: 100%; justify-content: center; gap: 5px;">
                            <span class="venda-label">Qtde:</span> <span>${vendaItem.quantidade}</span>
                        </div>
                    </div>
                    <br />
                </c:forEach>
            </div>
            <br />
        </div>
    </body>
</html>
