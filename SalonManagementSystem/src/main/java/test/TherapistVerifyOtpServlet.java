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

/**
 * Servlet implementation class TherapistVerifyOtpServlet
 */
@WebServlet("/TherapistVerifyOtpServlet")
public class TherapistVerifyOtpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TherapistVerifyOtpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String username = request.getParameter("username");
        String otp = request.getParameter("otp");

        try 
        {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement("SELECT reset_otp, otp_expiry FROM therapist WHERE username=?");
            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) 
            {
                String dbOtp = rs.getString("reset_otp");
                Timestamp expiry = rs.getTimestamp("otp_expiry");

                if (dbOtp != null && dbOtp.equals(otp) && expiry.after(new Timestamp(System.currentTimeMillis()))) 
                {

                    request.setAttribute("username", username);
                    request.getRequestDispatcher("therapistResetPassword.jsp").forward(request, response);
                } 
                else 
                {
                    request.setAttribute("error", "Invalid or expired OTP!");
                    request.getRequestDispatcher("therapistShowOtp.jsp").forward(request, response);
                }
            }

        } 
        catch (Exception e) 
        {
           System.out.println(e);
        }
	}

}
