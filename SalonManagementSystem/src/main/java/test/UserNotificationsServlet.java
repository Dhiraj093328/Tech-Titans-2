package test;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/UserNotificationsServlet")
public class UserNotificationsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private Integer getLoggedUserId(HttpSession session) {
        if (session == null) return null;

        Object v1 = session.getAttribute("userId");
        Object v2 = session.getAttribute("user_id");
        Object v3 = session.getAttribute("uid");

        Object val = (v1 != null) ? v1 : (v2 != null) ? v2 : v3;
        if (val == null) return null;

        if (val instanceof Integer) return (Integer) val;
        try { return Integer.parseInt(val.toString()); }
        catch (Exception e) { return null; }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Integer userId = getLoggedUserId(session);

        if (userId == null) {
            response.sendRedirect("userLogin.jsp");
            return;
        }

        AppointmentDao dao = new AppointmentDao();
        List<Appointment> list = dao.getAppointmentsForUser(userId.intValue());


        request.setAttribute("appointments", list);
        request.getRequestDispatcher("userNotifications.jsp").forward(request, response);
        
    }
}


