<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<sql:query var="rs" dataSource="jdbc/mwgames">
    select * from funcionario where idfuncionario = ?
    <sql:param value="${param.id}" />
</sql:query>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/produtos.css" rel="stylesheet" />
        <link href="css/main.css" rel="stylesheet" />
        <title>Editar funcionário</title>
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

            select, input[type="text"], input[type="password"], input[type="date"] {
                width: 20vw;
            }

            td {
                padding: 5px;
            }
        </style>
    </head>
    <body>
        <div id="div1">
            <h1>Alterar funcionário</h1>
            <br />
            <form action="saveFuncionarioForm" method="post">
                <table>
                    <tbody>
                        <tr>
                            <td>Nome:</td>
                            <td><input type="text" name="nome" maxlength="200" value="${rs.rows[0].nome}" required /></td>
                        </tr>
                        <tr>
                            <td>CPF:</td>
                            <td><input type="text" name="cpf" maxlenght="14" pattern="\d{3}\.\d{3}\.\d{3}-\d{2}" value="${rs.rows[0].cpf}" required /></td>
                        </tr>
                        <tr>
                            <td>RG:</td>
                            <td><input type="text" name="rg" maxlenght="12" pattern="\d{2}\.\d{3}\.\d{3}-\d{1}" value="${rs.rows[0].rg}" required /></td>
                        </tr>
                        <tr>
                            <td>Sexo:</td>
                            <c:choose>
                                <c:when test = "${rs.rows[0].sexo == 'M'}">
                                    <td>
                                        <input type="radio" name="sexo" value="M" required checked />
                                        <label for="Choice1">Masculino</label>
                                        <input type="radio" name="sexo" value="F" required />
                                        <label for="Choice2">Feminino</label>
                                    </td>
                                </c:when>
                                <c:otherwise>
                                    <td>
                                        <input type="radio" name="sexo" value="M" required />
                                        <label for="Choice1">Masculino</label>
                                        <input type="radio" name="sexo" value="F" required checked/>
                                        <label for="Choice2">Feminino</label>
                                    </td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                        <tr>
                            <td>Data de nascimento:</td>
                            <td><input type="date" name="data_nascimento" value="${rs.rows[0].data_nascimento}" required /></td>
                        </tr>
                        <tr>
                            <td>Usuário:</td>
                            <td><input type="text" name="sys_user" maxlength="45" value="${rs.rows[0].sys_user}" required /></td>
                        </tr>
                        <tr>
                            <td>Senha:</td>
                            <td><input type="password" name="sys_password" maxlength="45" value="${rs.rows[0].sys_password}" required /></td>
                        </tr>
                        <tr>
                            <td>Funcionário ativo:</td>
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
                <input type="hidden" value="${rs.rows[0].idfuncionario}" name="idfuncionario" />
                <input class="custom-button custom-button-blue" type="submit" value="Salvar" name="btn" />

            </form>
        </div>
    </body>
</html>
