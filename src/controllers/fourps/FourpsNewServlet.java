package controllers.fourps;

import java.io.IOException;
import java.sql.Date;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Fourp;
import models.Seg;
import models.Target;
import models.Title;
import models.User;
import utils.DBUtil;

/**
 * Servlet implementation class FourpsNewServlet
 */
@WebServlet("/fourps/new")
public class FourpsNewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FourpsNewServlet() {
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

        Target target = null;

        try {
            target = em.createNamedQuery("getMyAllTargets", Target.class)
                                    .setParameter("user", login_user)
                                    .setParameter("title", users_title)
                                    .getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
        }

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
        Fourp f = new Fourp();
        f.setDate(new Date(System.currentTimeMillis()));
        request.setAttribute("fourp", f);
        if(target.getChoice() == 1){
            request.setAttribute("choice",seg.getOne());
        }
        if(target.getChoice() == 2){
            request.setAttribute("choice",seg.getTwo());
        }
        if(target.getChoice() == 3){
            request.setAttribute("choice",seg.getThree());
        }
        if(target.getChoice() == 4){
            request.setAttribute("choice",seg.getFour());
        }
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/fourps/new.jsp");
        rd.forward(request, response);
    }
}
