package ctl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.EmployeeService;
import java.io.IOException;

public class InitCtl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	EmployeeService es = new EmployeeService();

	public InitCtl() {
		super();
	}

	@Override
	public void init() throws ServletException {
		es.initalizaerEmployee();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
