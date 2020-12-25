package controllers.targets;

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

import models.Target;
import models.Title;
import models.User;
import models.validators.TargetValidator;
import utils.DBUtil;

/**
 * Servlet implementation class ReportsCreateServlet
 */
@WebServlet("/targets/create")
public class TargetsCreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TargetsCreateServlet() {
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

            Target tar = new Target();

            tar.setUser((User)request.getSession().getAttribute("login_user"));
            tar.setTitle((Title)request.getSession().getAttribute("users_title"));

            Date date = new Date(System.currentTimeMillis());
            String rd_str = request.getParameter("date");
            if(rd_str != null && !rd_str.equals("")) {
                date = Date.valueOf(request.getParameter("date"));
            }
            tar.setDate(date);
            tar.setFrame(request.getParameter("frame"));
            tar.setReal(Integer.parseInt(request.getParameter("real")));
            tar.setRate(Integer.parseInt(request.getParameter("rate")));
            tar.setRank(Integer.parseInt(request.getParameter("rank")));
            tar.setReach(Integer.parseInt(request.getParameter("reach")));
            tar.setRival(Integer.parseInt(request.getParameter("rival")));
            tar.setResponse(Integer.parseInt(request.getParameter("response")));
            tar.setShow_flag(Integer.parseInt(request.getParameter("show_flag")));

            Timestamp currentTime = new Timestamp(System.currentTimeMillis());
            tar.setCreated_at(currentTime);
            tar.setUpdated_at(currentTime);
            tar.setDelete_flag(0);

            List<String> errors = TargetValidator.validate(tar);
            if(errors.size() > 0) {
                em.close();

                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("target", tar);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/targets/new.jsp");
                rd.forward(request, response);
            } else {
                em.getTransaction().begin();
                em.persist(tar);
                em.getTransaction().commit();
                em.close();
                request.getSession().setAttribute("flush", "登録が完了しました。");

                response.sendRedirect(request.getContextPath() + "/");
            }
        }
    }

}