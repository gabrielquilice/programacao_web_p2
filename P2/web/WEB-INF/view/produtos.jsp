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
        <link href="css/modals.css" rel="stylesheet" />
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
                            <button type="button" onclick="showModal('modalSheet-${row.idproduto}')">Excluir</button>
                        </div>
                    </div>
                </div>
                <div class="modal modal-sheet modal-background" tabindex="-1" role="dialog" id='modalSheet-${row.idproduto}'>
                    <div class="modal-dialog" role="document">
                        <div class="modal-content rounded-4 shadow">
                        <div class="modal-header border-bottom-0">
                            <h5 class="modal-title">Excluir</h5>
                            <button 
                              type="button" 
                              class="btn-close" 
                              data-bs-dismiss="modal" 
                              aria-label="Close"
                              onclick="closeModal('modalSheet-${row.idproduto}')">
                            </button>
                        </div>
                        <div class="modal-body py-0">
                            <p>Deseja realmente excluir o produto ${row.nome}?</p>
                        </div>
                        <div class="modal-footer flex-column border-top-0">
                            <button type="button" class="btn btn-lg btn-primary w-100 mx-0 mb-2">Sim</button>
                            <button 
                                type="button" 
                                class="btn btn-lg btn-light w-100 mx-0" 
                                data-bs-dismiss="modal"
                                onclick="closeModal('modalSheet-${row.idproduto}')">
                                Não
                            </button>
                        </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>  

        <script src="js/main.js"></script>
    </body>
</html>
