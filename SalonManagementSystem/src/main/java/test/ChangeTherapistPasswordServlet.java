package test;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class ChangeTherapistPasswordServlet
 */
@WebServlet("/ChangeTherapistPasswordServlet")
public class ChangeTherapistPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeTherapistPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session = request.getSession(false);

        //Check login
        if (session == null || session.getAttribute("therapistId") == null) 
        {
            response.sendRedirect("therapistLogin.jsp");
            return;
        }

        int therapistId = (Integer) session.getAttribute("therapistId");

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        //Confirm passwords match
        if (!newPassword.equals(confirmPassword)) 
        {
            response.sendRedirect("therapistProfile.jsp?pwd=nomatch");
            return;
        }

        //Check current password
        boolean correct = TherapistDao.checkPassword(therapistId, currentPassword);

        if (!correct) 
        {
            response.sendRedirect("therapistProfile.jsp?pwd=wrong");
            return;
        }

        //Update password
        boolean updated = TherapistDao.updatePassword(therapistId, newPassword);

        if (updated) 
        {
            response.sendRedirect("therapistProfile.jsp?pwd=success");
        } else 
        {
            response.sendRedirect("therapistProfile.jsp?pwd=error");
        }
	}

}
