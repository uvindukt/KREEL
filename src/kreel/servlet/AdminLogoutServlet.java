package kreel.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminLogoutServlet
 */
@WebServlet("/AdminLogoutServlet")
public class AdminLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession admin = request.getSession(false);
		
		if (admin.getAttribute("admin") != null) {
			
			admin.removeAttribute("admin");
			admin.removeAttribute("feedback");
			admin.removeAttribute("bids");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			
		} else {
			
			request.getRequestDispatcher("login.jsp").forward(request, response);
			
		}
		
	}

}
