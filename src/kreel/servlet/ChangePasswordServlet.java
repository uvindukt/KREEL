package kreel.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kreel.model.User;
import kreel.service.ChangePasswordService;

/**
 * Servlet implementation class ChangePasswordServlet
 */
@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pw, npw, cpw;
		
		pw = request.getParameter("pw");
		npw = request.getParameter("npw");
		cpw = request.getParameter("cpw");
		
		HttpSession loggedin = request.getSession(false);

		if (loggedin.getAttribute("user") != null) {
			
			ChangePasswordService pwdServ = new ChangePasswordService();
			
			pwdServ.changePassword(npw, cpw);
			String resultValidation = pwdServ.validatePassword(pw, (User) loggedin.getAttribute("user"));
			
			request.setAttribute("result", resultValidation);
			request.getRequestDispatcher("changepassword.jsp").forward(request, response);
			
			if (resultValidation.equals("Password Successfully Changed"))
				loggedin.setAttribute("user", pwdServ.savePassword((User) loggedin.getAttribute("user")));
				
		}
		
	}

}
