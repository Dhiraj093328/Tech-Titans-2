package test;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class UserLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        User u = UserDAO.login(username, password);

        if (u != null) {
            HttpSession session = req.getSession(true);
            session.setAttribute("userId", u.getUserId());
            session.setAttribute("userName", u.getName());

            // Redirect to dashboard on success
            res.sendRedirect(req.getContextPath() + "/UserDashboard.jsp");
        } else {
            // Forward to login page with error
            req.setAttribute("error", "Invalid username or password");
            req.getRequestDispatcher("/userLogin.jsp").forward(req, res);
        }
    }
}
