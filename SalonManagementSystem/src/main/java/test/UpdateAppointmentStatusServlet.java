package test;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@WebServlet("/updateAppointmentStatus")
public class UpdateAppointmentStatusServlet extends HttpServlet {

    private final AppointmentDao appointmentDao = new AppointmentDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String appointmentIdStr = request.getParameter("appointmentId");
        String status = request.getParameter("status"); // ACCEPTED / REJECTED

        if (appointmentIdStr == null || status == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing appointmentId/status");
            return;
        }

        int appointmentId;
        try {
            appointmentId = Integer.parseInt(appointmentIdStr);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid appointmentId");
            return;
        }

        boolean updated = appointmentDao.updateAppointmentStatus(appointmentId, status);
        System.out.println("Status updated = " + updated);

        if (!updated) {
            response.sendRedirect(request.getContextPath() + "/ownerAppointments?msg=updateFailed");
            return;
        }

        // ✅ Fetch appointment details (includes user email/name/shop/service)
        Appointment ap = appointmentDao.getAppointmentById(appointmentId);

        boolean mailSent = false;
        String mailMsg = "";

        if (ap != null && ap.getUserEmail() != null && !ap.getUserEmail().trim().isEmpty()) {

            String subject = "Appointment " + status + " - " + ap.getShopName();

            String body =
                    "Hello " + ap.getUserName() + ",\n\n" +
                    "Your appointment has been " + status + ".\n\n" +
                    "Salon: " + ap.getShopName() + "\n" +
                    "Service: " + ap.getServiceName() + "\n" +
                    "Date: " + ap.getAppointmentDate() + "\n" +
                    "Time: " + ap.getTimeSlot() + "\n\n" +
                    "Thank you,\nBeauty Hub";

            try {
                System.out.println("Sending email to: " + ap.getUserEmail());
                EmailUtil.sendEmail(ap.getUserEmail(), subject, body);
                mailSent = true;
                mailMsg = "Email sent to user successfully!";
            } catch (Exception e) {
                e.printStackTrace();
                mailSent = false;
                mailMsg = "Email sending failed!";
            }

        } else {
            mailSent = false;
            mailMsg = "User email not found!";
            System.out.println("Email not sent: user email missing for appointmentId=" + appointmentId);
        }

        // ✅ Redirect with popup flags
        String encodedMsg = URLEncoder.encode(mailMsg, StandardCharsets.UTF_8);
        response.sendRedirect(request.getContextPath() + "/ownerAppointments?mailSent=" + mailSent + "&status=" + status + "&mailMsg=" + encodedMsg);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.sendRedirect(req.getContextPath() + "/ownerAppointments");
    }
}
