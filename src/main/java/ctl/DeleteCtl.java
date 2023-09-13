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
 * Servlet implementation class DeleteCtl
 */
public class DeleteCtl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	EmployeeService es = new EmployeeService();
	RequestDispatcher rd;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCtl() {
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
		
		String id = request.getParameter("empId");
		
		try {
			int empId = Integer.parseInt(id);
			
			boolean check = es.deleteDetails(empId);
			
			
			if(check) {
				
				rd = request.getRequestDispatcher("home.jsp");
				rd.forward(request, response);
			
			}
			else {
				
				request.setAttribute("msg", "Invalid Employee ID");
				rd = request.getRequestDispatcher("login.jsp");
				rd.include(request, response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
