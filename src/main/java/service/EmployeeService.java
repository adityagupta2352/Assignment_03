package service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

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

	public Employee login(String userName, String passWord) {
		Optional<Employee> emp = employeeList.stream()
				.filter(employeeList -> employeeList.getUserName().equals(userName)
						&& employeeList.getPassword().equals(passWord))
				.findFirst();

		if (emp.isPresent()) {
			return emp.get();
		}

		return null;
	}

	public List<Employee> getEmployee() {
		return employeeList;
	}

	public boolean deleteDetails(int empId) {

		boolean check = employeeList.removeIf(emp -> emp.getEmpId() == empId);
		return check;
	}

	public Employee getEmployeeById(int empId) {
		Employee emp = employeeList.stream().filter(e -> e.getEmpId() == empId).findFirst().orElse(null);

		return emp;
	}

	public Employee addDetails(int empIdNew, String firstName, String lastName, double salaryNew, String userName,
			String passWord, boolean isAdminNew) {

		Employee e2 = new Employee();
		e2.setAdmin(isAdminNew);
		e2.setEmpId(empIdNew);
		e2.setFirstName(firstName);
		e2.setLastName(lastName);
		e2.setPassword(passWord);
		e2.setSalary(salaryNew);
		e2.setUserName(userName);
		employeeList.add(e2);

		return e2;
	}

	public Employee updateDetails(int empIdNew, String firstName, String lastName, double salaryNew, String userName,
			String passWord, boolean isAdminNew) {

		List<Employee> updatedList = employeeList.stream().map(emp -> {
			if (emp.getEmpId() == empIdNew) {
				// Update the Employee object here
				emp.setFirstName(firstName);
				emp.setLastName(lastName);
				emp.setSalary(salaryNew);
				emp.setUserName(userName);
				emp.setPassword(passWord);
				emp.setAdmin(isAdminNew);
			}
			return emp;
		}).collect(Collectors.toList());

		// Update your employeeList reference to point to the updatedList
		employeeList = updatedList;

		// Return the updated Employee object if needed
		return employeeList.stream().filter(emp -> emp.getEmpId() == empIdNew).findFirst().orElse(null);
	}

}