package test;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class ChangeOwnerPasswordServlet
 */
@WebServlet("/ChangeOwnerPasswordServlet")
public class ChangeOwnerPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeOwnerPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("ownerId") == null) 
        {
            response.sendRedirect("adminLogin.jsp");
            return;
        }

        int ownerId = (Integer) session.getAttribute("ownerId");

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        //Empty check
        if (currentPassword == null || newPassword == null || confirmPassword == null ||
            currentPassword.isEmpty() || newPassword.isEmpty() || confirmPassword.isEmpty()) 
        {
            response.sendRedirect("ownerProfile.jsp?pwd=empty");
            return;
        }

        if (!newPassword.equals(confirmPassword)) 
        {
            response.sendRedirect("ownerProfile.jsp?pwd=nomatch");
            return;
        }

        try (Connection con = DBConnection.getConnection();
        		
             PreparedStatement ps1 = con.prepareStatement("SELECT password FROM shop_owner WHERE shop_owner_id=?")) {

            ps1.setInt(1, ownerId);

            try (ResultSet rs = ps1.executeQuery()) 
            {

                if (!rs.next()) 
                {
                    response.sendRedirect("ownerProfile.jsp?pwd=error");
                    return;
                }

                if (!rs.getString("password").equals(currentPassword)) 
                {
                    response.sendRedirect("ownerProfile.jsp?pwd=wrong");
                    return;
                }
            }

            try (PreparedStatement ps2 = con.prepareStatement("UPDATE shop_owner SET password=? WHERE shop_owner_id=?")) 
            {

                ps2.setString(1, newPassword);
                ps2.setInt(2, ownerId);
                ps2.executeUpdate();
            }

            response.sendRedirect("ownerProfile.jsp?pwd=success");

        } 
        catch (Exception e) 
        {
            System.out.println(e);
            response.sendRedirect("ownerProfile.jsp?pwd=error");
        }
	}

}
