package test;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class UserLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        User u = UserDAO.login(
            req.getParameter("username"),
            req.getParameter("password")
        );

        if (u != null) {
            HttpSession session = req.getSession();
            session.setAttribute("userId", u.getUserId());
            session.setAttribute("userName", u.getName());

            res.sendRedirect("salons.jsp");
        } else {
            res.sendRedirect("userLogin.jsp");
        }
    }
}
