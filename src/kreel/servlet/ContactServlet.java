package kreel.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kreel.model.User;
import kreel.service.ContactService;

/**
 * Servlet implementation class ContactServlet
 */
@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String fname, email, tel, cmnt;

		HttpSession loggedin = request.getSession(false);

		if (loggedin.getAttribute("user") != null) {

			User user = (User) loggedin.getAttribute("user");

			fname = user.getFirstName();
			email = user.getEmail();
			tel = user.getTelephone();
			cmnt = request.getParameter("cmnt");

		} else {

			fname = request.getParameter("fname");
			email = request.getParameter("email");
			tel = request.getParameter("tel");
			cmnt = request.getParameter("cmnt");

		}

		ContactService conServ = new ContactService();

		conServ.addContact(fname, email, tel, cmnt);

		String resultValidation = conServ.validateContact();

		request.setAttribute("result", resultValidation);
		request.getRequestDispatcher("contact.jsp").forward(request, response);

		if (resultValidation.equals("Comment Submitted"))
			conServ.saveContact();

	}

}
