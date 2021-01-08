package controllers.positions;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import models.Position;
import models.Title;
import models.User;
import utils.DBUtil;

@WebServlet("/positions/upload")
@MultipartConfig(location="C:/pleiades", maxFileSize=1024*1024)
public class PositionsUploadServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        User login_user = (User)request.getSession().getAttribute("login_user");
        Title users_title = (Title)request.getSession().getAttribute("users_title");
        Position position = null;

        try {
            position = em.createNamedQuery("getMyAllPositions", Position.class)
                                    .setParameter("user", login_user)
                                    .setParameter("title", users_title)
                                    .getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
        }

        em.close();

        request.setCharacterEncoding("UTF8");
        Part part = request.getPart("file");
        String img = "/workspace/marketing/WebContent/uploaded"
                + "/" + login_user.getId() + "_" + users_title.getId() + ".jpg";
        part.write(img);
        response.sendRedirect(request.getContextPath() + "/positions/show?id=" + position.getId() );
    }
}