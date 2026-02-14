package test;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

public class AppointmentDao {

    // ✅ INSERT NEW APPOINTMENT (Status = PENDING)
    public boolean insertAppointment(int userId, int shopOwnerId, int serviceId, Date appointmentDate, Time timeSlot) {

        String sql = "INSERT INTO appointments (user_id, shop_owner_id, service_id, appointment_date, time_slot, status) " +
                     "VALUES (?, ?, ?, ?, ?, 'PENDING')";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ps.setInt(2, shopOwnerId);
            ps.setInt(3, serviceId);
            ps.setDate(4, appointmentDate);
            ps.setTime(5, timeSlot);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // ✅ UPDATE STATUS (ACCEPTED / REJECTED)
    public boolean updateAppointmentStatus(int appointmentId, String status) {

        String sql = "UPDATE appointments SET status=? WHERE appointment_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, status);
            ps.setInt(2, appointmentId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // ✅ OWNER: GET ONLY PENDING APPOINTMENTS (with user name/email + salon + service)
    public List<Appointment> getAppointmentsForOwner(int ownerId) {

        List<Appointment> list = new ArrayList<>();

        String sql =
            "SELECT a.appointment_id, a.user_id, a.shop_owner_id, a.service_id, " +
            "       a.appointment_date, a.time_slot, a.status, " +
            "       s.service_name, so.shop_name, u.name AS user_name, u.email AS user_email " +
            "FROM appointments a " +
            "JOIN services s ON a.service_id = s.service_id " +
            "JOIN shop_owner so ON a.shop_owner_id = so.shop_owner_id " +
            "JOIN users u ON a.user_id = u.user_id " +
            "WHERE a.shop_owner_id = ? AND a.status = 'PENDING' " +
            "ORDER BY a.appointment_id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, ownerId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Appointment a = new Appointment();

                    a.setAppointmentId(rs.getInt("appointment_id"));
                    a.setUserId(rs.getInt("user_id"));
                    a.setShopOwnerId(rs.getInt("shop_owner_id"));
                    a.setServiceId(rs.getInt("service_id"));

                    a.setAppointmentDate(rs.getDate("appointment_date"));
                    a.setTimeSlot(rs.getTime("time_slot"));

                    String st = rs.getString("status");
                    a.setStatus((st == null || st.trim().isEmpty()) ? "PENDING" : st);

                    a.setServiceName(rs.getString("service_name"));
                    a.setShopName(rs.getString("shop_name"));

                    a.setUserName(rs.getString("user_name"));
                    a.setUserEmail(rs.getString("user_email"));

                    list.add(a);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ✅ USER: GET APPOINTMENTS (Notifications)
    public List<Appointment> getAppointmentsForUser(int userId) {

        List<Appointment> list = new ArrayList<>();

        String sql =
            "SELECT a.appointment_id, a.user_id, a.shop_owner_id, a.service_id, " +
            "       a.appointment_date, a.time_slot, a.status, " +
            "       s.service_name, so.shop_name " +
            "FROM appointments a " +
            "JOIN services s ON a.service_id = s.service_id " +
            "JOIN shop_owner so ON a.shop_owner_id = so.shop_owner_id " +
            "WHERE a.user_id = ? " +
            "ORDER BY a.appointment_id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Appointment a = new Appointment();

                    a.setAppointmentId(rs.getInt("appointment_id"));
                    a.setUserId(rs.getInt("user_id"));
                    a.setShopOwnerId(rs.getInt("shop_owner_id"));
                    a.setServiceId(rs.getInt("service_id"));

                    a.setAppointmentDate(rs.getDate("appointment_date"));
                    a.setTimeSlot(rs.getTime("time_slot"));

                    String st = rs.getString("status");
                    a.setStatus((st == null || st.trim().isEmpty()) ? "PENDING" : st);

                    a.setServiceName(rs.getString("service_name"));
                    a.setShopName(rs.getString("shop_name"));

                    list.add(a);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ✅ GET SINGLE APPOINTMENT (for email later)
    public Appointment getAppointmentById(int appointmentId) {

        String sql =
            "SELECT a.appointment_id, a.user_id, a.shop_owner_id, a.service_id, " +
            "       a.appointment_date, a.time_slot, a.status, " +
            "       s.service_name, so.shop_name, u.name AS user_name, u.email AS user_email " +
            "FROM appointments a " +
            "JOIN services s ON a.service_id = s.service_id " +
            "JOIN shop_owner so ON a.shop_owner_id = so.shop_owner_id " +
            "JOIN users u ON a.user_id = u.user_id " +
            "WHERE a.appointment_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, appointmentId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Appointment a = new Appointment();

                    a.setAppointmentId(rs.getInt("appointment_id"));
                    a.setUserId(rs.getInt("user_id"));
                    a.setShopOwnerId(rs.getInt("shop_owner_id"));
                    a.setServiceId(rs.getInt("service_id"));

                    a.setAppointmentDate(rs.getDate("appointment_date"));
                    a.setTimeSlot(rs.getTime("time_slot"));

                    String st = rs.getString("status");
                    a.setStatus((st == null || st.trim().isEmpty()) ? "PENDING" : st);

                    a.setServiceName(rs.getString("service_name"));
                    a.setShopName(rs.getString("shop_name"));

                    a.setUserName(rs.getString("user_name"));
                    a.setUserEmail(rs.getString("user_email"));

                    return a;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
