/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import bean.Produto;
import bean.ProdutoVenda;
import dao.ProdutoDao;
import dao.VendaDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControllerServlet", loadOnStartup = 1, urlPatterns = {
    "/produtos", "/produtoForm", "/editProdutoForm", "/excluirProduto", "/saveProdutoForm",
    "/vendas", "/cadastrarVendaForm", "/saveVenda",
    "/findFilmByActor", "/selectFilmsByActor"
})
public class ControllerServlet extends HttpServlet {

    String param = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userPath = request.getServletPath();
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        //Produtos
        if (userPath.equals("/produtos")) {
            String url = "/WEB-INF/view/produtos.jsp";
            request.getRequestDispatcher(url).forward(request, response);
        }

        if (userPath.equals("/produtoForm")) {
            String url = "/WEB-INF/view/produtoForm.jsp";
            request.getRequestDispatcher(url).forward(request, response);
        }

        if (userPath.equals("/editProdutoForm")) {
            String url = "/WEB-INF/view/editProdutoForm.jsp?id=" + request.getParameter("id");
            request.getRequestDispatcher(url).forward(request, response);
        }

        //Vendas
        if (userPath.equals("/vendas")) {
            String url = "/WEB-INF/view/vendas.jsp";
            request.getRequestDispatcher(url).forward(request, response);
        }

        if (userPath.equals("/cadastrarVendaForm")) {
            String url = "/WEB-INF/view/cadastrarVendaForm.jsp";
            request.getRequestDispatcher(url).forward(request, response);
        }

        if (userPath.equals("/findFilmByActor")) {
            String url = "/WEB-INF/view/findFilmByActor.jsp";
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String userPath = request.getServletPath();
        if (userPath.equals("/selectFilmsByActor")) {
            request.getRequestDispatcher("/WEB-INF/view/queryFilmsById.jsp?idPessoa=" + request.getParameter("idPessoa")).forward(request, response);
        }

        //Produtos
        if (userPath.equals("/saveProdutoForm")) {
            saveProduto(request, response, out);
        }

        if (userPath.equals("/excluirProduto")) {
            excluirProduto(request, response, out);
        }

        if (userPath.equals("/saveVenda")) {
            saveVenda(request, response, out);
        }

    }

    private void excluirProduto(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws ServletException, IOException {
        try {
            ProdutoDao dao = new ProdutoDao();

            dao.deleteProduto(Integer.parseInt(request.getParameter("id_produto")));
            request.getRequestDispatcher("/WEB-INF/view/produtos.jsp").forward(request, response);
        } catch (ClassNotFoundException | NumberFormatException | SQLException ex) {
            out.println("<html>");
            out.println("<title>Erro</title>");
            out.println("<body>");
            out.println("<script>alert('Não foi possível excluir o registro!');</script>");
            out.println("<a href='/WEB-INF/view/index.html'>Voltar para a página inicial</a>");
            out.println("</body>");
            out.println("</html>");

            Logger.getLogger(ControllerServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void saveProduto(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws ServletException, IOException {
        try {
            Produto produto = new Produto();
            if (!request.getParameter("novo").equalsIgnoreCase("true")) {
                produto.setIdProduto(Integer.parseInt(request.getParameter("id_produto")));
                produto.setFgAtivo(request.getParameter("fg_ativo"));
            }
            produto.setNome(request.getParameter("nome"));
            produto.setCodigoBarras(request.getParameter("codigo_barras"));
            produto.setQtdEstoque(Integer.parseInt(request.getParameter("qt_estoque")));
            produto.setPreco(Double.valueOf(request.getParameter("preco")));
            produto.setUrlImagem(request.getParameter("url_imagem"));

            ProdutoDao dao = new ProdutoDao();

            if (request.getParameter("novo").equalsIgnoreCase("true")) {
                dao.saveProduto(produto);
            } else {
                dao.updateProduto(produto);
            }

            if (request.getParameter("novo").equalsIgnoreCase("true")) {
                request.setAttribute("p", 1);
                request.getRequestDispatcher("/WEB-INF/view/produtoForm.jsp?p=1").forward(request, response);
            } else {
                request.getRequestDispatcher("/WEB-INF/view/produtos.jsp").forward(request, response);
            }

        } catch (ClassNotFoundException | SQLException ex) {
            out.println("<html>");
            out.println("<title>Erro</title>");
            out.println("<body>");
            out.println("<script>alert('Não foi possível salvar os dados! Verifique os Campos!');</script>");
            out.println("<a href='/WEB-INF/view/index.html'>Voltar para a página inicial</a>");
            out.println("</body>");
            out.println("</html>");

            Logger.getLogger(ControllerServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void saveVenda(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws ServletException, IOException {
        try {
            List<ProdutoVenda> listaProdutos = new ArrayList<>();

            int idFuncionario = Integer.parseInt(request.getParameter("funcionario"));
            int tipoPagamento = Integer.parseInt(request.getParameter("tipo_pagamento"));

            String[] idsProdutos = request.getParameterValues("id_produto");

            for (String idProduto : idsProdutos) {
                double preco = Double.parseDouble(request.getParameter(String.format("prods[%s][preco]", idProduto)));
                int qtde = Integer.parseInt(request.getParameter(String.format("prods[%s][qtd]", idProduto)));

                ProdutoVenda prodVenda = new ProdutoVenda();
                prodVenda.setCodigoProduto(Integer.parseInt(idProduto));
                prodVenda.setPrecoProduto(preco);
                prodVenda.setQuantidade(qtde);

                listaProdutos.add(prodVenda);
            }

            VendaDao dao = new VendaDao();
            dao.cadastrarVenda(listaProdutos, idFuncionario, tipoPagamento);
            request.getRequestDispatcher("/WEB-INF/view/vendas.jsp?p=1").forward(request, response);

        } catch (ClassNotFoundException | SQLException ex) {
            out.println("<html>");
            out.println("<title>Erro</title>");
            out.println("<body>");
            out.println("<script>alert('Não foi possível salvar os dados! Verifique os Campos!');</script>");
            out.println("<a href='/WEB-INF/view/index.html'>Voltar para a página inicial</a>");
            out.println("</body>");
            out.println("</html>");

            Logger.getLogger(ControllerServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
