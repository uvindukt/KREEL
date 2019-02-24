package kreel.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kreel.model.Admin;
import kreel.service.AdminService;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (AdminService.validateSecurityCode(request.getParameter("code")) == true) {
			
			HttpSession admin = request.getSession(true);
			admin.setAttribute("admin", Admin.getAdmin());
			admin.setAttribute("feedback", AdminService.getFeedback());
			admin.setAttribute("solditems", AdminService.getSoldItems());
			request.getRequestDispatcher("admin.jsp").forward(request, response);
			
		} else {
			
			request.setAttribute("result", "Invalid Security Code");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			
		}
		
	}

}
