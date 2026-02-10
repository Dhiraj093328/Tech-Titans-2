package test;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Random;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ForgotPasswordServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {

        String username = request.getParameter("username");

        try 
        {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement("SELECT user_id FROM users WHERE username=?");
            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) 
            {

                //To Generate 6-digit OTP
                String otp = String.valueOf(100000 + new Random().nextInt(900000));

                //OTP expiry = current time + 5 minutes
                Timestamp expiry = new Timestamp(System.currentTimeMillis() + (5 * 60 * 1000));

                PreparedStatement upd = con.prepareStatement("UPDATE users SET reset_otp=?, otp_expiry=? WHERE username=?");
                upd.setString(1, otp);
                upd.setTimestamp(2, expiry);
                upd.setString(3, username);
                upd.executeUpdate();

               
                request.setAttribute("otp", otp);
                request.setAttribute("username", username);

                request.getRequestDispatcher("showOtp.jsp").forward(request, response);

            } 
            else 
            {
                request.setAttribute("error", "Username not found!");
                request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
            }

        } 
        catch (Exception e) 
        {
            System.out.println(e);
        }
    }
}