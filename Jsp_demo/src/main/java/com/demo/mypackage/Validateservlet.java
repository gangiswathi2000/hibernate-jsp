package com.demo.mypackage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Validateservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		RequestDispatcher rd;
	
	String admin=req.getParameter("admin");
	String pass=req.getParameter("pass");
	
//		Cookie c = new Cookie("user", req.getParameter("admin"));
//		Cookie c1 = new Cookie("pass", req.getParameter("pass"));
	if (!("admin".equals(admin)) && !("admin@123".equals(pass))) {
			rd = req.getRequestDispatcher("Home.jsp");
			out.println(
					"<h3 style=\"text-align: center;\"><font color=red>Please provide valid credentials!</font></h3>");
			rd.include(req, res);
		} else if (!"admin".equals(admin)) {
			rd = req.getRequestDispatcher("Home.jsp");
			out.println("<h3 style=\"text-align: center;\"><font color=red>Please provide valid username!</font></h3>");
			rd.include(req, res);
		} else if (!"admin@123".equals(pass)) {
			rd = req.getRequestDispatcher("Home.jsp");
			out.println("<h3 style=\"text-align: center;\"><font color=red>Please provide valid password!</font></h3>");
			rd.include(req, res);
		} 
		else {
			HttpSession session= req.getSession();
			req.getSession().setAttribute("alert", "success");
	        session.setAttribute("admin",admin);
			// out.println("<div style=\"margin:85px; color:green;\" class=\"shadow-lg p-3
			// mb-5 bg-white rounded\"><strong>Login successfull!!</strong></div>");
			res.sendRedirect("servlet");
			
		}
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		res.setContentType("text/html");
		RequestDispatcher rd;
		req.setAttribute("res", "true");
		rd = req.getRequestDispatcher("getbyid.jsp");
		rd.forward(req, res);
	}

}
