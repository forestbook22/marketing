package controllers.threecs;

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

import models.Threec;
import models.validators.ThreecValidator;
import utils.DBUtil;

/**
 * Servlet implementation class ThreecsUpdateServlet
 */
@WebServlet("/threecs/update")
public class ThreecsUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThreecsUpdateServlet() {
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

            Threec t = em.find(Threec.class, (Integer)(request.getSession().getAttribute("threec_id")));

            t.setDate(Date.valueOf(request.getParameter("date")));
            t.setFrame(request.getParameter("frame"));
            t.setCus(request.getParameter("cus"));
            t.setOwn(request.getParameter("own"));
            t.setCompe(request.getParameter("compe"));
            t.setShow_flag(Integer.parseInt(request.getParameter("show_flag")));
            t.setUpdated_at(new Timestamp(System.currentTimeMillis()));

            List<String> errors = ThreecValidator.validate(t);
            if(errors.size() > 0) {
                em.close();

                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("threec", t);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/threecs/edit.jsp");
                rd.forward(request, response);
            } else {
                em.getTransaction().begin();
                em.getTransaction().commit();
                em.close();
                request.getSession().setAttribute("flush", "更新が完了しました。");

                request.getSession().removeAttribute("threec_id");

                response.sendRedirect(request.getContextPath() + "/titles/show?id="+ t.getTitle().getId());
            }
        }
    }

}
