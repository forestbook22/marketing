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
import models.Seg;
import models.Target;
import models.Title;
import models.User;
import utils.DBUtil;

/**
 * Servlet implementation class ReportsEditServlet
 */
@WebServlet("/positions/edit")
public class PositionsEditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PositionsEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        Position po = em.find(Position.class, Integer.parseInt(request.getParameter("id")));
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

        if(po != null && login_user.getId() == po.getUser().getId()) {
            request.setAttribute("position", po);
            request.setAttribute("_token", request.getSession().getId());
            request.getSession().setAttribute("position_id", po.getId());
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
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/positions/edit.jsp");
        rd.forward(request, response);
    }

}