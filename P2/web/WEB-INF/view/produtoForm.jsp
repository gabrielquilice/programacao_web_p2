<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de produto</title>
        <%
            if (request.getParameter("p") != null) {
        %><script>alert('Cadastrado com Sucesso!');</script><%
            }
        %>

        <style>
            #div1{
                margin: 0 auto;
                width: 80%;
                min-height: 65vh; /* 65% da altura da tela */
            }
        </style>
    </head>
    <body>
        <div id="div1">
            <h1>Cadastro de produto</h1>
            <form action="saveProdutoForm" method="POST">
                <table border="1">
                    <thead>
                        <tr>
                            <th>Atributo</th>
                            <th>Valor</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Nome:</td>
                            <td><input type="text" name="nome"/></td>
                        </tr>
                        <tr>
                            <td>Preço:</td>
                            <td><input type="number" name="preco"/></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center"><input type="submit" value="Cadastrar" name="btn" /></td>
                        </tr>
                    </tbody>
                </table>

            </form>
        </div>
    </body>
</html>
