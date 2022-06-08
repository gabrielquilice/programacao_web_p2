<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<sql:query var="rs" dataSource="jdbc/mwgames">
    select * from funcionario
</sql:query>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/produtos.css" rel="stylesheet" />
        <link href="css/modals.css" rel="stylesheet" />
        <link href="css/main.css" rel="stylesheet" />
        <title>Funcionários</title>
        <%
            if (request.getParameter("p") != null) {
        %><script>alert('Excluído com sucesso!');</script><%
            }
        %>
        <style>
            #div1{
                margin: 0 auto;
                width: 80%;
                min-height: 65vh; /* 65% da altura da tela */
            }

            h2{
                font-weight: 600 !important;
            }

            .card-funcionario{
                width: 100%;

                border: 1px solid #cecece;
                border-radius: 3px;

                display: flex;
                align-items: flex-start;

                margin-bottom: 5px;
                padding-left: 15px;
            }
        </style>
    </head>
    <body>
        <div id="div1">
            <div class="titulo-container">
                <h1>Lista de funcionários</h1>
                <a href="/P2/funcionarioForm">
                    <button type="button" class="custom-button custom-button-blue">Cadastrar funcionário</button>
                </a>
            </div>

            <br />

            <c:forEach var="row" items="${rs.rows}">
                <div class="card-funcionario">
                    <div class="info">
                        <div>
                            <h1>${row.nome}</h1>
                            <h2>CPF ${row.cpf}</h2>
                            <h2>RG ${row.rg}</h2>
                            <p>
                                <span><h2>Sexo:
                                        <!<!-- Realiza a verificação se o produto está ativo ou não -->
                                        <c:choose>
                                            <c:when test = "${row.sexo == 'M'}"> M</c:when>
                                            <c:otherwise> F</c:otherwise>
                                        </c:choose>
                                    </h2></span>
                            </p>
                            <h2>Data de Nascimento: 
                                <fmt:formatDate value="${row.data_nascimento}" type="both"
                                                pattern="dd/MM/yyyy" dateStyle="full"/>
                            </h2>
                            <h2>Usuário: ${row.sys_user}</h2>
                            <p>
                                <span><h2>Pessoa ativa:
                                        <!<!-- Realiza a verificação se o produto está ativo ou não -->
                                        <c:choose>
                                            <c:when test = "${row.fg_ativo == 'S'}"> Sim </c:when>
                                            <c:otherwise> Não </c:otherwise>
                                        </c:choose>
                                    </h2></span>
                            </p>
                        </div>
                        <div class="botoes-container">
                            <a style="text-decoration: none" href="/P2/editFuncionarioForm?id=${row.idfuncionario}">
                                <button type="button" class="custom-button">Editar</button>
                            </a>
                            <button type="button" class="custom-button" onclick="showModal('modalSheet-${row.idfuncionario}')">Excluir</button>
                        </div>
                    </div>
                </div>
                <div class="modal modal-sheet modal-background" tabindex="-1" role="dialog" id='modalSheet-${row.idfuncionario}'>
                    <div class="modal-dialog" role="document">
                        <div class="modal-content rounded-4 shadow">
                            <div class="modal-header border-bottom-0">
                                <h5 class="modal-title">Excluir</h5>
                                <button 
                                    type="button" 
                                    class="btn-close" 
                                    data-bs-dismiss="modal" 
                                    aria-label="Close"
                                    onclick="closeModal('modalSheet-${row.idfuncionario}')">
                                </button>
                            </div>
                            <div class="modal-body py-0">
                                <p>Deseja realmente excluir o funcionário ${row.nome}?</p>
                            </div>
                            <div class="modal-footer  border-top-0">
                                <button 
                                    type="button" 
                                    class="btn btn-lg btn-light mx-0" 
                                    data-bs-dismiss="modal"
                                    onclick="closeModal('modalSheet-${row.idfuncionario}')">
                                    Não
                                </button>
                                <form action="excluirFuncionario" method="post">
                                    <input type="hidden" value="${row.idfuncionario}" name="idfuncionario" />
                                    <button type="submit" class="btn btn-lg btn-primary mx-0">Sim</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>  

        <script src="js/main.js"></script>
    </body>
</html>
