package controllers.threecs;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Threec;
import models.User;
import utils.DBUtil;

/**
 * Servlet implementation class ThreecsEditServlet
 */
@WebServlet("/threecs/edit")
public class ThreecsEditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThreecsEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        Threec t = em.find(Threec.class, Integer.parseInt(request.getParameter("id")));

        em.close();

        User login_user = (User)request.getSession().getAttribute("login_user");
        if(t != null && login_user.getId() == t.getUser().getId()) {
            request.setAttribute("threec", t);
            request.setAttribute("_token", request.getSession().getId());
            request.getSession().setAttribute("threec_id", t.getId());
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/threecs/edit.jsp");
        rd.forward(request, response);
    }
}
