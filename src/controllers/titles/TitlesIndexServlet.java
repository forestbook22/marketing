package controllers.titles;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Title;
import models.User;
import utils.DBUtil;

/**
 * Servlet implementation class TitlesIndexServlet
 */
@WebServlet("/index.html")
public class TitlesIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TitlesIndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        User login_user = (User)request.getSession().getAttribute("login_user");

        int page;
        try{
            page = Integer.parseInt(request.getParameter("page"));
        } catch(Exception e) {
            page = 1;
        }
        List<Title> titles = em.createNamedQuery("getMyAllTitles", Title.class)
                                  .setParameter("user", login_user)
                                  .setFirstResult(15 * (page - 1))
                                  .setMaxResults(15)
                                  .getResultList();

        long titles_count = (long)em.createNamedQuery("getMyTitlesCount", Long.class)
                                  .setParameter("user", login_user)
                                  .getSingleResult();

        em.close();

        request.setAttribute("titles", titles);
        request.setAttribute("titles_count", titles_count);
        request.setAttribute("page", page);
        if(request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/titles/index.jsp");
        rd.forward(request, response);
    }
}