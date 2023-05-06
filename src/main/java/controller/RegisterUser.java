package controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Userdao;
import dto.User;

@WebServlet("/register")
public class RegisterUser extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String firstName=req.getParameter("first name");
		String lastName=req.getParameter("last name");
		long mobile=Long.parseLong(req.getParameter("mobile"));
		String email=req.getParameter("email");
		String gender=req.getParameter("gender");
		String password=req.getParameter("password");
		String confirm_password=req.getParameter("confirm password");
		//import java.sql.Date--- this date starts from 1900---- it will start 1900(i.e, 1)
		Date dob=Date.valueOf(req.getParameter("dob"));
		//LocalDate.now.getYear will give you the current date which belongs to java.lang package
		
		
		int age=Period.between(dob.toLocalDate(), LocalDate.now()).getYears();
		
		if(password.equals(confirm_password))
		{
			if(age>18)
			{
				User user = new User();
				user.setAge(age);
				user.setDob(dob);
				user.setEmail(email);
				user.setFirstname(firstName);
				user.setGender(gender);
				user.setLastname(lastName);
				user.setMobile(mobile);
				user.setPassword(confirm_password);
				
				Userdao dao= new Userdao();
				dao.save(user);
				
				resp.getWriter().print("<h1 style='color:green'>Account Created Successfully<br> </h1>");
				resp.getWriter().print("<h1 style='color:blue'>Your UserId is : "+user.getId()+" </h1>");
				req.getRequestDispatcher("Home.html").include(req, resp);
				
			}
			else
			{
				resp.getWriter().print("<h1 style='color:red'>You are not old enough to create account</h1>");
				req.getRequestDispatcher("Register.html").include(req, resp);
			}
		}
		else
		{
			resp.getWriter().print("<h1 style='color:red'>Password Miss Match</h1>");
			req.getRequestDispatcher("Register.html").include(req, resp);
			
		}
	}
}
