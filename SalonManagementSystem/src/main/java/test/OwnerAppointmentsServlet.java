package test;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/ownerAppointments")
public class OwnerAppointmentsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private Integer getLoggedOwnerId(HttpSession session) {
        if (session == null) return null;

        Object v1 = session.getAttribute("shopOwnerId");
        Object v2 = session.getAttribute("shop_owner_id");
        Object v3 = session.getAttribute("ownerId");

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
        Integer ownerId = getLoggedOwnerId(session);

        if (ownerId == null) {
            response.sendRedirect("shopLogin.jsp");
            return;
        }

        AppointmentDao dao = new AppointmentDao();
        List<Appointment> list = dao.getAppointmentsForOwner(ownerId);

        request.setAttribute("appointments", list);
        request.getRequestDispatcher("ownerAppointments.jsp").forward(request, response);
    }
}
