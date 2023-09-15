package ctl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.EmployeeService;
import java.io.IOException;
import entity.Employee;

public class DeleteCtl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	EmployeeService es = new EmployeeService();
	RequestDispatcher rd;

	public DeleteCtl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int empId = Integer.parseInt(request.getParameter("empId"));
		boolean check = es.deleteDetails(empId);

		if (check) {
			response.sendRedirect("home.jsp");
		} else {
			response.sendRedirect("home.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
