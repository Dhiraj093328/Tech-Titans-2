package test;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;

@WebServlet("/bookAppointment")
public class BookAppointmentServlet extends HttpServlet {

    private final AppointmentDao appointmentDao = new AppointmentDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("userLogin.jsp");
            return;
        }

        int userId = Integer.parseInt(session.getAttribute("userId").toString());

        String shopOwnerIdStr = request.getParameter("shopOwnerId");
        String serviceIdStr = request.getParameter("serviceId");
        String dateStr = request.getParameter("appointmentDate");
        String timeStr = request.getParameter("timeSlot");

        // If shopOwnerId missing -> your old "missingOwner" issue
        if (shopOwnerIdStr == null || shopOwnerIdStr.isBlank()) {
            response.sendRedirect(request.getContextPath() + "/MySalons.jsp?error=missingOwner");
            return;
        }

        try {
            int shopOwnerId = Integer.parseInt(shopOwnerIdStr);
            int serviceId = Integer.parseInt(serviceIdStr);

            Date appointmentDate = Date.valueOf(dateStr); // format: yyyy-mm-dd
            Time timeSlot = Time.valueOf(timeStr + ":00"); // if "10:30" -> "10:30:00"

            boolean ok = appointmentDao.insertAppointment(userId, shopOwnerId, serviceId, appointmentDate, timeSlot);

            if (ok) {
                response.sendRedirect(request.getContextPath() + "/UserNotificationsServlet");
            } else {
                response.sendRedirect(request.getContextPath() + "/MySalons.jsp?error=insertFailed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/MySalons.jsp?error=invalidData");
        }
    }

    // Optional: if you open booking form by GET
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.sendRedirect(request.getContextPath() + "/MySalons.jsp");
    }
}
