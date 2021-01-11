package controllers.fourps;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Fourp;
import utils.DBUtil;

/**
 * Servlet implementation class ReportsShowServlet
 */
@WebServlet("/fourps/show")
public class FourpsShowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FourpsShowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        Fourp f = em.find(Fourp.class, Integer.parseInt(request.getParameter("id")));

        em.close();
        String product1 = f.getProduct();
        if(product1.indexOf("\r\n") >= 1){
            String product2 = product1.replace("\r\n", "z");
            request.setAttribute("product", product2);
        }else{
            request.setAttribute("product", f.getProduct());
        }
        String price1 = f.getPrice();
        if(price1.indexOf("\r\n") >= 1){
            String price2 = price1.replace("\r\n", "z");
            request.setAttribute("price", price2);
        }else{
            request.setAttribute("price", f.getPrice());
        }
        String place1 = f.getPlace();
        if(place1.indexOf("\r\n") >= 1){
            String place2 = place1.replace("\r\n", "z");
            request.setAttribute("place", place2);
        }else{
            request.setAttribute("place", f.getPlace());
        }
        String promotion1 = f.getPromotion();
        if(promotion1.indexOf("\r\n") >= 1){
            String promotion2 = promotion1.replace("\r\n", "z");
            request.setAttribute("promotion", promotion2);
        }else{
            request.setAttribute("promotion", f.getPromotion());
        }
        request.setAttribute("fourp", f);
        request.setAttribute("_token", request.getSession().getId());

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/fourps/show.jsp");
        rd.forward(request, response);
    }

}