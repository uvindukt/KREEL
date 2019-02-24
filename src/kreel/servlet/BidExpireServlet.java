package kreel.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kreel.model.Item;
import kreel.service.BidExpireService;
import kreel.service.ItemListService;
import kreel.service.ItemService;

/**
 * Servlet implementation class BidExpireServlet
 */
@WebServlet("/BidExpireServlet")
public class BidExpireServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int itemId = Integer.parseInt(request.getParameter("expid"));
		
		double highestBid = ItemService.getHighestBid(itemId);
		BidExpireService.setSold(itemId, highestBid);
		
		ArrayList<Item> items = ItemListService.getItems();
		Item item = new Item();
		
		for (int i = 0 ; i < items.size() ; i++) {
			if (itemId == items.get(i).getItemId())
				item = items.get(i);
		}
		
		
		request.setAttribute("i1", item);
		request.setAttribute("i2", highestBid);
		
		request.getRequestDispatcher("item.jsp").forward(request, response);
		
	}

}
