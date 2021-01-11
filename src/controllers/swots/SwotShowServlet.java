package controllers.swots;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Swot;
import utils.DBUtil;

/**
 * Servlet implementation class SwotShowServlet
 */
@WebServlet("/swots/show")
public class SwotShowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SwotShowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        Swot s = em.find(Swot.class, Integer.parseInt(request.getParameter("id")));

        em.close();

        String strong1 = s.getStrong();
        if(strong1.indexOf("\r\n") >= 1){
            String strong2 = strong1.replace("\r\n", "z");
            request.setAttribute("strong", strong2);
        }else{
            request.setAttribute("strong", s.getStrong());
        }
        String weak1 = s.getWeak();
        if(weak1.indexOf("\r\n") >= 1){
            String weak2 = weak1.replace("\r\n", "z");
            request.setAttribute("weak", weak2);
        }else{
            request.setAttribute("weak", s.getWeak());
        }
        String opp1 = s.getOpp();
        if(opp1.indexOf("\r\n") >= 1){
            String opp2 = opp1.replace("\r\n", "z");
            request.setAttribute("opp", opp2);
        }else{
            request.setAttribute("opp", s.getOpp());
        }
        String thre1 = s.getThre();
        if(thre1.indexOf("\r\n") >= 1){
            String thre2 = thre1.replace("\r\n", "z");
            request.setAttribute("thre", thre2);
        }else{
            request.setAttribute("thre", s.getThre());
        }
        request.setAttribute("swot", s);
        request.setAttribute("_token", request.getSession().getId());

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/swots/show.jsp");
        rd.forward(request, response);
    }

}
