<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<sql:query var="funcionarios" dataSource="jdbc/mwgames">
    select idfuncionario, nome from funcionario where fg_ativo = 'S'
</sql:query>

<sql:query var="produtos" dataSource="jdbc/mwgames">
    select idproduto, nome, qt_estoque, preco, url_imagem from produto where qt_estoque > 0 and fg_ativo = 'S'
</sql:query>

<sql:query var="pagamentos" dataSource="jdbc/mwgames">
    select * from tipo_pagamento
</sql:query>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/produtos.css" rel="stylesheet" />
        <link href="css/main.css" rel="stylesheet" />
        <title>Cadastrar venda</title>
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
            <h1>Cadastrar venda</h1>
            <br />
            <form action="saveVenda" method="post">
                <div style="width:100%; display: flex; justify-content: center;">
                    <table>
                        <tbody>
                            <tr>
                                <td>Vendedor:</td>
                                <td>
                                    <select name="funcionario">
                                        <c:forEach var="funcionario" items="${funcionarios.rows}">
                                            <option value="${funcionario.idfuncionario}">${funcionario.nome}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Forma de pagamento:</td>
                                <td>
                                    <select name="tipo_pagamento">
                                        <c:forEach var="pagamento" items="${pagamentos.rows}">
                                            <option value="${pagamento.idtipo}">${pagamento.descricao}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <br />
                <p>Adicionar produtos:</p>
                <br />
                <div class="venda-produto-wrapper">
                    <c:forEach var="produto" items="${produtos.rows}">
                        <div class="small-card">
                            <div style="display: flex; flex-direction: column; width: 100%; justify-content: center; gap: 5px;">
                                <img src="${produto.url_imagem}" alt="imagem do produto"/>
                                <input class="align-top" type="checkbox" name="id_produto" value="${produto.idproduto}" /> 
                                <p><b>${produto.nome}</b></p>
                                <p><b>R$ ${produto.preco}</b></p>
                            </div>
                            <div style="display: flex; width: 100%; justify-content: center; gap: 5px;">
                                <span>Qtde: </span>
                                <input 
                                    type="number" 
                                    name="prods[${produto.idproduto}][qtd]" 
                                    min="0" 
                                    max="${produto.qt_estoque}" 
                                    value="0" 
                                />
                                <input type="hidden" name="prods[${produto.idproduto}][preco]" value="${produto.preco}" />
                            </div>
                        </div>
                        <br />
                    </c:forEach>
                </div>
                <br />
                <input class="custom-button custom-button-blue" type="submit" value="Cadastrar" name="btn" />
            </form>
        </div>
    </body>
</html>
