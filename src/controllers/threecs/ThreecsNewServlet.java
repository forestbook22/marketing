package controllers.threecs;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Threec;

/**
 * Servlet implementation class ThreecsNewServlet
 */
@WebServlet("/threecs/new")
public class ThreecsNewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThreecsNewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("_token", request.getSession().getId());

        Threec t = new Threec();
        t.setDate(new Date(System.currentTimeMillis()));
        request.setAttribute("threec", t);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/threecs/new.jsp");
        rd.forward(request, response);
    }

}
