package kreel.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kreel.model.CreditCard;
import kreel.model.Item;
import kreel.model.User;
import kreel.service.CreditCardService;
import kreel.service.ItemListService;
import kreel.service.ItemService;

/**
 * Servlet implementation class ItemServlet
 */
@WebServlet("/ItemServlet")
public class ItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession sendItem = request.getSession(false);

		if (sendItem.getAttribute("user") == null) {
			
			request.setAttribute("result", "Please login to continue");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			
		} else {
			
			User user = (User) sendItem.getAttribute("user");
			Item item = new Item();

			if (sendItem.getAttribute("items") == null) {

				ArrayList<Item> items = ItemListService.getItems();
				int i = 0;
				for (i = 0; i < items.size(); i++) {
					if (items.get(i).getItemId() == Integer.parseInt(request.getParameter("itembut"))) {
						item = items.get(i);
						break;
					}
				}

			} else {

				ArrayList<Item> items = (ArrayList<Item>) sendItem.getAttribute("items");
				int i = 0;
				for (i = 0; i < items.size(); i++) {
					if (items.get(i).getItemId() == Integer.parseInt(request.getParameter("itembut"))) {
						item = items.get(i);
						break;
					}
				}
			}

			CreditCardService ccServ = new CreditCardService();
			
			ArrayList<CreditCard> cards = ccServ.getCreditCards(user.getEmail());
			Double highestBid = ItemService.getHighestBid(item.getItemId());
			String expDate = ItemService.getExpDate(item.getItemId(), highestBid);

			HttpSession object = request.getSession(true);
			object.setAttribute("item", item);
			object.setAttribute("hb", highestBid);
			object.setAttribute("exp", expDate);
			object.setAttribute("cards", cards);
			request.setAttribute("result", null);
			request.getRequestDispatcher("item.jsp").forward(request, response);

		}
		
	}

}
