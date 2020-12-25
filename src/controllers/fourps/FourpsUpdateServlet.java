package controllers.fourps;

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

import models.Fourp;
import models.validators.FourpValidator;
import utils.DBUtil;

/**
 * Servlet implementation class FourpsDestroyServlet
 */
@WebServlet("/fourps/update")
public class FourpsUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FourpsUpdateServlet() {
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

            Fourp f = em.find(Fourp.class, (Integer)(request.getSession().getAttribute("fourp_id")));

            f.setDate(Date.valueOf(request.getParameter("date")));
            f.setFrame(request.getParameter("frame"));
            f.setProduct(request.getParameter("product"));
            f.setPrice(request.getParameter("price"));
            f.setPlace(request.getParameter("place"));
            f.setPromotion(request.getParameter("promotion"));
            f.setUpdated_at(new Timestamp(System.currentTimeMillis()));

            List<String> errors = FourpValidator.validate(f);
            if(errors.size() > 0) {
                em.close();

                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("fourp", f);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/fourps/edit.jsp");
                rd.forward(request, response);
            } else {
                em.getTransaction().begin();
                em.getTransaction().commit();
                em.close();
                request.getSession().setAttribute("flush", "更新が完了しました。");

                request.getSession().removeAttribute("fourp_id");

                response.sendRedirect(request.getContextPath() + "/fourps/index");
            }
        }
    }

}
