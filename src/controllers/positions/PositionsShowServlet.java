package controllers.positions;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Position;
import utils.DBUtil;

/**
 * Servlet implementation class ReportsShowServlet
 */
@WebServlet("/positions/show")
public class PositionsShowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PositionsShowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        Position po = em.find(Position.class, Integer.parseInt(request.getParameter("id")));

        em.close();
        String attri1 = po.getAttri();
        if(attri1.indexOf("\r\n") >= 1){
            String attri2 = attri1.replace("\r\n", "z");
            request.setAttribute("attri", attri2);
        }else{
            request.setAttribute("attri", po.getAttri());
        }
        String benefit1 = po.getBenefit();
        if(benefit1.indexOf("\r\n") >= 1){
            String benefit2 = benefit1.replace("\r\n", "z");
            request.setAttribute("benefit", benefit2);
        }else{
            request.setAttribute("benefit", po.getBenefit());
        }
        String opp1 = po.getOpp();
        if(opp1.indexOf("\r\n") >= 1){
            String opp2 = opp1.replace("\r\n", "z");
            request.setAttribute("opp", opp2);
        }else{
            request.setAttribute("opp", po.getOpp());
        }
        String relation1 = po.getRelation();
        if(relation1.indexOf("\r\n") >= 1){
            String relation2 = relation1.replace("\r\n", "z");
            request.setAttribute("relation", relation2);
        }else{
            request.setAttribute("relation", po.getRelation());
        }
        String distance1 = po.getDistance();
        if(distance1.indexOf("\r\n") >= 1){
            String distance2 = distance1.replace("\r\n", "z");
            request.setAttribute("distance", distance2);
        }else{
            request.setAttribute("distance", po.getDistance());
        }
        String kind1 = po.getKind();
        if(kind1.indexOf("\r\n") >= 1){
            String kind2 = kind1.replace("\r\n", "z");
            request.setAttribute("kind", kind2);
        }else{
            request.setAttribute("kind", po.getKind());
        }
        request.setAttribute("position", po) ;
        request.setAttribute("_token", request.getSession().getId());
        request.getSession().removeAttribute("flush");

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/positions/show.jsp");
        rd.forward(request, response);
    }

}