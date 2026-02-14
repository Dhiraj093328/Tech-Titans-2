package test;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;

@WebServlet("/userBookAppointment")
public class UserBookAppointmentServlet extends HttpServlet {
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Integer userIdObj = getLoggedUserId(session);

        if (userIdObj == null) {
            response.sendRedirect("userLogin.jsp");
            return;
        }

        int userId = userIdObj.intValue();

        try {
            String shopOwnerIdStr = request.getParameter("shopOwnerId");
            String serviceIdStr = request.getParameter("serviceId");
            String dateStr = request.getParameter("appointmentDate"); // yyyy-mm-dd
            String timeStr = request.getParameter("timeSlot");        // HH:mm

            if (shopOwnerIdStr == null || serviceIdStr == null || dateStr == null || timeStr == null ||
                shopOwnerIdStr.isBlank() || serviceIdStr.isBlank() || dateStr.isBlank() || timeStr.isBlank()) {

                response.sendRedirect("bookAppointment.jsp?error=missingData");
                return;
            }

            int shopOwnerId = Integer.parseInt(shopOwnerIdStr);
            int serviceId = Integer.parseInt(serviceIdStr);

            Date apDate = Date.valueOf(dateStr);

            // Convert "HH:mm" -> "HH:mm:00" for Time.valueOf
            if (timeStr.length() == 5) timeStr = timeStr + ":00";
            Time timeSlot = Time.valueOf(timeStr);

            AppointmentDao dao = new AppointmentDao();

            // ✅ DAO method name from updated AppointmentDao
            boolean ok = dao.insertAppointment(userId, shopOwnerId, serviceId, apDate, timeSlot);

            if (ok) {
                // After booking, show notifications (or any success page you want)
                response.sendRedirect(request.getContextPath() + "/UserNotificationsServlet");
            } else {
                response.sendRedirect("bookAppointment.jsp?shopOwnerId=" + shopOwnerId + "&error=insertFailed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("bookAppointment.jsp?error=invalidData");
        }
    }
}
