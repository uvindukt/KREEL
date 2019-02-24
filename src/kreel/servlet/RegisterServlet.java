package kreel.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kreel.service.RegisterService;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String firstName, lastName, email, password, confirmPassword, telephoneNo, dateOfBirth, houseNo, street, city, district, bank, bankAccountNo;

		firstName = request.getParameter("fname");
		lastName = request.getParameter("lname");
		email = request.getParameter("email");
		password = request.getParameter("pw");
		confirmPassword = request.getParameter("cpw");
		telephoneNo = request.getParameter("tel");
		dateOfBirth = request.getParameter("dob");
		houseNo = request.getParameter("no");
		street = request.getParameter("st");
		city = request.getParameter("ct");
		district = request.getParameter("di");
		bank = request.getParameter("bank");
		bankAccountNo = request.getParameter("acc");
		
		RegisterService regServ = new RegisterService();
		
		regServ.addUser(firstName, lastName, email, password, confirmPassword, telephoneNo, dateOfBirth, houseNo, street, city, district, bank, bankAccountNo);
		String resultValidation = regServ.validateRegister();
		
		if (resultValidation.equals("Registration Validated")) {
			request.setAttribute("result", regServ.saveUser());
			request.getRequestDispatcher("register.jsp").forward(request, response);
		} else {
			request.setAttribute("result", resultValidation);
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}

	}

}
