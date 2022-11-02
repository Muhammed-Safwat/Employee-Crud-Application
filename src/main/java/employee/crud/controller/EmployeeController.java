package employee.crud.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.ObjectWriter;

import employee.crud.beans.Employee;
import employee.crud.dao.EmployeeDAO;
import employee.crud.dao.EmployeeDAOImpl;

@WebServlet("/")
public class EmployeeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// Dao object
	private EmployeeDAO employeeDAO;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		employeeDAO = new EmployeeDAOImpl();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("EmployeeController ,doPost method Started");
		String action = request.getServletPath();
		System.out.println("doPost, action==> " + action);
		try {
			switch (action) {
			case "/list":
				getAllEmployees(request, response);
				break;
			case "/add":
				addEmployee(request, response);
				break;
			case "/delete":
				deleteEmployee(request, response);
				break;
			case "/get":
				getEmployee(request, response);
				break;
			case "/update":
				updateEmployee(request, response);
				break;
			default:
				getAllEmployees(request, response);
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);

	}

	private void updateEmployee(HttpServletRequest request, HttpServletResponse response) {
		try
		{
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			String address = request.getParameter("address");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			
			Employee employee = new Employee(id, name , email , address, phone);		
			boolean result = employeeDAO.updateEmployee(employee);
			System.out.println("updateEmployee result ==>" + result);
			
			List<Employee> employees = employeeDAO.getAllEmployees();
			System.out.println("updateEmployee employees ==>" + employees.size());
			
			request.setAttribute("employees", employees);
			request.setAttribute("updateEmployee", result+"");
			 
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("/employee-crud-project");

		try {
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	private void getEmployee(HttpServletRequest request, HttpServletResponse response) throws JsonGenerationException, JsonMappingException, IOException {
		System.out.println("start getEmployee ==>");
		System.out.println("Entering getEmployee");
		
		int employeeId = Integer.parseInt(request.getParameter("employeeId"));
		System.out.println("getEmployee, employeeId==>" + employeeId);
		
		Employee employee = null;
		try {
			employee = employeeDAO.getEmployee(employeeId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		System.out.println("getEmployee, employee details==>" + employee);
		
		//request.setAttribute("employee", employee);
		ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
		String employeeAsJSON = ow.writeValueAsString(employee);
		response.getOutputStream().write(employeeAsJSON.getBytes());
	}

	private void deleteEmployee(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			String employeeIds = request.getParameter("employeeIds");
			StringTokenizer tokenizer = new StringTokenizer(employeeIds, ",");
			
			while(tokenizer.hasMoreTokens())
			{
				String employeeId = tokenizer.nextElement().toString();
				System.out.println("Employee ID to be deleted,  employeeId ==>" + employeeId);
				
				boolean result = employeeDAO.deleteEmployee(Integer.parseInt(employeeId));
				System.out.println("is employeeId " + employeeId + " deleted ? " +  result);
			}			
			
			List<Employee> employees = employeeDAO.getAllEmployees();
			System.out.println("insertResult employees ==>" + employees.size());
			
			request.setAttribute("employees", employees);
			//request.setAttribute("deleteUser", result+"");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/employeeView.jsp");

			try {
				dispatcher.forward(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		catch (Exception e) 
		{			
			e.printStackTrace();
		}
	}

	private void addEmployee(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("start addEmployee ==>");

		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");

		Employee employee = new Employee(name, email, phone, address);
		System.out.println("Employee Details ==>" + employee.toString());

		boolean result = false;

		try {
			result = employeeDAO.addEmployee(employee);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println(" Add employee Result ==>" + result);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/employee-crud-project");

		try {
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void getAllEmployees(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("start getAllEmployees ==>");

		List<Employee> employees = null;
		try {
			employees = employeeDAO.getAllEmployees();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println("list size  ==> " + employees.toString());
		request.setAttribute("employees", employees);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/employeeView.jsp");
		
		try {
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
