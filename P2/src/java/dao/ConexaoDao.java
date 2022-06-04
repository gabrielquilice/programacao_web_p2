package dao;

import java.sql.*;

public class ConexaoDao {

    private final String ENDERECO_SERVIDOR = "localhost:3307";
    private final String BD = "mwgames";
    private final String URL = "jdbc:mysql://" + ENDERECO_SERVIDOR + "/" + BD;
    private final String USUARIO = "root";
    private final String SENHA = "mysql";

    private Connection connection;

    public Connection conectar() {
        try {
            Class.forName("com.mysql.jdbc.Driver");

            connection = DriverManager.getConnection(URL, USUARIO, SENHA);
            
            return connection;

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("ConexaoDao - Erro: " + e.getMessage());
            return null;
        }
    }

    public boolean desconectar() {
        try {
            connection.close();
            return true;
        } catch (SQLException e) {
            return false;
        }
    }

}

