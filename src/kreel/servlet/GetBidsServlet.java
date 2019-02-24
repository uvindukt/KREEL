package kreel.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kreel.model.Bid;
import kreel.service.AdminService;

/**
 * Servlet implementation class GetBidsServlet
 */
@WebServlet("/GetBidsServlet")
public class GetBidsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String startDate, endDate;
		
		startDate = request.getParameter("sdate");
		endDate = request.getParameter("edate");
		
		ArrayList<Bid> bids = AdminService.getBids(startDate, endDate);
		
		HttpSession admin = request.getSession(false);
		admin.setAttribute("bids", bids);
		
		request.getRequestDispatcher("admin.jsp").forward(request, response);
		
	}

}
