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

/**
 * Servlet implementation class UpdateCtl
 */
public class UpdateCtl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	EmployeeService es = new EmployeeService();
	RequestDispatcher rd;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCtl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String empId = request.getParameter("empId");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String salary = request.getParameter("salary");
		String userName = request.getParameter("userName");
		String passWord = request.getParameter("password");
		String isAdmin = request.getParameter("isAdmin");
		
		int empIdNew = Integer.parseInt(empId);
		double salaryNew = Double.parseDouble(salary);
		boolean isAdminNew = Boolean.parseBoolean(isAdmin);
	  
        Employee emp;
		
		emp = es.updateDetails(empIdNew , firstName , lastName , salaryNew , userName ,passWord , isAdminNew);
		rd = request.getRequestDispatcher("home.jsp");
		rd.forward(request, response);
		
	}

}
