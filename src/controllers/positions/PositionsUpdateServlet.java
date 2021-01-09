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
import models.validators.PositionValidator;
import utils.DBUtil;

/**
 * Servlet implementation class PositionsDestroyServlet
 */
@WebServlet("/positions/update")
public class PositionsUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PositionsUpdateServlet() {
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

            Position po = em.find(Position.class, (Integer)(request.getSession().getAttribute("position_id")));

            po.setDate(Date.valueOf(request.getParameter("date")));
            po.setShow_flag(Integer.parseInt(request.getParameter("show_flag")));
            po.setAttri(request.getParameter("attri"));
            po.setBenefit(request.getParameter("benefit"));
            po.setOpp(request.getParameter("opp"));
            po.setRelation(request.getParameter("relation"));
            po.setDistance(request.getParameter("distance"));
            po.setKind(request.getParameter("kind"));
            po.setKind(request.getParameter("kind"));
            po.setX(request.getParameter("x"));
            po.setY(request.getParameter("y"));
            po.setX1(request.getParameter("x1"));
            po.setX2(request.getParameter("x2"));
            po.setY1(request.getParameter("y1"));
            po.setY2(request.getParameter("y2"));
            po.setUpdated_at(new Timestamp(System.currentTimeMillis()));

            List<String> errors = PositionValidator.validate(po) ;
            if(errors.size() > 0) {
                em.close();

                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("position", po) ;
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/positions/edit.jsp");
                rd.forward(request, response);
            } else {
                em.getTransaction().begin();
                em.getTransaction().commit();
                em.close();

                request.getSession().removeAttribute("position_id");

                response.sendRedirect(request.getContextPath() + "/positions/img?id="+ po.getTitle().getId());
            }
        }
    }

}
