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
import java.sql.Time;

/**
 * Servlet implementation class UpdateShopOwnerServlet
 */
@WebServlet("/UpdateShopOwnerServlet")
public class UpdateShopOwnerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateShopOwnerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session = request.getSession(false);

        //Session check
        if (session == null || session.getAttribute("ownerId") == null) 
        {
            response.sendRedirect("adminLogin.jsp");
            return;
        }

        int shopOwnerId = (int) session.getAttribute("ownerId");

        //Read form data
        String ownerName = request.getParameter("ownerName");
        String shopName = request.getParameter("shopName");
        String email = request.getParameter("editEmail");
        String contactNo = request.getParameter("editContact");
        String username = request.getParameter("editUsername");
        String registrationNo = request.getParameter("registrationNo");

        Time openingTime = Time.valueOf(request.getParameter("openingTime") + ":00");
        Time closingTime = Time.valueOf(request.getParameter("closingTime") + ":00");

        //DEBUG LOG
        System.out.println("UPDATE OWNER PROFILE:");
        System.out.println(ownerName + " | " + shopName + " | " + email + " | " + contactNo);

        String sql = "UPDATE shop_owner SET "
                   + "owner_name=?, shop_name=?, email=?, contact_no=?, username=?, "
                   + "registration_no=?, opening_time=?, closing_time=? "
                   + "WHERE shop_owner_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) 
        {

            ps.setString(1, ownerName);
            ps.setString(2, shopName);
            ps.setString(3, email);
            ps.setString(4, contactNo);
            ps.setString(5, username);
            ps.setString(6, registrationNo);
            ps.setTime(7, openingTime);
            ps.setTime(8, closingTime);
            ps.setInt(9, shopOwnerId);

            int updated = ps.executeUpdate();

            if (updated > 0) 
            {
                response.sendRedirect("ownerProfile.jsp?update=success");
            } 
            else 
            {
                response.sendRedirect("ownerProfile.jsp?update=failed");
            }

        } 
        catch (Exception e) 
        {
            System.out.println(e);
            response.sendRedirect("ownerProfile.jsp?update=error");
        }
	}

}
