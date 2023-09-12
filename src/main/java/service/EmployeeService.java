package service;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import entity.Employee;

public class EmployeeService {

	private static List<Employee> employeeList = new ArrayList<Employee>();
	
	public void initalizaerEmployee() {
		
		Employee e1 = new Employee();
		e1.setAdmin(true);
		e1.setEmpId(101);
		e1.setFirstName("Jay");
		e1.setLastName("Singh");
		e1.setPassword("123");
		e1.setSalary(10000);
		e1.setUserName("Aditya");
		employeeList.add(e1);
		
		Employee e2 = new Employee();
		e2.setAdmin(false);
		e2.setEmpId(102);
		e2.setFirstName("Viru");
		e2.setLastName("Singh");
		e2.setPassword("123");
		e2.setSalary(10000);
		e2.setUserName("Piyush");
		employeeList.add(e2);
	}
	
	public Employee login(String userName , String passWord)
	{
	    Optional<Employee> emp = employeeList.stream().filter(employeeList -> employeeList.getUserName().equals(userName) && employeeList.getPassword().equals(passWord)).findFirst();
	
	    if(emp.isPresent())
	    {
	    	return emp.get();
	    }
	    
	    return null;
	}
	
	public List<Employee> getEmployee(){
		return employeeList;
	}
	
}
