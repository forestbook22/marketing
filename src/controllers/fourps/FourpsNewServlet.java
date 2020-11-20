package controllers.fourps;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Fourp;

/**
 * Servlet implementation class FourpNewServlet
 */
@WebServlet("/fourps/new")
public class FourpsNewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FourpsNewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("_token", request.getSession().getId());

        Fourp f = new Fourp();
        f.setFourp_date(new Date(System.currentTimeMillis()));
        request.setAttribute("fourp", f);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/fourps/new.jsp");
        rd.forward(request, response);
    }

}
