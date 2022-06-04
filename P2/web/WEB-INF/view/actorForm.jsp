<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            if (request.getParameter("p") != null) {
        %><script>alert('Cadastrado com Sucesso!');</script><%
            }

        %>
    </head>
    <body>
        <h1>Cadastro Actor</h1>
        <form action="saveActorForm" method="POST">
            <table border="1">
                <thead>
                    <tr>
                        <th>Atributo</th>
                        <th>Valor</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>First Name:</td>
                        <td><input type="text" name="first_name"/></td>
                    </tr>
                    <tr>
                        <td>Last Name:</td>
                        <td><input type="text" name="last_name"/></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center"><input type="submit" value="Salvar" name="btn" /></td>
                    </tr>
                </tbody>
            </table>

        </form>
    </body>
</html>
