package kreel.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kreel.service.CreditCardService;
import kreel.service.LoginService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email, password;

		email = request.getParameter("email");
		password = request.getParameter("pw");

		LoginService logServ = new LoginService();
		CreditCardService ccServ =  new CreditCardService();

		if (logServ.checkLogin(email, password)) {

			HttpSession login = request.getSession(true);
			login.setAttribute("user", logServ.getLoginDetails());
			login.setAttribute("soldi", logServ.getSoldItemDetails(email));
			login.setAttribute("soldu", logServ.getClients());
			login.setAttribute("ccs", ccServ.getCreditCards(email));
			
			response.sendRedirect("profile.jsp");
			
		} else {
			
			request.setAttribute("result", "Incorrect E-Mail or Password");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			
		}

	}

}
