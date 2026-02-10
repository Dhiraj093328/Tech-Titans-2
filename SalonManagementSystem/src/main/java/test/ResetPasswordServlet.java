package test;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class ResetPasswordServlet
 */
@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirm = request.getParameter("confirm");

        if (!password.equals(confirm)) 
        {
            request.setAttribute("error", "Passwords do not match!");
            request.setAttribute("username", username);
            request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
            return;
        }

        try 
        {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement("UPDATE users SET password=?, reset_otp=NULL, otp_expiry=NULL WHERE username=?");
            ps.setString(1, password);
            ps.setString(2, username);
            ps.executeUpdate();

            request.setAttribute("success", "Password updated successfully! Redirecting to login…");
            request.getRequestDispatcher("resetPassword.jsp").forward(request, response);


        } 
        catch (Exception e) 
        {
            System.out.println(e);
        }
	}

}