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
 * Servlet implementation class TherapistLoginServlet
 */
@WebServlet("/TherapistLoginServlet")
public class TherapistLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TherapistLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        String username = request.getParameter("tuser");
        String password = request.getParameter("tpass");

        if (username == null || password == null ||
            username.isEmpty() || password.isEmpty()) 
        {

            request.setAttribute("error", "Username and password are required");
            request.getRequestDispatcher("therapistLogin.jsp").forward(request, response);
            return;
        }

        try 
        {
            Therapist t = TherapistDao.getTherapist(username);

            if (t != null && password.equals(t.getPassword())) 
            {

                HttpSession oldSession = request.getSession(false);
                if (oldSession != null) 
                {
                    oldSession.invalidate();
                }

                HttpSession session = request.getSession(true);
                session.setAttribute("therapistId", t.getTherapistId());
                session.setAttribute("therapistName", t.getName());
                session.setAttribute("therapistUsername", t.getUsername());

                response.sendRedirect("TherapistDashboard.jsp?flash=login");
                return;
            }

            request.setAttribute("error", "Invalid username or password");
            request.getRequestDispatcher("therapistLogin.jsp").forward(request, response);

        } 
        catch (Exception e) 
        {
            System.out.println(e);
            request.setAttribute("error", "Something went wrong. Please try again.");
            request.getRequestDispatcher("therapistLogin.jsp").forward(request, response);
        }
		
	}

}
