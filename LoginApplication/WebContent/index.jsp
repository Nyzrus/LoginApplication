<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="surzyn.loginapplication.model.EmployeeModel" 
		import="java.util.*"
		import="javax.servlet.http.HttpServlet"
		import="javax.servlet.http.HttpServletRequest"
		import="javax.servlet.http.HttpServletResponse"
		import="java.io.PrintWriter"
		import="java.io.IOException"
		import="org.hibernate.Session"
		import="org.hibernate.SessionFactory"
		import="org.hibernate.cfg.Configuration"
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
</head>
<body>
	<h3>Home Page Test</h3>
	<br>
	<form action="EmployeeLoginServlet" method="GET">
	Employee Login<br>
	Username: <input type="text" name="username">
	<br>
	Password: <input type="text" name="password">
	<br>
	<input type="submit">
	</form>
	<form name="createForm" action="addEmployee.html" method="POST">
		<input type="submit" value="Add New Employee">
		<a href="posHome.jsp">posHome</a>
	</form>
	<br><br><br>
<%

SessionFactory sf = new Configuration().configure().buildSessionFactory();
Session s = sf.openSession();

int count = 0;
	try{
		s.beginTransaction();
		List<EmployeeModel> list = s.createCriteria(EmployeeModel.class).list();
		s.getTransaction().commit();
%>
		<table>
			<tr>
				<td>
					First Name
				</td>
				<td>
					Last Name
				</td>
				<td>
					UserName
				</td>
				<td>
					Employee ID
				</td>
			</tr>
<%
		while(count < list.size()){
%>			<tr>
				<td>
<%
				EmployeeModel tempEmployee = list.get(count);
				String employeeFirstName = tempEmployee.getFirstName();
				String employeeLastName = tempEmployee.getLastName();
				String UserName = tempEmployee.getUserName();
				String employeeID = String.valueOf(tempEmployee.getEmployeeID());
%>
				<%=employeeFirstName %>
				</td>
				<td>
				<%= employeeLastName %>
				</td>
				<td>
				<%= UserName %>
				</td>
				<td>
				<%= employeeID %>
				</td>
			<tr>
<%
			count++;
		}
%>
		</table>
<%
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		s.close();
	}

%>


</body>
</html>