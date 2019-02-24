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
 * Servlet implementation class DeleteCreditCardServlet
 */
@WebServlet("/DeleteCreditCardServlet")
public class DeleteCreditCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		long creditCardNo = Long.parseLong(request.getParameter("id"));
		
		CreditCardService ccServ = new CreditCardService();
		String result = ccServ.deleteCreditCard(creditCardNo);
		
		HttpSession session = request.getSession(false);
		session.setAttribute("ccs", ccServ.getCreditCards(((User)session.getAttribute("user")).getEmail()));
		
		request.setAttribute("result", result);
		request.getRequestDispatcher("creditcard.jsp").forward(request, response);
		
	}

}
