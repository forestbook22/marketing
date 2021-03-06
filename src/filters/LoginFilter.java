package filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/*")
public class LoginFilter implements Filter {

    /**
     * Default constructor.
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

    /**
     * @see Filter#destroy()
     */
    public void destroy() {
        // TODO Auto-generated method stub
    }

    /**
     * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
     */
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        String context_path = ((HttpServletRequest)request).getContextPath();
        String servlet_path = ((HttpServletRequest)request).getServletPath();

        if(!servlet_path.matches("/css.*")) {       // CSSフォルダ内は認証処理から除外する
            HttpSession session = ((HttpServletRequest)request).getSession();

            // セッションスコープに保存された従業員（ログインユーザ）情報を取得
            User u = (User)session.getAttribute("login_user");

            if(!servlet_path.equals("/login")) {        // ログイン画面以外について
                //新規ユーザー登録のみ除外
                if(!servlet_path.matches("/users/new.*") && !servlet_path.matches("/users/create.*")){
                    // ログアウトしている状態であればログイン画面にリダイレクト
                    if(u == null) {
                        ((HttpServletResponse)response).sendRedirect(context_path + "/login");
                        return;
                    }
                        // ユーザー管理機能は管理者のみが閲覧できるようにする
                    if(servlet_path.matches("/users.*") && u.getAdmin_flag() == 0) {
                        ((HttpServletResponse)response).sendRedirect(context_path + "/");
                        return;
                    }
                }
            } else {
                // ログインしているのにログイン画面を表示させようとした場合はシステムのトップページにリダイレクト
                if(u != null) {
                    ((HttpServletResponse)response).sendRedirect(context_path + "/");
                    return;
                }
            }
        }

        chain.doFilter(request, response);
    }

    /**
     * @see Filter#init(FilterConfig)
     */
    public void init(FilterConfig fConfig) throws ServletException {
        // TODO Auto-generated method stub
    }

}