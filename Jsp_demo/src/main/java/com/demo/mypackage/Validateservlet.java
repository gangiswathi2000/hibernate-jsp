package com.demo.mypackage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Validateservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		RequestDispatcher rd;
		Cookie c = new Cookie("user", req.getParameter("admin"));
		Cookie c1 = new Cookie("pass", req.getParameter("pass"));
		if (!("admin".equals(c.getValue().toString())) && !("admin@123".equals(c1.getValue().toString()))) {
			rd = req.getRequestDispatcher("Home.jsp");
			out.println(
					"<h3 style=\"text-align: center;\"><font color=red>Please provide valid credentials!</font></h3>");
			rd.include(req, res);
		} else if (!"admin".equals(c.getValue().toString())) {
			rd = req.getRequestDispatcher("Home.jsp");
			out.println("<h3 style=\"text-align: center;\"><font color=red>Please provide valid username!</font></h3>");
			rd.include(req, res);
		} else if (!"admin@123".equals(c1.getValue().toString())) {
			rd = req.getRequestDispatcher("Home.jsp");
			out.println("<h3 style=\"text-align: center;\"><font color=red>Please provide valid password!</font></h3>");
			rd.include(req, res);
		} else {
			req.getSession().setAttribute("alert", "success");
			// out.println("<div style=\"margin:85px; color:green;\" class=\"shadow-lg p-3
			// mb-5 bg-white rounded\"><strong>Login successfull!!</strong></div>");
			rd = req.getRequestDispatcher("Index.jsp");
			rd.include(req, res);
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
