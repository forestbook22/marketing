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
 * Servlet implementation class ReportsEditServlet
 */
@WebServlet("/targets/edit")
public class TargetsEditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TargetsEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        Target tar = em.find(Target.class, Integer.parseInt(request.getParameter("id")));
        User login_user = (User)request.getSession().getAttribute("login_user");
        Title users_title = (Title)request.getSession().getAttribute("users_title");

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

        if(tar != null && login_user.getId() == tar.getUser().getId()) {
            request.setAttribute("target", tar);
            request.setAttribute("seg", seg);
            request.setAttribute("_token", request.getSession().getId());
            request.getSession().setAttribute("target_id", tar.getId());
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/targets/edit.jsp");
        rd.forward(request, response);
    }

}