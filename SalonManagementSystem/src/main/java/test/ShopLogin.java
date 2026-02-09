package test;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class ShopLogin
 */
@WebServlet("/ShopLogin")
public class ShopLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        String username = request.getParameter("auser");
        String password = request.getParameter("apass");

        try 
        {
            Shop_Owner owner = Shop_OwnerDao.getShopOwner(username);

            if (owner != null && password != null && password.equals(owner.getPassword())) 
            {

                HttpSession oldSession = request.getSession(false);
                if (oldSession != null) 
                {
                    oldSession.invalidate();
                }

                HttpSession session = request.getSession(true);
                session.setAttribute("ownerId", owner.getShop_owner_id());
                session.setAttribute("ownerName", owner.getOwner_name());
                session.setAttribute("ownerUsername", owner.getUsername());

                response.sendRedirect(request.getContextPath() + "/AdminDashboard.jsp");
                return;
            }

            request.setAttribute("error", "Invalid username or password");
            request.getRequestDispatcher("adminLogin.jsp").forward(request, response);

        } 
        catch (Exception e) 
        {
            System.out.println(e);
            request.setAttribute("error", "Something went wrong. Please try again.");
            request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
        }
		
	}

}
