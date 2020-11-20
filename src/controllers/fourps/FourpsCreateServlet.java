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
import models.User;
import models.validators.FourpValidator;
import utils.DBUtil;

/**
 * Servlet implementation class ReportsCreateServlet
 */
@WebServlet("/fourps/create")
public class FourpsCreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FourpsCreateServlet() {
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

            Fourp f = new Fourp();

            f.setUser((User)request.getSession().getAttribute("login_user"));

            Date fourp_date = new Date(System.currentTimeMillis());
            String rd_str = request.getParameter("fourp_date");
            if(rd_str != null && !rd_str.equals("")) {
                fourp_date = Date.valueOf(request.getParameter("fourp_date"));
            }
            f.setFourp_date(fourp_date);

            f.setTitle(request.getParameter("title"));
            f.setProduct(request.getParameter("product"));
            f.setPrice(request.getParameter("price"));
            f.setPlace(request.getParameter("place"));
            f.setPromotion(request.getParameter("promotion"));

            Timestamp currentTime = new Timestamp(System.currentTimeMillis());
            f.setCreated_at(currentTime);
            f.setUpdated_at(currentTime);

            List<String> errors = FourpValidator.validate(f);
            if(errors.size() > 0) {
                em.close();

                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("fourp", f);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/fourps/new.jsp");
                rd.forward(request, response);
            } else {
                em.getTransaction().begin();
                em.persist(f);
                em.getTransaction().commit();
                em.close();
                request.getSession().setAttribute("flush", "登録が完了しました。");

                response.sendRedirect(request.getContextPath() + "/fourps/index");
            }
        }
    }

}