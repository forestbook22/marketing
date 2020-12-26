package controllers.targets;

import java.io.IOException;
import java.sql.Date;

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
 * Servlet implementation class TargetsNewServlet
 */
@WebServlet("/targets/new")
public class TargetsNewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TargetsNewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("_token", request.getSession().getId());
        EntityManager em = DBUtil.createEntityManager();

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

        Target tar = new Target();
        tar.setDate(new Date(System.currentTimeMillis()));
        request.setAttribute("target", tar);
        request.setAttribute("seg", seg);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/targets/new.jsp");
        rd.forward(request, response);
    }
}
