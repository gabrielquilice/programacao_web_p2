
package dao;

import bean.Funcionario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class FuncionarioDao {
    public int saveFuncionario(Funcionario funcionario) throws ClassNotFoundException, SQLException {
        ConexaoDao conexaoDao = new ConexaoDao();

        int result = 0;
        String sql;

        
            sql = "INSERT INTO funcionario(nome, cpf, rg, sexo, data_nascimento, sys_user, sys_password, fg_ativo) values (?, ?, ?, ?, ?, ?, ?, 'S');";

        try ( Connection con = conexaoDao.conectar();  PreparedStatement preparedStatement = con.prepareStatement(sql)) {

                preparedStatement.setString(1, funcionario.getNome());
                preparedStatement.setString(2, funcionario.getCpf());
                preparedStatement.setString(3, funcionario.getRg());
                preparedStatement.setString(4, funcionario.getSexo());
                preparedStatement.setString(5, funcionario.getData_nascimento());
                preparedStatement.setString(6, funcionario.getSys_user());
                preparedStatement.setString(7, funcionario.getSys_password());
                
                result = preparedStatement.executeUpdate();
                conexaoDao.desconectar();
        } 
        catch (SQLException e) {
            printSQLException(e);
        }
        return result;
    }

    public int updateFuncionario(Funcionario funcionario) throws ClassNotFoundException, SQLException {
        ConexaoDao conexaoDao = new ConexaoDao();

        int result = 0;

        String sql = "UPDATE funcionario SET nome = ?, cpf = ?, rg = ?, sexo = ?, data_nascimento = ?, sys_user = ?, sys_password = ?, fg_ativo = ? where idfuncionario = ?;";

        try ( Connection con = conexaoDao.conectar();  PreparedStatement preparedStatement = con.prepareStatement(sql)) {
            preparedStatement.setString(1, funcionario.getNome());
            preparedStatement.setString(2, funcionario.getCpf());
            preparedStatement.setString(3, funcionario.getRg());
            preparedStatement.setString(4, funcionario.getSexo());
            preparedStatement.setString(5, funcionario.getData_nascimento());
            preparedStatement.setString(6, funcionario.getSys_user());
            preparedStatement.setString(7, funcionario.getSys_password());
            preparedStatement.setString(8, funcionario.getFg_ativo());
            preparedStatement.setInt(9, funcionario.getIdFuncionario());

            result = preparedStatement.executeUpdate();

            conexaoDao.desconectar();
        } catch (SQLException e) {
            printSQLException(e);
        }

        return result;
    }
    
    public int deleteFuncionario(int idFuncionario) throws ClassNotFoundException, SQLException {
        ConexaoDao conexaoDao = new ConexaoDao();

        int result = 0;

        String sql = "DELETE FROM funcionario WHERE idfuncionario = ?;";

        try ( Connection con = conexaoDao.conectar();  PreparedStatement preparedStatement = con.prepareStatement(sql)) {
            preparedStatement.setInt(1, idFuncionario);

            result = preparedStatement.executeUpdate();

            conexaoDao.desconectar();
        } catch (SQLException e) {
            printSQLException(e);
        }

        return result;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
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
