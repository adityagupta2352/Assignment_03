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

/**
 * Servlet implementation class LoginCtl
 */
public class LoginCtl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	EmployeeService es = new EmployeeService();
	
	RequestDispatcher rd;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCtl() {
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

		String operation = request.getParameter("operation");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		
		if(operation.equals("login"))
		{	
		    Employee emp = es.login(userName, password);
		    
		    if(emp != null)
		    {
		    	HttpSession session = request.getSession();
		    	session.setAttribute("emp" , emp);
				rd = request.getRequestDispatcher("home.jsp");
				rd.include(request , response);
		    }
		    else
		    {
		    	request.setAttribute("msg" , "Invalid Credentials");
		    	rd = request.getRequestDispatcher("login.jsp");
		    	rd.include(request, response);
		    }
     	}
       
	}

}
