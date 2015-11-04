package surzyn.loginapplication.loginservlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import surzyn.loginapplication.model.EmployeeModel;

/**
 * Servlet implementation class CreateEmployeeServlet
 */
@WebServlet("/CreateEmployeeServlet")
public class CreateEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateEmployeeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		
		
		
		if(confirmPassword(password, confirmPassword)){
			addEmployeeToDatabase(firstName, lastName, password, userName);
			out.print("Success");
			out.print("<form action='index.jsp' method='POST'><input type='submit' value='Back to Login'></form>");
		}else{
			out.print("Retry");
		}	
	}
	
	public boolean checkForm(){
		return false;
	}
	
	public boolean confirmPassword(String password1, String password2){
		return password1.equals(password2);
	}
	
	public void addEmployeeToDatabase(String firstName, String lastName, String password, String userName){
		EmployeeModel em = new EmployeeModel();
		em.setFirstName(firstName);
		em.setLastName(lastName);
		em.setUserName(userName);
		em.setEmployeePassword(password);
		
		SessionFactory sf = new Configuration().configure().buildSessionFactory();
		Session session = sf.openSession();
		try{
			session.beginTransaction();
			session.save(em);
			session.getTransaction().commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
	}

}
