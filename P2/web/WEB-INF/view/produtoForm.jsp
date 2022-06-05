<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/produtos.css" rel="stylesheet" />
        <link href="css/main.css" rel="stylesheet" />
        <title>Cadastro de produto</title>
        <%
            if (request.getParameter("p") != null) {
        %><script>alert('Cadastrado com sucesso!');</script><%
            }
        %>

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

            input[type="text"], input[type="url"], input[type="number"] {
                width: 20vw;
            }

            td {
                padding: 5px;
            }
        </style>
    </head>
    <body>
        <div id="div1">
            <h1>Cadastro de produto</h1>
            <br />
            <form action="saveProdutoForm" method="post">
                <table>
                    <tbody>
                        <tr>
                            <td>Nome:</td>
                            <td><input type="text" name="nome" maxlength="200" required /></td>
                        </tr>
                        <tr>
                            <td>Preço:</td>
                            <td><input type="number" name="preco" step=".01" required /></td>
                        </tr>
                        <tr>
                            <td>Código de barras:</td>
                            <td><input type="text" name="codigo_barras" maxlength="45" /></td>
                        </tr>
                        <tr>
                            <td>Quantidade em estoque:</td>
                            <td><input type="number" name="qt_estoque" required /></td>
                        </tr>
                        <tr>
                            <td>Imagem do produto (url):</td>
                            <td><input type="url" name="url_imagem" required /></td>
                        </tr>
                    </tbody>
                </table>
                <br />
                <input type="hidden" value="true" name="novo" />
                <input class="custom-button custom-button-blue" type="submit" value="Cadastrar" name="btn" />
            </form>
        </div>
    </body>
</html>
