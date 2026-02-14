package test;

import java.sql.Date;
import java.sql.Time;

public class Appointment {

    private int appointmentId;
    private int userId;
    private int shopOwnerId;
    private int serviceId;

    private String userName;
    private String userEmail;

    private String shopName;
    private String serviceName;

    private Date appointmentDate;
    private Time timeSlot;
    private String status;

    public int getAppointmentId() { return appointmentId; }
    public void setAppointmentId(int appointmentId) { this.appointmentId = appointmentId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public int getShopOwnerId() { return shopOwnerId; }
    public void setShopOwnerId(int shopOwnerId) { this.shopOwnerId = shopOwnerId; }

    public int getServiceId() { return serviceId; }
    public void setServiceId(int serviceId) { this.serviceId = serviceId; }

    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }

    public String getUserEmail() { return userEmail; }
    public void setUserEmail(String userEmail) { this.userEmail = userEmail; }

    public String getShopName() { return shopName; }
    public void setShopName(String shopName) { this.shopName = shopName; }

    public String getServiceName() { return serviceName; }
    public void setServiceName(String serviceName) { this.serviceName = serviceName; }

    public Date getAppointmentDate() { return appointmentDate; }
    public void setAppointmentDate(Date appointmentDate) { this.appointmentDate = appointmentDate; }

    public Time getTimeSlot() { return timeSlot; }
    public void setTimeSlot(Time timeSlot) { this.timeSlot = timeSlot; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
