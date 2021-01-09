package controllers.swots;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Swot;
import models.Title;
import models.User;
import models.validators.SwotValidator;
import utils.DBUtil;

/**
 * Servlet implementation class SwotsCreateServlet
 */
@WebServlet("/swots/create")
public class SwotsCreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SwotsCreateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = (String)request.getParameter("_token");
        if(_token != null && _token.equals(request.getSession().getId())) {
            EntityManager em = DBUtil.createEntityManager();

            Swot s = new Swot();

            s.setUser((User)request.getSession().getAttribute("login_user"));
            s.setTitle((Title)request.getSession().getAttribute("users_title"));

            Date date = new Date(System.currentTimeMillis());
            String rd_str = request.getParameter("date");
            if(rd_str != null && !rd_str.equals("")) {
                date = Date.valueOf(request.getParameter("date"));
            }
            s.setDate(date);
            s.setFrame(request.getParameter("frame"));
            s.setStrong(request.getParameter("strong"));
            s.setWeak(request.getParameter("weak"));
            s.setOpp(request.getParameter("opp"));
            s.setThre(request.getParameter("thre"));
            s.setShow_flag(Integer.parseInt(request.getParameter("show_flag")));

            Timestamp currentTime = new Timestamp(System.currentTimeMillis());
            s.setCreated_at(currentTime);
            s.setUpdated_at(currentTime);
            s.setDelete_flag(0);

            List<String> errors = SwotValidator.validate(s);
            if(errors.size() > 0) {
                em.close();

                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("swot", s);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/swots/new.jsp");
                rd.forward(request, response);
            } else {
                em.getTransaction().begin();
                em.persist(s);
                em.getTransaction().commit();
                em.close();
                request.getSession().setAttribute("flush", "登録が完了しました。");

                response.sendRedirect(request.getContextPath() + "/titles/show?id="+ s.getTitle().getId());
            }
        }
    }

}
