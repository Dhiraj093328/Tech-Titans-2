package test;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        User u = new User();
        u.setName(req.getParameter("name"));
        u.setEmail(req.getParameter("email"));
        u.setContactNo(req.getParameter("contact"));
        u.setUsername(req.getParameter("username"));
        u.setPassword(req.getParameter("password"));

        boolean isRegistered = UserDAO.register(u);

        if (isRegistered) {
            // Redirect to registration page with success flag
            res.sendRedirect(req.getContextPath() + "/userRegister.jsp?success=true");
        } else {
            // Registration failed
            res.sendRedirect(req.getContextPath() + "/userRegister.jsp?error=true");
        }
    }
}
