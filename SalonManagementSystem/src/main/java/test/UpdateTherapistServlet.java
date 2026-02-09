package test;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class UpdateTherapistServlet
 */
@WebServlet("/UpdateTherapistServlet")
public class UpdateTherapistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateTherapistServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session = request.getSession(false);

        //Therapist session check
        if (session == null || session.getAttribute("therapistId") == null) 
        {
            response.sendRedirect("therapistLogin.jsp");
            return;
        }

        int therapistId = (Integer) session.getAttribute("therapistId");

        String name = request.getParameter("editName");
        String email = request.getParameter("editEmail");
        String contact = request.getParameter("editContact");
        String username = request.getParameter("editUsername");

        //DEBUG
        System.out.println("EDIT THERAPIST PROFILE:");
        System.out.println(name + " | " + email + " | " + contact + " | " + username);

        Therapist t = new Therapist();
        t.setTherapistId(therapistId);
        t.setName(name);
        t.setEmail(email);
        t.setContactNo(contact);
        t.setUsername(username);

        boolean updated = TherapistDao.updateTherapistProfile(t);

        System.out.println("UPDATED = " + updated);

        if (updated) 
        {
            response.sendRedirect("therapistProfile.jsp?msg=success");
        } 
        else 
        {
            response.sendRedirect("therapistProfile.jsp?msg=error");
        }
	}

}
