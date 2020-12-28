package controllers.positions;

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

import models.Position;
import models.Title;
import models.User;
import models.validators.PositionValidator;
import utils.DBUtil;

/**
 * Servlet implementation class ReportsCreateServlet
 */
@WebServlet("/positions/create")
public class PositionsCreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PositionsCreateServlet() {
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

            Position po = new Position();

            po.setUser((User)request.getSession().getAttribute("login_user"));
            po.setTitle((Title)request.getSession().getAttribute("users_title"));

            Date date = new Date(System.currentTimeMillis());
            String rd_str = request.getParameter("date");
            if(rd_str != null && !rd_str.equals("")) {
                date = Date.valueOf(request.getParameter("date"));
            }
            po.setDate(date);
            po.setFrame(request.getParameter("frame"));
            po.setX(request.getParameter("x"));
            po.setY(request.getParameter("y"));
            po.setX1(request.getParameter("x1"));
            po.setX2(request.getParameter("x2"));
            po.setY1(request.getParameter("y1"));
            po.setY2(request.getParameter("y2"));
            po.setShow_flag(Integer.parseInt(request.getParameter("show_flag")));

            Timestamp currentTime = new Timestamp(System.currentTimeMillis());
            po.setCreated_at(currentTime);
            po.setUpdated_at(currentTime);
            po.setDelete_flag(0);

            List<String> errors = PositionValidator.validate(po);
            if(errors.size() > 0) {
                em.close();

                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("position", po);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/positions/new.jsp");
                rd.forward(request, response);
            } else {
                em.getTransaction().begin();
                em.persist(po);
                em.getTransaction().commit();
                em.close();
                request.getSession().setAttribute("flush", "登録が完了しました。");

                response.sendRedirect(request.getContextPath() + "/");
            }
        }
    }

}