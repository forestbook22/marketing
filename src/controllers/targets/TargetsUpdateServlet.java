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
import models.validators.TargetValidator;
import utils.DBUtil;

/**
 * Servlet implementation class TargetsDestroyServlet
 */
@WebServlet("/targets/update")
public class TargetsUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TargetsUpdateServlet() {
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

            Target tar = em.find(Target.class, (Integer)(request.getSession().getAttribute("target_id")));

            tar.setDate(Date.valueOf(request.getParameter("date")));
            tar.setFrame(request.getParameter("frame"));
            tar.setReal1(Integer.parseInt(request.getParameter("real1")));
            tar.setRate1(Integer.parseInt(request.getParameter("rate1")));
            tar.setRank1(Integer.parseInt(request.getParameter("rank1")));
            tar.setReach1(Integer.parseInt(request.getParameter("reach1")));
            tar.setRival1(Integer.parseInt(request.getParameter("rival1")));
            tar.setResponse1(Integer.parseInt(request.getParameter("response1")));
            tar.setReal2(Integer.parseInt(request.getParameter("real2")));
            tar.setRate2(Integer.parseInt(request.getParameter("rate2")));
            tar.setRank2(Integer.parseInt(request.getParameter("rank2")));
            tar.setReach2(Integer.parseInt(request.getParameter("reach2")));
            tar.setRival2(Integer.parseInt(request.getParameter("rival2")));
            tar.setResponse2(Integer.parseInt(request.getParameter("response2")));
            tar.setReal3(Integer.parseInt(request.getParameter("real3")));
            tar.setRate3(Integer.parseInt(request.getParameter("rate3")));
            tar.setRank3(Integer.parseInt(request.getParameter("rank3")));
            tar.setReach3(Integer.parseInt(request.getParameter("reach3")));
            tar.setRival3(Integer.parseInt(request.getParameter("rival3")));
            tar.setResponse3(Integer.parseInt(request.getParameter("response3")));
            tar.setReal4(Integer.parseInt(request.getParameter("real4")));
            tar.setRate4(Integer.parseInt(request.getParameter("rate4")));
            tar.setRank4(Integer.parseInt(request.getParameter("rank4")));
            tar.setReach4(Integer.parseInt(request.getParameter("reach4")));
            tar.setRival4(Integer.parseInt(request.getParameter("rival4")));
            tar.setResponse4(Integer.parseInt(request.getParameter("response4")));
            tar.setChoice(Integer.parseInt(request.getParameter("choice")));
            tar.setShow_flag(Integer.parseInt(request.getParameter("show_flag")));
            tar.setUpdated_at(new Timestamp(System.currentTimeMillis()));

            List<String> errors = TargetValidator.validate(tar);
            if(errors.size() > 0) {
                em.close();

                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("target", tar);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/targets/edit.jsp");
                rd.forward(request, response);
            } else {
                em.getTransaction().begin();
                em.getTransaction().commit();
                em.close();
                request.getSession().setAttribute("flush", "更新が完了しました。");

                request.getSession().removeAttribute("target_id");

                response.sendRedirect(request.getContextPath() + "/targets/index");
            }
        }
    }

}
