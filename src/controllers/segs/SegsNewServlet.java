package controllers.segs;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Seg;

/**
 * Servlet implementation class SegsNewServlet
 */
@WebServlet("/segs/new")
public class SegsNewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SegsNewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("_token", request.getSession().getId());

        Seg se = new Seg();
        se.setDate(new Date(System.currentTimeMillis()));
        request.setAttribute("seg", se);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/segs/new.jsp");
        rd.forward(request, response);
    }
}