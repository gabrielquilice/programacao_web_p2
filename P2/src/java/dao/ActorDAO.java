/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import bean.Actor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class ActorDAO {
     public int saveActor(Actor actor) throws ClassNotFoundException, SQLException {
        ConexaoDao conexaoDao = new ConexaoDao();
        
         String INSERT_USERS_SQL = "INSERT INTO actor" +
            "  (first_name, last_name) VALUES " +
            " (?, ?);";

        int result = 0;

        try (Connection con = conexaoDao.conectar();
            PreparedStatement preparedStatement = con.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1,actor.getFirst_name());
            preparedStatement.setString(2, actor.getLast_name());
           
            result = preparedStatement.executeUpdate();

            conexaoDao.desconectar();
        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return result;
    }
     private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Codigo de erro: " + ((SQLException) e).getErrorCode());
                System.err.println("Mensagem: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Causa: " + t);
                    t = t.getCause();
                }
            }
        }
    }
    
}
