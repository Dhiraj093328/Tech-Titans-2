package test;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class UpdateProfileServlet
 */
@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) 
        {
            response.sendRedirect("userLogin.jsp");
            return;
        }

        int userId = (Integer) session.getAttribute("userId");

        String name = request.getParameter("editName");
        String email = request.getParameter("editEmail");
        String contact = request.getParameter("editContact");
        String username = request.getParameter("editUsername");

        //DEBUG
        System.out.println("EDIT PROFILE:");
        System.out.println(name + " | " + email + " | " + contact + " | " + username);

        User user = new User();
        user.setUserId(userId);
        user.setName(name);
        user.setEmail(email);
        user.setContactNo(contact);
        user.setUsername(username);

        boolean updated = UserDAO.updateUserProfile(user); 

        System.out.println("UPDATED = " + updated);

        response.sendRedirect("userProfile.jsp");
    }



}
