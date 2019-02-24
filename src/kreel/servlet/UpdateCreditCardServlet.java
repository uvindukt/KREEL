package kreel.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kreel.model.User;
import kreel.service.CreditCardService;

/**
 * Servlet implementation class UpdateCreditCardServlet
 */
@WebServlet("/UpdateCreditCardServlet")
public class UpdateCreditCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		long creditCardNo = Long.parseLong(request.getParameter("ind"));
		double creditLimit = 0;
		String result;

		if (request.getParameter("val") != "")
			creditLimit = Double.parseDouble(request.getParameter("val"));

		CreditCardService ccServ = new CreditCardService();

		if (creditLimit != 0)
			result = ccServ.updateCreditCard(creditCardNo, creditLimit);
		else
			result = "Please enter a value before submitting";

		HttpSession session = request.getSession(false);
		session.setAttribute("ccs", ccServ.getCreditCards(((User) session.getAttribute("user")).getEmail()));

		request.setAttribute("result", result);
		request.getRequestDispatcher("creditcard.jsp").forward(request, response);

	}

}
