<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<sql:query var="rs" dataSource="jdbc/mwgames">
    select * from produto where idproduto = ?
    <sql:param value="${param.id}" />
</sql:query>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/produtos.css" rel="stylesheet" />
        <link href="css/main.css" rel="stylesheet" />
        <title>Editar produto</title>
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
            <h1>Alterar produto</h1>
            <br />
            <form action="saveProdutoForm" method="post">
                <table>
                    <tbody>
                        <tr>
                            <td>Nome:</td>
                            <td><input type="text" name="nome" maxlength="200" value="${rs.rows[0].nome}" required /></td>
                        </tr>
                        <tr>
                            <td>Preço:</td>
                            <td><input type="number" name="preco" step=".01" value="${rs.rows[0].preco}" required /></td>
                        </tr>
                        <tr>
                            <td>Código de barras:</td>
                            <td><input type="text" name="codigo_barras" value="${rs.rows[0].codigo_barras}" maxlength="45" /></td>
                        </tr>
                        <tr>
                            <td>Quantidade em estoque:</td>
                            <td><input type="number" name="qt_estoque" value="${rs.rows[0].qt_estoque}" required /></td>
                        </tr>
                        <tr>
                            <td>Imagem do produto (url):</td>
                            <td><input type="url" name="url_imagem" value="${rs.rows[0].url_imagem}" required /></td>
                        </tr>
                        <tr>
                            <td>Produto ativo:</td>
                            <td>
                                <select name="fg_ativo">
                                    <!<!-- Realiza a verificação se o produto está ativo ou não -->
                                    <c:choose>
                                        <c:when test = "${rs.rows[0].fg_ativo == 'S'}">
                                            <option value="S" selected>Sim</option>
                                            <option value="N">Não</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="S">Sim</option>
                                            <option value="N" selected="">Não</option>
                                        </c:otherwise>
                                    </c:choose>
                                </select>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <br />
                <input type="hidden" value="false" name="novo" />
                <input type="hidden" value="${rs.rows[0].idproduto}" name="id_produto" />
                <input class="custom-button custom-button-blue" type="submit" value="Salvar" name="btn" />

            </form>
        </div>
    </body>
</html>
