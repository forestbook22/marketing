package controllers.segs;

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

import models.Seg;
import models.validators.SegValidator;
import utils.DBUtil;

/**
 * Servlet implementation class SegsDestroyServlet
 */
@WebServlet("/segs/update")
public class SegsUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SegsUpdateServlet() {
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

            Seg se = em.find(Seg.class, (Integer)(request.getSession().getAttribute("seg_id")));

            se.setDate(Date.valueOf(request.getParameter("date")));
            se.setFrame(request.getParameter("frame"));
            se.setX(Integer.parseInt(request.getParameter("x")));
            se.setX1(request.getParameter("x1"));
            se.setX2(request.getParameter("x2"));
            se.setY(Integer.parseInt(request.getParameter("y")));
            se.setY1(request.getParameter("y1"));
            se.setY2(request.getParameter("y2"));
            se.setOne(request.getParameter("one"));
            se.setTwo(request.getParameter("two"));
            se.setThree(request.getParameter("three"));
            se.setFour(request.getParameter("four"));
            se.setUpdated_at(new Timestamp(System.currentTimeMillis()));

            List<String> errors = SegValidator.validate(se);
            if(errors.size() > 0) {
                em.close();

                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("seg", se);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/segs/edit.jsp");
                rd.forward(request, response);
            } else {
                em.getTransaction().begin();
                em.getTransaction().commit();
                em.close();
                request.getSession().setAttribute("flush", "更新が完了しました。");

                request.getSession().removeAttribute("seg_id");

                response.sendRedirect(request.getContextPath() + "/segs/index");
            }
        }
    }

}
