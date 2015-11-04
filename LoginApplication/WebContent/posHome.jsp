<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"
			import="java.util.*" %>
<%@ page import="surzyn.loginapplication.model.EmployeeShiftModel"
			import="surzyn.loginapplication.model.OrderModel" 
			import="surzyn.loginapplication.model.FoodItemModel" 
			import="org.hibernate.Session"
			import="org.hibernate.SessionFactory"
			import="org.hibernate.cfg.Configuration" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>POS Home</title>
</head>
<body>

<%
String date = request.getParameter("clockIn");
String userName = request.getParameter("username");
%>


<form onsubmit="testMethod()">
	<h3>User: <%= userName %></h3>
	<br>
	Clocked in at: <%= date %>
	<br>
	<input type="submit" name="newOrder" value="Place Order">
	<input type="submit" name="deleteOrder" value="Delete Order">
	<input type="submit" name="clockOut" value="Clock Out">
</form>


<%
	if(request.getParameter("newOrder")!=null || request.getParameter("itemList")!=null){
		
		
%>
	<form name="orderForm" action="placeOrder()">
	<br><br><br>
		Add Items to Order<br>
		Enter Table Number:<input type="text" name="tableNumber"/>
		<br>
		<select name="itemList" size="4" Multiple>
			<option>Burger</option>
			<option>Beer</option>
			<option>Fries</option>
			<option>Pizza</option>
		</select>
		<input type="submit" name="placeOrder"/>
	</form>
<%
	}
	if(request.getParameter("placeOrder")!=null){
		
		String order = request.getParameter("itemList");
		
		FoodItemModel fim = new FoodItemModel();
		fim.setItemName(order);
		fim.setItemPrice(10);
		System.out.println("check");
		OrderModel om = new OrderModel();
		om.setItem(fim);
		om.setTableNumber(2);
		
		try{
			SessionFactory sf = new Configuration().configure().buildSessionFactory();
			Session se = sf.openSession();
			se.beginTransaction();
			se.save(om);
			se.getTransaction().commit();
			se.close();
		}catch(Exception sql){
			sql.printStackTrace();
			System.out.println("Exception");
		}finally{
			
		}
		
		System.out.println("Exception");
		
	}
%>
	
<%
	if(request.getParameter("deleteOrder")!=null){
		//request.setAttribute("placeOrder", null);
	}
	if(request.getParameter("itemList")!=null){
		System.out.println("Order consists of " + request.getParameter("itemList") +" at Table " + request.getParameter("tableNumber"));
	}
	if(request.getParameter("clockOut")!=null){
		Date clockouttime = new Date();
		Date clockintime = new Date();
		request.setAttribute("clockIn", clockintime);
		long diff = Math.abs(clockouttime.getTime() - clockintime.getTime());
		long diffDays = diff / (24 * 60 * 60 * 1000);
		System.out.println(diffDays);
	}
%>


</body>
</html>