/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import bean.Produto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ProdutoDao {

    public int saveProduto(Produto produto) throws ClassNotFoundException, SQLException {
        ConexaoDao conexaoDao = new ConexaoDao();

        int result = 0;
        String sql;

        if (produto.getCodigoBarras().equals("")) {
            sql = "INSERT INTO produto(nome, qt_estoque, preco, url_imagem, fg_ativo) values (?, ?, ?, ?, 'S');";
        } else {
            sql = "INSERT INTO produto(nome, codigo_barras, qt_estoque, preco, url_imagem, fg_ativo) values (?, ?, ?, ?, ?, 'S');";
        }

        try ( Connection con = conexaoDao.conectar();  PreparedStatement preparedStatement = con.prepareStatement(sql)) {

            if (produto.getCodigoBarras().equals("")) {
                preparedStatement.setString(1, produto.getNome());
                preparedStatement.setInt(2, produto.getQtdEstoque());
                preparedStatement.setDouble(3, produto.getPreco());
                preparedStatement.setString(4, produto.getUrlImagem());
            } else {
                preparedStatement.setString(1, produto.getNome());
                preparedStatement.setString(2, produto.getCodigoBarras());
                preparedStatement.setInt(3, produto.getQtdEstoque());
                preparedStatement.setDouble(4, produto.getPreco());
                preparedStatement.setString(5, produto.getUrlImagem());
            }

            result = preparedStatement.executeUpdate();

            conexaoDao.desconectar();
        } catch (SQLException e) {
            printSQLException(e);
        }

        return result;
    }

    public int updateProduto(Produto produto) throws ClassNotFoundException, SQLException {
        ConexaoDao conexaoDao = new ConexaoDao();

        int result = 0;

        String sql = "UPDATE produto SET nome = ?, codigo_barras = ?, qt_estoque = ?, preco = ?, url_imagem = ?, fg_ativo = ? where idproduto = ?;";

        try ( Connection con = conexaoDao.conectar();  PreparedStatement preparedStatement = con.prepareStatement(sql)) {
            preparedStatement.setString(1, produto.getNome());
            preparedStatement.setString(2, produto.getCodigoBarras());
            preparedStatement.setInt(3, produto.getQtdEstoque());
            preparedStatement.setDouble(4, produto.getPreco());
            preparedStatement.setString(5, produto.getUrlImagem());
            preparedStatement.setString(6, produto.getFgAtivo());
            preparedStatement.setInt(7, produto.getIdProduto());

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
