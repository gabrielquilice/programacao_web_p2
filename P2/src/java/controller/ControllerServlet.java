/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import bean.Actor;
import dao.ActorDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControllerServlet", loadOnStartup = 1, urlPatterns = {"/produtos",
    "/actorForm", "/saveActorForm", "/findFilmByActor", "/selectFilmsByActor"})
public class ControllerServlet extends HttpServlet {

    String param = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userPath = request.getServletPath();
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        if (userPath.equals("/produtos")) {

            String url = "/WEB-INF/view/produtos.jsp";
            request.getRequestDispatcher(url).forward(request, response);

        }
        if (userPath.equals("/actorForm")) {
            String url = "/WEB-INF/view/actorForm.jsp";
            request.getRequestDispatcher(url).forward(request, response);
        }

        if (userPath.equals("/findFilmByActor")) {
            String url = "/WEB-INF/view/findFilmByActor.jsp";
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String userPath = request.getServletPath();
        if (userPath.equals("/selectFilmsByActor")) {

            request.getRequestDispatcher("/WEB-INF/view/queryFilmsById.jsp?idPessoa=" + request.getParameter("idPessoa")).forward(request, response);

        }
        if (userPath.equals("/saveActorForm")) {

            Actor actor = new Actor();
            actor.setFirst_name(request.getParameter("first_name"));
            actor.setLast_name(request.getParameter("last_name"));
            actor.setLast_update(new Timestamp(System.currentTimeMillis()));

            ActorDAO dao = new ActorDAO();
            try {
                dao.saveActor(actor);
                //codigo para passar uma confirmação de cadastro para ser exibido uma caixa de sucesso
                request.setAttribute("p", 1); // Store products in request scope.
                request.getRequestDispatcher("/WEB-INF/view/actorForm.jsp?p=1").forward(request, response);

            } catch (ClassNotFoundException | SQLException ex) {
                out.println("<html>");
                out.println("<title>Olá</title>");
                out.println("<body>");
                out.println("<script>alert('Não foi possível salvar os dados! Verifique os Campos!');</script>");
                out.println("<a href='/WEB-INF/view/actorForm.jsp'>Voltar ao Formulário de Atores");
                out.println("</body>");
                out.println("</html>");

                Logger.getLogger(ControllerServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
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
