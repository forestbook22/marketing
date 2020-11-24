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
import models.User;
import models.validators.ThreecValidator;
import utils.DBUtil;

/**
 * Servlet implementation class ThreecsCreateServlet
 */
@WebServlet("/threecs/create")
public class ThreecsCreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThreecsCreateServlet() {
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

            Threec t = new Threec();

            t.setUser((User)request.getSession().getAttribute("login_user"));

            Date threec_date = new Date(System.currentTimeMillis());
            String rd_str = request.getParameter("threec_date");
            if(rd_str != null && !rd_str.equals("")) {
                threec_date = Date.valueOf(request.getParameter("threec_date"));
            }
            t.setThreec_date(threec_date);
            t.setFrame(request.getParameter("frame"));
            t.setTitle(request.getParameter("title"));
            t.setCus(request.getParameter("cus"));
            t.setOwn(request.getParameter("own"));
            t.setCompe(request.getParameter("compe"));
            t.setShow_flag(Integer.parseInt(request.getParameter("show_flag")));

            Timestamp currentTime = new Timestamp(System.currentTimeMillis());
            t.setCreated_at(currentTime);
            t.setUpdated_at(currentTime);
            t.setDelete_flag(0);

            List<String> errors = ThreecValidator.validate(t);
            if(errors.size() > 0) {
                em.close();

                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("threec", t);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/threecs/new.jsp");
                rd.forward(request, response);
            } else {
                em.getTransaction().begin();
                em.persist(t);
                em.getTransaction().commit();
                em.close();
                request.getSession().setAttribute("flush", "登録が完了しました。");

                response.sendRedirect(request.getContextPath() + "/threecs/index");
            }
    }
    }
}
