package kreel.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kreel.service.AdminService;

/**
 * Servlet implementation class DeleteCommentServlet
 */
@WebServlet("/DeleteCommentServlet")
public class DeleteCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int commentId = Integer.parseInt(request.getParameter("id"));
		
		String result = AdminService.deleteComment(commentId);
		HttpSession admin = request.getSession(false);
		admin.setAttribute("feedback", AdminService.getFeedback());
		
		request.setAttribute("result", result);
		request.getRequestDispatcher("admin.jsp").forward(request, response);
		
	}

}
