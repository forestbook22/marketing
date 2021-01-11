package controllers.titles;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Fourp;
import models.Pest;
import models.Position;
import models.Seg;
import models.Swot;
import models.Target;
import models.Threec;
import models.Title;
import models.User;
import utils.DBUtil;

/**
 * Servlet implementation class TitlesShowServlet
 */
@WebServlet("/titles/show")
public class TitlesShowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TitlesShowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        User login_user = (User)request.getSession().getAttribute("login_user");
        Title users_title = em.find(Title.class, Integer.parseInt(request.getParameter("id")));

        Fourp f = null;
        Swot s = null;
        Threec t = null;
        Pest p = null;
        Seg se = null;
        Target tar = null;
        Position po = null;

            try {
                f = em.createNamedQuery("getMyAllFourps", Fourp.class)
                                        .setParameter("user", login_user)
                                        .setParameter("title", users_title)
                                        .getSingleResult();
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
            } catch (Exception e) {
                e.printStackTrace();
            }

            try {
                s = em.createNamedQuery("getMyAllSwots", Swot.class)
                                        .setParameter("user", login_user)
                                        .setParameter("title", users_title)
                                        .getSingleResult();
                String strong1 = s.getStrong();
                if(strong1.indexOf("\r\n") >= 1){
                    String strong2 = strong1.replace("\r\n", "z");
                    request.setAttribute("strong", strong2);
                }else{
                    request.setAttribute("strong", s.getStrong());
                }
                String weak1 = s.getWeak();
                if(weak1.indexOf("\r\n") >= 1){
                    String weak2 = weak1.replace("\r\n", "z");
                    request.setAttribute("weak", weak2);
                }else{
                    request.setAttribute("weak", s.getWeak());
                }
                String opp1 = s.getOpp();
                if(opp1.indexOf("\r\n") >= 1){
                    String opp2 = opp1.replace("\r\n", "z");
                    request.setAttribute("opp", opp2);
                }else{
                    request.setAttribute("opp", s.getOpp());
                }
                String thre1 = s.getThre();
                if(thre1.indexOf("\r\n") >= 1){
                    String thre2 = thre1.replace("\r\n", "z");
                    request.setAttribute("thre", thre2);
                }else{
                    request.setAttribute("thre", s.getThre());
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            try {
                t = em.createNamedQuery("getMyAllThreecs", Threec.class)
                                        .setParameter("user", login_user)
                                        .setParameter("title", users_title)
                                        .getSingleResult();
            } catch (Exception e) {
                e.printStackTrace();
            }

            try {
                p = em.createNamedQuery("getMyAllPests", Pest.class)
                                        .setParameter("user", login_user)
                                        .setParameter("title", users_title)
                                        .getSingleResult();
                String poli1 = p.getPoli();
                if(poli1.indexOf("\r\n") >= 1){
                    String poli2 = poli1.replace("\r\n", "z");
                    request.setAttribute("poli", poli2);
                }else{
                    request.setAttribute("poli", p.getPoli());
                }
                String eco1 = p.getEco();
                if(eco1.indexOf("\r\n") >= 1){
                    String eco2 = eco1.replace("\r\n", "z");
                    request.setAttribute("eco", eco2);
                }else{
                    request.setAttribute("eco", p.getEco());
                }
                String soci1 = p.getSoci();
                if(soci1.indexOf("\r\n") >= 1){
                    String soci2 = soci1.replace("\r\n", "z");
                    request.setAttribute("soci", soci2);
                }else{
                    request.setAttribute("soci", p.getSoci());
                }
                String tech1 = p.getTech();
                if(tech1.indexOf("\r\n") >= 1){
                    String tech2 = tech1.replace("\r\n", "z");
                    request.setAttribute("tech", tech2);
                }else{
                    request.setAttribute("tech", p.getTech());
                }

            } catch (Exception e) {
                e.printStackTrace();
            }


            try {
                se = em.createNamedQuery("getMyAllSegs", Seg.class)
                                        .setParameter("user", login_user)
                                        .setParameter("title", users_title)
                                        .getSingleResult();
            } catch (Exception e) {
                e.printStackTrace();
            }

            try {
                tar = em.createNamedQuery("getMyAllTargets", Target.class)
                                        .setParameter("user", login_user)
                                        .setParameter("title", users_title)
                                        .getSingleResult();
            } catch (Exception e) {
                e.printStackTrace();
            }

            try {
                po = em.createNamedQuery("getMyAllPositions", Position.class)
                                        .setParameter("user", login_user)
                                        .setParameter("title", users_title)
                                        .getSingleResult();
                String attri1 = po.getAttri();
                if(attri1.indexOf("\r\n") >= 1){
                    String attri2 = attri1.replace("\r\n", "z");
                    request.setAttribute("attri", attri2);
                }else{
                    request.setAttribute("attri", po.getAttri());
                }
                String benefit1 = po.getBenefit();
                if(benefit1.indexOf("\r\n") >= 1){
                    String benefit2 = benefit1.replace("\r\n", "z");
                    request.setAttribute("benefit", benefit2);
                }else{
                    request.setAttribute("benefit", po.getBenefit());
                }
                String opp1 = po.getOpp();
                if(opp1.indexOf("\r\n") >= 1){
                    String opp2 = opp1.replace("\r\n", "z");
                    request.setAttribute("opp", opp2);
                }else{
                    request.setAttribute("opp", po.getOpp());
                }
                String relation1 = po.getRelation();
                if(relation1.indexOf("\r\n") >= 1){
                    String relation2 = relation1.replace("\r\n", "z");
                    request.setAttribute("relation", relation2);
                }else{
                    request.setAttribute("relation", po.getRelation());
                }
                String distance1 = po.getDistance();
                if(distance1.indexOf("\r\n") >= 1){
                    String distance2 = distance1.replace("\r\n", "z");
                    request.setAttribute("distance", distance2);
                }else{
                    request.setAttribute("distance", po.getDistance());
                }
                String kind1 = po.getKind();
                if(kind1.indexOf("\r\n") >= 1){
                    String kind2 = kind1.replace("\r\n", "z");
                    request.setAttribute("kind", kind2);
                }else{
                    request.setAttribute("kind", po.getKind());
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        em.close();

        request.setAttribute("fourp", f);
        request.setAttribute("swot", s);
        request.setAttribute("threec", t);
        request.setAttribute("pest", p);
        request.setAttribute("seg", se);
        request.setAttribute("target", tar);
        request.setAttribute("position", po);
        request.getSession().setAttribute("users_title", users_title);

        if(request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/titles/show.jsp");
        rd.forward(request, response);
    }
}
