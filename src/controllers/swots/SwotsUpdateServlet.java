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
import models.validators.SwotValidator;
import utils.DBUtil;

/**
 * Servlet implementation class SwotsUpdateServlet
 */
@WebServlet("/swots/update")
public class SwotsUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SwotsUpdateServlet() {
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

            Swot s = em.find(Swot.class, (Integer)(request.getSession().getAttribute("swot_id")));

            s.setDate(Date.valueOf(request.getParameter("date")));
            s.setShow_flag(Integer.parseInt(request.getParameter("show_flag")));
            s.setFrame(request.getParameter("frame"));
            s.setStrong(request.getParameter("strong"));
            s.setWeak(request.getParameter("weak"));
            s.setOpp(request.getParameter("opp"));
            s.setThre(request.getParameter("thre"));
            s.setUpdated_at(new Timestamp(System.currentTimeMillis()));

            List<String> errors = SwotValidator.validate(s);
            if(errors.size() > 0) {
                em.close();

                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("swot", s);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/swots/edit.jsp");
                rd.forward(request, response);
            } else {
                em.getTransaction().begin();
                em.getTransaction().commit();
                em.close();
                request.getSession().setAttribute("flush", "更新が完了しました。");

                request.getSession().removeAttribute("swot_id");

                response.sendRedirect(request.getContextPath() + "/titles/show?id="+ s.getTitle().getId());
            }
        }
    }

}
