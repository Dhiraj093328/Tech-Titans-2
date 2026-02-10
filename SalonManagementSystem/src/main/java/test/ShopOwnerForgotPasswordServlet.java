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
 * Servlet implementation class ShopOwnerForgotPasswordServlet
 */
@WebServlet("/ShopOwnerForgotPasswordServlet")
public class ShopOwnerForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopOwnerForgotPasswordServlet() {
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

            //Check shop owner exists
            PreparedStatement ps = con.prepareStatement("SELECT shop_owner_id FROM shop_owner WHERE username=?");
            ps.setString(1, username);
            
            ResultSet rs = ps.executeQuery();

            if (rs.next()) 
            {

                //Generate OTP + expiry
                String otp = String.valueOf(100000 + new Random().nextInt(900000));
                LocalDateTime expiry = LocalDateTime.now().plusMinutes(5);

                //Store OTP in DB
                PreparedStatement upd = con.prepareStatement("UPDATE shop_owner SET reset_otp=?, otp_expiry=? WHERE username=?");
                upd.setString(1, otp);
                upd.setTimestamp(2, Timestamp.valueOf(expiry));
                upd.setString(3, username);
                upd.executeUpdate();

                //IMPORTANT (for OTP display in JSP)
                request.setAttribute("username", username);
                request.setAttribute("otp", otp);

                //Forward to OTP page
                request.getRequestDispatcher("shopOwnerVerifyOtp.jsp").forward(request, response);

            } 
            else 
            {
                request.setAttribute("error", "Username not found!");
                request.getRequestDispatcher("shopOwnerForgotPassword.jsp").forward(request, response);
            }

        } 
        catch (Exception e) 
        {
            System.out.println(e);
            request.setAttribute("error", "Something went wrong!");
            request.getRequestDispatcher("shopOwnerForgotPassword.jsp").forward(request, response);
        }
	}

}
