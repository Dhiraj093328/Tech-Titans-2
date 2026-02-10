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
import java.time.LocalDateTime;
import java.util.Random;

/**
 * Servlet implementation class TherapistForgotPasswordServlet
 */
@WebServlet("/TherapistForgotPasswordServlet")
public class TherapistForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TherapistForgotPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String username = request.getParameter("username");

        try 
        {
            Connection con = DBConnection.getConnection();

            //Check therapist exists
            PreparedStatement ps = con.prepareStatement("SELECT therapist_id FROM therapist WHERE username=?");
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) 
            {

                //Generate OTP + expiry
                String otp = String.valueOf(100000 + new Random().nextInt(900000));
                LocalDateTime expiry = LocalDateTime.now().plusMinutes(5);

                //Update OTP in DB
                PreparedStatement upd = con.prepareStatement("UPDATE therapist SET reset_otp=?, otp_expiry=? WHERE username=?");
                upd.setString(1, otp);
                upd.setTimestamp(2, Timestamp.valueOf(expiry));
                upd.setString(3, username);
                upd.executeUpdate();

               
                request.setAttribute("username", username);
                request.setAttribute("otp", otp); 

                request.getRequestDispatcher("therapistVerifyOtp.jsp").forward(request, response);

            } 
            else 
            {
                request.setAttribute("error", "Username not found!");
                request.getRequestDispatcher("therapistForgotPassword.jsp").forward(request, response);
            }

        } 
        catch (Exception e) 
        {
            System.out.println(e);
            request.setAttribute("error", "Something went wrong!");
            request.getRequestDispatcher("therapistForgotPassword.jsp").forward(request, response);
        }
	}

}
