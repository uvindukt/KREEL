package kreel.servlet;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kreel.model.CreditCard;
import kreel.model.User;
import kreel.service.BidExpireService;
import kreel.service.BidService;
import kreel.service.CreditCardService;
import kreel.service.LoginService;

/**
 * Servlet implementation class BidServlet
 */
@WebServlet("/BidServlet")
public class BidServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Calendar cal;
		String bidder, bidDateTime, bidExpDateTime;
		int itemId, bidDurationD, bidDurationH, bidDurationM;
		double bid, startPrice;
		long creditCardNo;

		HttpSession loggedin = request.getSession(false);

		if (loggedin.getAttribute("user") != null) {

			User user = (User) loggedin.getAttribute("user");

			bidder = user.getEmail();
			bid = Double.parseDouble(request.getParameter("bid"));
			startPrice = Double.parseDouble(request.getParameter("sp"));
			itemId = Integer.parseInt(request.getParameter("iid"));
			bidDurationD = Integer.parseInt(request.getParameter("bidd"));
			bidDurationH = Integer.parseInt(request.getParameter("bidh"));
			bidDurationM = Integer.parseInt(request.getParameter("bidm"));
			creditCardNo = Long.parseLong(request.getParameter("cc"));

			cal = Calendar.getInstance();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			bidDateTime = sdf.format(cal.getTime());
			cal.add(Calendar.DATE, bidDurationD);
			cal.add(Calendar.HOUR_OF_DAY, bidDurationH);
			cal.add(Calendar.MINUTE, bidDurationM);

			bidExpDateTime = sdf.format(cal.getTime());

			BidService bidServ = new BidService();
			bidServ.addBid(bidder, startPrice, bid, bidDateTime, bidExpDateTime, itemId, creditCardNo);
			CreditCardService ccServ = new CreditCardService();
			CreditCard creditCard = ccServ.getCreditCard(user.getEmail(), creditCardNo);

			String resultValidation = bidServ.checkBid();

			if (resultValidation.equals("Bid Successful")) {

				if (ccServ.isCreditCardExpired(creditCard) == false) {

					if (ccServ.isCreditLimitExeeded(bid, creditCard) == false) {

						String v = bidServ.saveBid();
						bidServ.setExpireTimer(cal);
						request.setAttribute("result", v);
						request.getRequestDispatcher("item.jsp").forward(request, response);

					} else {

						request.setAttribute("result", "Credit Limit Exceeded");
						request.getRequestDispatcher("item.jsp").forward(request, response);

					}

				} else {

					request.setAttribute("result", "Credit Card is expired");
					request.getRequestDispatcher("item.jsp").forward(request, response);

				}

			}

			else {

				request.setAttribute("result", resultValidation);
				request.getRequestDispatcher("item.jsp").forward(request, response);

			}

		}

	}

}
