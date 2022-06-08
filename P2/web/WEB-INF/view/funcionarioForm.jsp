<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/produtos.css" rel="stylesheet" />
        <link href="css/main.css" rel="stylesheet" />
        <title>Cadastro de funcionário</title>
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
            <h1>Cadastro de funcionário</h1>
            <br />
            <form action="saveFuncionarioForm" method="post">
                <table>
                    <tbody>
                        <tr>
                            <td>Nome:</td>
                            <td><input type="text" name="nome" maxlength="200" required /></td>
                        </tr>
                        <tr>
                            <td>CPF:</td>
                            <td><input type="text" name="cpf" maxlenght="14" pattern="\d{3}\.\d{3}\.\d{3}-\d{2}" required /></td>
                        </tr>
                        <tr>
                            <td>RG:</td>
                            <td><input type="text" name="rg" maxlenght="12" pattern="\d{2}\.\d{3}\.\d{3}-\d{1}" required /></td>
                        </tr>
                        <tr>
                            <td>Sexo:</td>
                            <td>
                                <input type="radio" name="sexo" value="M" required />
                                <label for="Choice1">Masculino</label>
                                <input type="radio" name="sexo" value="F" required />
                                <label for="Choice2">Feminino</label>
                            </td>
                        </tr>
                        <tr>
                            <td>Data de nascimento:</td>
                            <td><input type="date" name="data_nascimento" required /></td>
                        </tr>
                        <tr>
                            <td>Usuário:</td>
                            <td><input type="text" name="sys_user" maxlength="45" required /></td>
                        </tr>
                        <tr>
                            <td>Senha:</td>
                            <td><input type="password" name="sys_password" maxlength="45" required /></td>
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
