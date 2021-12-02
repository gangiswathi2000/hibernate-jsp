package com.demo.mypackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.Request;

public class Servlet_to_get extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		RequestDispatcher rd;
		req.setAttribute("getall", "true");
		rd = req.getRequestDispatcher("GetAll.jsp");
		out.println("<h1> hello</h1>");
		rd.forward(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		RequestDispatcher rd;
		String[] names = req.getParameterValues("names");
		if (!(names == null)) {
			@SuppressWarnings("rawtypes")
			List list = Arrays.asList(names);
			req.setAttribute("names", list);
			if (req.getParameter("update") != null) {
				if (list.size() > 1) {
					System.out.println("Please select only one user!");
					doGet(req, res);
				} else {
					if (list.size() == 1) {
						int id = Integer.parseInt((String) list.get(0));
						Employee e = new Employee();
						e = StoreData.getbyid(id);
						HttpSession s = req.getSession();
						s.setAttribute("user", e);
						res.sendRedirect("update.jsp");

					}
				}

			}
			if (req.getParameter("delete") != null) {
				for (int i = 0; i < list.size(); i++) {
					System.out.println(list.get(i));
					int id = Integer.parseInt((String) list.get(i));
					StoreData.delete(id);
				}
				doGet(req, res);
			}

		} else {
			doGet(req, res);
		}

	}
}
