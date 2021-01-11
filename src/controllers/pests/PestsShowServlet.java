package controllers.pests;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Pest;
import utils.DBUtil;

/**
 * Servlet implementation class ReportsShowServlet
 */
@WebServlet("/pests/show")
public class PestsShowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PestsShowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        Pest p = em.find(Pest.class, Integer.parseInt(request.getParameter("id")));

        em.close();

        String poli1 = p.getPoli();
        if(poli1.indexOf("\r\n") >= 1){
            String poli2 = poli1.replace("\r\n", "z");
            request.setAttribute("poli", poli2);
        }else{
            request.setAttribute("poli", p.getPoli());
        }
        String eco1 = p.getEco();
        if(eco1.indexOf("\r\n") >= 1){
            String eco2 = eco1.replace("\r\n", "z");
            request.setAttribute("eco", eco2);
        }else{
            request.setAttribute("eco", p.getEco());
        }
        String soci1 = p.getSoci();
        if(soci1.indexOf("\r\n") >= 1){
            String soci2 = soci1.replace("\r\n", "z");
            request.setAttribute("soci", soci2);
        }else{
            request.setAttribute("soci", p.getSoci());
        }
        String tech1 = p.getTech();
        if(tech1.indexOf("\r\n") >= 1){
            String tech2 = tech1.replace("\r\n", "z");
            request.setAttribute("tech", tech2);
        }else{
            request.setAttribute("tech", p.getTech());
        }

        request.setAttribute("pest", p);
        request.setAttribute("_token", request.getSession().getId());

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/pests/show.jsp");
        rd.forward(request, response);
    }

}