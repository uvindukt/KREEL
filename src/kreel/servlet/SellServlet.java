package kreel.servlet;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kreel.model.User;
import kreel.service.SellService;

/**
 * Servlet implementation class SellServlet
 */
@WebServlet("/SellServlet")
public class SellServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String itemName, category, description, sellerId, imagePath;
		double startingPrice;
		int bidDurationD, bidDurationH, bidDurationM;

		HttpSession loggedin = request.getSession(false);
		User user = (User) loggedin.getAttribute("user");

		itemName = request.getParameter("iname");
		category = request.getParameter("category");
		description = request.getParameter("idesc");
		imagePath = request.getParameter("iimg");
		sellerId = user.getEmail();
		startingPrice = Double.parseDouble(request.getParameter("sprice"));
		bidDurationD = Integer.parseInt(request.getParameter("bdurationd"));
		bidDurationH = Integer.parseInt(request.getParameter("bdurationh"));
		bidDurationM = Integer.parseInt(request.getParameter("bdurationm"));
		
		SellService sellServ = new SellService();
		sellServ.addItem(itemName, category, description, startingPrice, bidDurationD, bidDurationH, bidDurationM,
				imagePath, sellerId);

		String resultValidation = sellServ.validateItem();

		if (resultValidation.equals("Item Added Successfully")) {

			request.setAttribute("result", sellServ.saveItem());
			request.getRequestDispatcher("sell.jsp").forward(request, response);

		} else {

			request.setAttribute("result", resultValidation);
			request.getRequestDispatcher("sell.jsp").forward(request, response);

		}

	}

}
