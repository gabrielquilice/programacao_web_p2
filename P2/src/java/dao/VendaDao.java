/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import bean.Produto;
import bean.ProdutoVenda;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class VendaDao {

    public int cadastrarVenda(List<ProdutoVenda> listaProdutos, int idFuncionario, int tipoPag) throws ClassNotFoundException, SQLException {
        ConexaoDao conexaoDao = new ConexaoDao();

        int result = 0;
        String sql = "SELECT MAX(idvenda)+1 AS next_id FROM venda";

        try ( Connection con = conexaoDao.conectar(); PreparedStatement preparedStatement = con.prepareStatement(sql)) {
            //pega o próximo id da venda
            preparedStatement.executeQuery().next();
            int idVenda = preparedStatement.getResultSet().getInt("next_id");

            //insere o registro da venda
            PreparedStatement preparedStatement2 = con.prepareStatement(
                    "INSERT INTO venda(f_idfuncionario, tp_idpagamento, data_venda, preco_venda) VALUES "
                    + "(?, ?, NOW(), 0.00)");
            preparedStatement2.setInt(1, idFuncionario);
            preparedStatement2.setInt(2, tipoPag);
            preparedStatement2.execute();

            //insere os itens da venda
            for (ProdutoVenda produtoVenda : listaProdutos) {
                PreparedStatement preparedStatement3 = con.prepareStatement(
                        "INSERT INTO venda_item(v_idvenda, p_idproduto, quantidade, total_preco_item) VALUES "
                        + "(?, ?, ?, ?)");
                preparedStatement3.setInt(1, idVenda);
                preparedStatement3.setInt(2, produtoVenda.getCodigoProduto());
                preparedStatement3.setInt(3, produtoVenda.getQuantidade());
                preparedStatement3.setDouble(4, produtoVenda.getPrecoProduto() * produtoVenda.getQuantidade());
                
                System.out.println(produtoVenda.getQuantidade());

                preparedStatement3.execute();
            }

            result = idVenda;

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
