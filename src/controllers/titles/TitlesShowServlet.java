package controllers.titles;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Fourp;
import models.Pest;
import models.Seg;
import models.Swot;
import models.Target;
import models.Threec;
import models.Title;
import models.User;
import utils.DBUtil;

/**
 * Servlet implementation class TitlesShowServlet
 */
@WebServlet("/titles/show")
public class TitlesShowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TitlesShowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        User login_user = (User)request.getSession().getAttribute("login_user");
        Title users_title = em.find(Title.class, Integer.parseInt(request.getParameter("id")));

        Fourp fourp = null;
        Swot swot = null;
        Threec threec = null;
        Pest pest = null;
        Seg seg = null;
        Target target = null;

            try {
                fourp = em.createNamedQuery("getMyAllFourps", Fourp.class)
                                        .setParameter("user", login_user)
                                        .setParameter("title", users_title)
                                        .getSingleResult();
            } catch (Exception e) {
                e.printStackTrace();
            }

            try {
                swot = em.createNamedQuery("getMyAllSwots", Swot.class)
                                        .setParameter("user", login_user)
                                        .setParameter("title", users_title)
                                        .getSingleResult();
            } catch (Exception e) {
                e.printStackTrace();
            }

            try {
                threec = em.createNamedQuery("getMyAllThreecs", Threec.class)
                                        .setParameter("user", login_user)
                                        .setParameter("title", users_title)
                                        .getSingleResult();
            } catch (Exception e) {
                e.printStackTrace();
            }

            try {
                pest = em.createNamedQuery("getMyAllPests", Pest.class)
                                        .setParameter("user", login_user)
                                        .setParameter("title", users_title)
                                        .getSingleResult();
            } catch (Exception e) {
                e.printStackTrace();
            }


            try {
                seg = em.createNamedQuery("getMyAllSegs", Seg.class)
                                        .setParameter("user", login_user)
                                        .setParameter("title", users_title)
                                        .getSingleResult();
            } catch (Exception e) {
                e.printStackTrace();
            }

            try {
                target = em.createNamedQuery("getMyAllTargets", Target.class)
                                        .setParameter("user", login_user)
                                        .setParameter("title", users_title)
                                        .getSingleResult();
            } catch (Exception e) {
                e.printStackTrace();
            }

        em.close();

        request.setAttribute("fourp", fourp);
        request.setAttribute("swot", swot);
        request.setAttribute("threec", threec);
        request.setAttribute("pest", pest);
        request.setAttribute("seg", seg);
        request.setAttribute("target", target);
        request.getSession().setAttribute("users_title", users_title);

        if(request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/titles/show.jsp");
        rd.forward(request, response);
    }
}
