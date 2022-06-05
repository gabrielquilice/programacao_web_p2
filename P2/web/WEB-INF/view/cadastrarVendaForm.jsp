<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<sql:query var="funcionarios" dataSource="jdbc/mwgames">
    select idfuncionario, nome from funcionario where fg_ativo = 'S'
</sql:query>

<sql:query var="produtos" dataSource="jdbc/mwgames">
    select idproduto, nome, qt_estoque, preco from produto where qt_estoque > 0 and fg_ativo = 'S'
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
                text-align: center;
            }

            select, input[type="text"], input[type="url"], input[type="number"] {
                width: 20vw;
            }

            td {
                padding: 5px;
            }
        </style>
    </head>
    <body>
        <div id="div1">
            <h1>Cadastrar venda</h1>
            <br />
            <form method="post">
                <table>
                    <tbody>
                        <tr>
                            <td>Funcionário que realizou a venda:</td>
                            <td>
                                <select name="funcionario">
                                    <c:forEach var="funcionario" items="${funcionarios.rows}">
                                        <option value="${funcionario.idfuncionario}">${funcionario.nome}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Preço:</td>
                            <td><input type="number" name="preco" step=".01" value="${produtos.rows[0].preco}" required /></td>
                        </tr>
                        <tr>
                            <td>Quantidade em estoque:</td>
                            <td><input type="number" name="qt_estoque" value="${produtos.rows[0].qt_estoque}" required /></td>
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
                <br />
                <input class="custom-button custom-button-blue" type="submit" value="Cadastrar" name="btn" />
            </form>
        </div>
    </body>
</html>
