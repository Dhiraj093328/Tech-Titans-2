package test;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class TherapistRegisterServlet
 */
@WebServlet("/TherapistRegisterServlet")
public class TherapistRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TherapistRegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String name = request.getParameter("tname");
        String email = request.getParameter("tmail");
        String contact = request.getParameter("tcontact");
        String username = request.getParameter("tuser");
        String password = request.getParameter("tpass");

        if (name == null || email == null || contact == null ||
        	    username == null || password == null ||
        	    name.isEmpty() || email.isEmpty() || contact.isEmpty() ||
        	    username.isEmpty() || password.isEmpty()) 
           {

        	    request.setAttribute("error", "All fields are required");
        	    request.getRequestDispatcher("therapistRegister.jsp").forward(request, response);
        	    return;
        	}

        Therapist t = new Therapist();
        t.setName(name);
        t.setEmail(email);
        t.setContactNo(contact);   
        t.setUsername(username);
        t.setPassword(password);

        int status = TherapistDao.saveTherapist(t); 

        if (status > 0) 
        {
            response.sendRedirect("therapistLogin.jsp?flash=register");
        } 
        else 
        {
            request.setAttribute("error", "Registration failed. Username or email may already exist.");
            request.getRequestDispatcher("therapistRegister.jsp").forward(request, response);
        }
	}

}
