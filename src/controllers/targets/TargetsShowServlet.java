package controllers.targets;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Seg;
import models.Target;
import models.Title;
import models.User;
import utils.DBUtil;

/**
 * Servlet implementation class ReportsShowServlet
 */
@WebServlet("/targets/show")
public class TargetsShowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TargetsShowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        User login_user = (User)request.getSession().getAttribute("login_user");
        Title users_title = (Title)request.getSession().getAttribute("users_title");
        Target tar = em.find(Target.class, Integer.parseInt(request.getParameter("id")));

        Seg seg = null;

        try {
            seg = em.createNamedQuery("getMyAllSegs", Seg.class)
                                    .setParameter("user", login_user)
                                    .setParameter("title", users_title)
                                    .getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
        }

        em.close();

        request.setAttribute("target", tar);
        request.setAttribute("seg", seg);
        request.setAttribute("_token", request.getSession().getId());

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/targets/show.jsp");
        rd.forward(request, response);
    }

}