package ctl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import entity.Employee;
import service.EmployeeService;

public class LoginCtl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	EmployeeService es = new EmployeeService();
	RequestDispatcher rd;

	public LoginCtl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		response.sendRedirect("login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String operation = request.getParameter("operation");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");

		if (operation.equals("login")) {
			Employee emp = es.login(userName, password);

			if (emp != null) {
				HttpSession session = request.getSession(true);
				session.setAttribute("emp", emp);
				//rd = request.getRequestDispatcher("home.jsp");
				//rd.forward(request, response);
				response.sendRedirect("home.jsp");
			} else {
				request.setAttribute("msg", "Invalid Credentials");
				response.sendRedirect("login.jsp");
			}
		}

	}

}
