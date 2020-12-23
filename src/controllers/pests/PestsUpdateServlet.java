package controllers.pests;

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

import models.Pest;
import models.validators.PestValidator;
import utils.DBUtil;

/**
 * Servlet implementation class PestsDestroyServlet
 */
@WebServlet("/pests/update")
public class PestsUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PestsUpdateServlet() {
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

            Pest p = em.find(Pest.class, (Integer)(request.getSession().getAttribute("pest_id")));

            p.setDate(Date.valueOf(request.getParameter("date")));
            p.setFrame(request.getParameter("frame"));
            p.setPoli(request.getParameter("poli"));
            p.setEco(request.getParameter("eco"));
            p.setSoci(request.getParameter("soci"));
            p.setTech(request.getParameter("tech"));
            p.setUpdated_at(new Timestamp(System.currentTimeMillis()));

            List<String> errors = PestValidator.validate(p);
            if(errors.size() > 0) {
                em.close();

                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("pest", p);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/pests/edit.jsp");
                rd.forward(request, response);
            } else {
                em.getTransaction().begin();
                em.getTransaction().commit();
                em.close();
                request.getSession().setAttribute("flush", "更新が完了しました。");

                request.getSession().removeAttribute("pest_id");

                response.sendRedirect(request.getContextPath() + "/pests/index");
            }
        }
    }

}
