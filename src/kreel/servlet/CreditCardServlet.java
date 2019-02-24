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
 * Servlet implementation class CreditCardServlet
 */
@WebServlet("/CreditCardServlet")
public class CreditCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name, address, country, network, exp;
		int cvv;
		long cardNo;
		double creditLimit;
		
		name = request.getParameter("name");
		address = request.getParameter("add");
		country = request.getParameter("country");
		cardNo = Long.parseLong(request.getParameter("cardno"));
		network = request.getParameter("network");
		exp = request.getParameter("exp");
		cvv = Integer.parseInt(request.getParameter("cvv"));
		creditLimit = Double.parseDouble(request.getParameter("limit"));
		
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");
		
		CreditCardService ccServ = new CreditCardService();
		ccServ.addCreditCard(name, address, country, network, exp, cardNo, cvv, creditLimit, user.getEmail());
		
		String validation = ccServ.validateCreditCard();
		
		if (validation.equals("Credit Card Validation Successful")) {
			
			request.setAttribute("result", ccServ.saveCreditCard());
			session.setAttribute("ccs", ccServ.getCreditCards(user.getEmail()));
			request.getRequestDispatcher("creditcard.jsp").forward(request, response);
			
		} else {
			
			request.setAttribute("result", validation);
			request.getRequestDispatcher("creditcard.jsp").forward(request, response);
			
		}
		
	}

}
