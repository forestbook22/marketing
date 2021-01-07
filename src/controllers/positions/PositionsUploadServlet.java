package controllers.positions;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import models.Title;
import models.User;

@WebServlet("/positions/upload")
@MultipartConfig(location="C:/temp", maxFileSize=1048576)
public class PositionsUploadServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User login_user = (User)request.getSession().getAttribute("login_user");
        Title users_title = (Title)request.getSession().getAttribute("users_title");
        request.setCharacterEncoding("UTF8");
        Part part = request.getPart("file");
        String img = getServletContext().getRealPath("/WEB-INF/uploaded")
                + "/" + login_user.getId() + "_" + users_title.getId() + ".jpg";
        part.write(img);
        response.sendRedirect(request.getContextPath() + "/positions/show?id=" + login_user.getId() );
    }
}