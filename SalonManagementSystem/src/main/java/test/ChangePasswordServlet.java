package test;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class ChangePasswordServlet
 */
@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {

        HttpSession session = request.getSession(false);

        //Check login
        if (session == null || session.getAttribute("userId") == null) 
        {
            response.sendRedirect("userLogin.jsp");
            return;
        }

        int userId = (Integer) session.getAttribute("userId");

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        //Confirm passwords match
        if (!newPassword.equals(confirmPassword)) 
        {
            response.sendRedirect("userProfile.jsp?pwd=nomatch");
            return;
        }

        //Check current password
        boolean correct = UserDAO.checkPassword(userId, currentPassword);

        if (!correct) 
        {
            response.sendRedirect("userProfile.jsp?pwd=wrong");
            return;
        }

        //Update password
        boolean updated = UserDAO.updatePassword(userId, newPassword);

        if (updated) 
        {
            response.sendRedirect("userProfile.jsp?pwd=success");
        } 
        else 
        {
            response.sendRedirect("userProfile.jsp?pwd=error");
        }
    }

}
