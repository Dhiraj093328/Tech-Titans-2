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
 * Servlet implementation class ShopOwnerVerifyOtpServlet
 */
@WebServlet("/ShopOwnerVerifyOtpServlet")
public class ShopOwnerVerifyOtpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopOwnerVerifyOtpServlet() {
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

            PreparedStatement ps = con.prepareStatement("SELECT reset_otp, otp_expiry FROM shop_owner WHERE username=?");
            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) 
            {
                String dbOtp = rs.getString("reset_otp");
                Timestamp expiry = rs.getTimestamp("otp_expiry");

                //OTP + expiry validation
                if (dbOtp != null
                        && dbOtp.equals(otp)
                        && expiry != null
                        && expiry.after(new Timestamp(System.currentTimeMillis()))) 
                {

                    request.setAttribute("username", username);
                    request.getRequestDispatcher("shopOwnerResetPassword.jsp").forward(request, response);

                } 
                else 
                {
                    request.setAttribute("error", "Invalid or expired OTP!");
                    request.setAttribute("username", username);
                    request.getRequestDispatcher("shopOwnerVerifyOtp.jsp").forward(request, response);
                }
            } 
            else 
            {
                request.setAttribute("error", "User not found!");
                request.getRequestDispatcher("shopOwnerForgotPassword.jsp").forward(request, response);
            }

        } 
        catch (Exception e) 
        {
            System.out.println(e);            
            request.setAttribute("error", "Something went wrong!");
            request.getRequestDispatcher("shopOwnerVerifyOtp.jsp").forward(request, response);
        }		
	}

}
