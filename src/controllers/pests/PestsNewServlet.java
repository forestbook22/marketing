package controllers.pests;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Pest;

/**
 * Servlet implementation class PestsNewServlet
 */
@WebServlet("/pests/new")
public class PestsNewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PestsNewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("_token", request.getSession().getId());

        Pest p = new Pest();
        p.setDate(new Date(System.currentTimeMillis()));
        request.setAttribute("pest", p);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/pests/new.jsp");
        rd.forward(request, response);
    }
}
