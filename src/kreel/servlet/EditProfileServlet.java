package kreel.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kreel.model.User;
import kreel.service.EditProfileService;

/**
 * Servlet implementation class EditProfileServlet
 */
@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String fname, lname, email, tel, dob, no, st, ct, di;

		fname = request.getParameter("fname");
		lname = request.getParameter("lname");
		email = request.getParameter("email");
		tel = request.getParameter("tel");
		dob = request.getParameter("dob");
		no = request.getParameter("no");
		st = request.getParameter("st");
		ct = request.getParameter("ct");
		di = request.getParameter("di");

		HttpSession loggedin = request.getSession(false);

		if (loggedin.getAttribute("user") != null) {

			User currentUser = (User) loggedin.getAttribute("user");

			EditProfileService edProServ = new EditProfileService();

			edProServ.editUser(fname, lname, email, tel, dob, no, st, ct, di);
			String resultValidation = edProServ.validateEdit();

			request.setAttribute("result", resultValidation);
			request.getRequestDispatcher("editprofile.jsp").forward(request, response);
			
			if (resultValidation.equals("Profile Updated")) {
				
				User updatedUser = (User) edProServ.updateUser(currentUser);
				loggedin.setAttribute("user", updatedUser);
				
			}

		}
	}

}
